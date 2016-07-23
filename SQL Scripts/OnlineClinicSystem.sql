/*
** Copyright Team 04, RLL, Wipro
** All Rights Reserved.
*/

SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='OnlineClinicSystem')
		drop database OnlineClinicSystem
GO

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE OnlineClinicSystem
  ON PRIMARY (NAME = N''OnlineClinicSystem'', FILENAME = N''' + @device_directory + N'OnlineClinicSystem.mdf'')
  LOG ON (NAME = N''OnlineClinicSystem_log'',  FILENAME = N''' + @device_directory + N'OnlineClinicSystem.ldf'')')
GO

EXEC sp_dboption 'OnlineClinicSystem','trunc. log on chkpt.','true'
EXEC sp_dboption 'OnlineClinicSystem','select into/bulkcopy','true'
GO

set quoted_identifier on
GO

/* Set DATEFORMAT so that the date strings are interpreted correctly regardless of
   the default DATEFORMAT on the server.
*/
SET DATEFORMAT mdy
GO

USE "OnlineClinicSystem"
GO

CREATE TABLE LoginCredentials
	(
	UserType BIT NOT NULL,
	UserID INT IDENTITY(2000,1) PRIMARY KEY,
	Pwd VARBINARY(200) NOT NULL,
	LoginStatus BIT NOT NULL,
	FirstTime BIT NULL,
	LastLoginTime DATETIME NULL,
	LastLoginIP VARCHAR(20) NULL,
	FailedLoginTime DATETIME NULL,
	FailedLoginIP VARCHAR(20) NULL,
	)
GO
	
CREATE TABLE UserDetails
	(
	UserID INT PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	DOB DATE NOT NULL,
	Gender VARCHAR(6)NOT NULL,
	Address1 VARCHAR(30) NOT NULL,
	Address2 VARCHAR(30) NULL,
	PhoneNo VARCHAR(15) NOT NULL,
	Email VARCHAR(20) NULL,
	)
GO	
	
CREATE TABLE Doctor
	(
	DoctorID INT IDENTITY(1000,1) PRIMARY KEY,
	Name VARCHAR(30)NOT NULL,
	DOB DATE NOT NULL,
	DOJ DATE NOT NULL,
	Gender VARCHAR(6) NOT NULL,
	Qualification VARCHAR(20) NOT NULL,
	Specialization VARCHAR(15) NOT NULL,
	YOE INT NOT NULL,
	Address1 VARCHAR(30) NOT NULL,
	Address2 VARCHAR(30) NULL,
	PhoneNo VARCHAR(15) NOT NULL,
	)
GO	
	
CREATE TABLE Appointment
	(
	ApptID INT IDENTITY(3000,1) PRIMARY KEY,
	PatientID INT NOT NULL,
	DoctorID INT NOT NULL,
	ApptDate DATE NOT NULL,
	MajorSlotNo INT NOT NULL,
	MinorSlotNo INT NOT NULL,
	AilmentName VARCHAR(30) NULL,
	DaySinceInfected INT NULL,
	ModificationAlwd INT NOT NULL,
	Modified BIT NULL,
	Cancelled BIT NULL,
	)
GO

CREATE TABLE Schedule
	(
	DoctorID INT NOT NULL,
	ShiftDate DATE NOT NULL,
	ShiftStart DATETIME NOT NULL,
	ShiftEnd DATETIME NOT NULL,
	MorningSlots INT NOT NULL,
	EveningSlots INT NOT NULL,
	DocAvailable BIT NOT NULL,
	ModificationAlwd INT NOT NULL,
	CONSTRAINT SchedulePK PRIMARY KEY  CLUSTERED(DoctorID,ShiftDate),
	)
GO	
	
CREATE TABLE UserPermissions
	(
	UserID INT PRIMARY KEY,
	ChangePass SMALLINT NOT NULL,
	NewAppt SMALLINT NOT NULL,
	)
GO		
		
CREATE TABLE AdminPermissions
	(
	DoctorID INT PRIMARY KEY,
	AddSchedule SMALLINT NOT NULL,
	)
GO

CREATE PROC AddUserDetails
	 @FirstName VARCHAR(20),
         @LastName VARCHAR(20),
         @DOB DATETIME,
         @Gender VARCHAR(6),
         @Address1 VARCHAR(30),
         @Address2 VARCHAR(30),
         @PhoneNo VARCHAR(15),
         @Email VARCHAR(20),
         @Password VARCHAR(20)
	AS
BEGIN
	INSERT INTO LoginCredentials(UserType,Pwd,LoginStatus,FirstTime)
	VALUES(0,ENCRYPTBYPASSPHRASE('rrl',@Password),0,1)
	
	SELECT @@IDENTITY AS VALUE
	DECLARE @UserID INT
	SET @UserID=SCOPE_IDENTITY()
	
	INSERT INTO UserDetails
	VALUES(@UserID,@FirstName,@LastName,@DOB,@Gender,@Address1,@Address2,@PhoneNo,@Email)
	
	INSERT INTO UserPermissions
	VALUES(@UserID,3,2)
END	
GO

CREATE PROC AddDoctorDetails
	@Name VARCHAR(30),
	@DOB DATETIME,
	@DOJ DATETIME,
	@Gender VARCHAR(6),
	@Qualification VARCHAR(20),
	@Specialization VARCHAR(15),
	@YOE INT,
	@Address1 VARCHAR(30),
	@Address2 VARCHAR(30),
	@PhoneNo VARCHAR(15)
	As
	
BEGIN
	
	INSERT INTO Doctor
	VALUES(@Name,@DOB,@DOJ,@Gender,@Qualification,@Specialization,@YOE,@Address1,@Address2,@PhoneNo)
	
	SELECT @@IDENTITY AS VALUE
	DECLARE @DoctorID INT
	SET @DoctorID=SCOPE_IDENTITY()
	
	INSERT INTO AdminPermissions
	VALUES(@DoctorID,1)
END
GO
	

CREATE PROC ViewDoctorDetails
@DoctorID INT
AS

BEGIN
SELECT * FROM Doctor
WHERE DoctorID=@DoctorID

END
GO

CREATE PROC UserLogin
(
@UserID INT,
@Password VARCHAR(20)
)
AS
BEGIN
DECLARE @OriginalPWD VARCHAR(20)= (SELECT CONVERT(VARCHAR,DECRYPTBYPASSPHRASE('rrl',Pwd)) 
								FROM LoginCredentials WHERE UserID=@UserID)
DECLARE @Status BIT= (SELECT LoginStatus FROM LoginCredentials WHERE UserID=@UserID)

IF((@OriginalPWD=@Password) AND (@Status=0))
	BEGIN
	SELECT L.LoginStatus, L.UserType, L.FirstTime, U.FirstName
	FROM LoginCredentials AS L INNER JOIN UserDetails AS U
	ON L.UserID = U.UserID
	WHERE L.UserID=@UserID
	END

IF(@Status=1)
	BEGIN
	UPDATE LoginCredentials
	SET FailedLoginTime=GETDATE(), FailedLoginIP=HOST_NAME()
	WHERE UserID=@UserID
	END
END
GO

CREATE PROC ChangePassword
@UserID INT,
@Password VARCHAR(20),
@NewPassword VARCHAR(20)
AS

BEGIN

DECLARE @OldPassword VARCHAR(20)
DECLARE @Permission INT
SET @OldPassword= (SELECT CONVERT(VARCHAR,DECRYPTBYPASSPHRASE('rrl',Pwd)) FROM LoginCredentials WHERE UserID=@UserID)
SET @Permission= (SELECT ChangePass FROM UserPermissions WHERE UserID=@UserID)

IF((@OldPassword=@Password) AND (@Permission>0))
	BEGIN
	UPDATE LoginCredentials
	SET Pwd=ENCRYPTBYPASSPHRASE('rrl',@NewPassword)
	WHERE UserID=@UserID
	
	UPDATE UserPermissions
	SET ChangePass=ChangePass-1
	WHERE UserID=@UserID
	END	
END
GO

CREATE PROC ViewUserDetails
@UserID INT
AS

BEGIN
SELECT * FROM UserDetails
WHERE UserID=@UserID

END
GO

CREATE PROC EditUserDetails
	 @UserID INT,
	 @FirstName VARCHAR(20),
         @LastName VARCHAR(20),
         @DOB DATETIME,
         @Gender VARCHAR(6),
         @Address1 VARCHAR(30),
         @Address2 VARCHAR(30),
         @PhoneNo VARCHAR(15),
         @Email VARCHAR(20)
	AS
BEGIN

	UPDATE UserDetails
	SET FirstName=@FirstName,LastName=@LastName,DOB=@DOB,Gender=@Gender,Address1=@Address1,Address2=@Address2,PhoneNo=@PhoneNo,Email=@Email
	WHERE UserID=@UserID
	
END	
GO

CREATE PROC ModifyDoctorDetails
	@DoctorID INT,
	@Name VARCHAR(30),
	@DOB DATETIME,
	@DOJ DATETIME,
	@Gender VARCHAR(6),
	@Qualification VARCHAR(20),
	@Specialization VARCHAR(15),
	@YOE INT,
	@Address1 VARCHAR(30),
	@Address2 VARCHAR(30),
	@PhoneNo VARCHAR(15)
	As
	
BEGIN
	
	UPDATE Doctor
	SET Name=@Name,DOB=@DOB,DOJ=@DOJ,Gender=@Gender,
	Qualification=@Qualification,Specialization=@Specialization,
	YOE=@YOE,Address1=@Address1,Address2=@Address2,PhoneNo=@PhoneNo
	WHERE DoctorID=@DoctorID

END
GO

CREATE PROC DeleteDoctorDetails
@DoctorID INT
AS
BEGIN
	DELETE FROM Doctor
	WHERE DoctorID=@DoctorID

	UPDATE Appointment
	SET Cancelled=1, Modified=1 
	WHERE DoctorID=@DoctorID
	
	DELETE FROM AdminPermissions
	WHERE DoctorID=@DoctorID
	
	DELETE FROM Schedule
	WHERE DoctorID=@DoctorID
END
GO

CREATE PROC AddMonthlySchedule
(
	@DoctorID INT,
	@StartDate DATETIME,
	@ShiftStart DATETIME,
	@ShiftEnd DATETIME
	)
	AS
BEGIN

	
	DECLARE @MorningSlots INT
	IF(@ShiftEnd<'13:00:00')
	SET @MorningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE SET @MorningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,'13:00:00'))/15)
	IF(@MorningSlots<0) SET @MorningSlots=0
	
	DECLARE @EveningSlots INT
	IF(@ShiftStart>'14:00:00')
	SET @EveningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE SET @EveningSlots= ((SELECT DATEDIFF(MINUTE,'14:00:00',@ShiftEnd))/15)
	IF(@EveningSlots<0) SET @EveningSlots=0
	
	DECLARE @Permission INT= (SELECT AddSchedule FROM AdminPermissions WHERE DoctorID=@DoctorID)
	DECLARE @FirstDate DATETIME= (SELECT DATEADD(DD,-DATEPART(DD,@StartDate)+1,@StartDate))
	DECLARE @LastDate DATETIME= (SELECT DATEADD(DD,-1,DATEADD(M,1,@FirstDate)))
	
	
	
	
	IF((@Permission>0) AND 
		EXISTS(SELECT * FROM Doctor WHERE DoctorID=@DoctorID))
	BEGIN
	WHILE(@FirstDate <= @LastDate)
		BEGIN
		INSERT INTO Schedule
		VALUES(@DoctorID,@FirstDate,@ShiftStart,@ShiftEnd,@MorningSlots,@EveningSlots,1,2)
		SET @FirstDate= DATEADD(DD, 1, @FirstDate)
		END
	UPDATE AdminPermissions
	SET AddSchedule=AddSchedule-1
	WHERE DoctorID=@DoctorID
	END
	
END
GO


CREATE PROC ModifyDailySchedule
(
	@DoctorID INT,
	@ShiftDate DATETIME,
	@ShiftStart DATETIME,
	@ShiftEnd DATETIME,
	@DoctorAvailability BIT
	)
	AS
BEGIN

	
	DECLARE @MorningSlots INT
	IF(@ShiftEnd<'13:00:00')
	SET @MorningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE SET @MorningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,'13:00:00'))/15)
	IF((@MorningSlots<0) OR (@DoctorAvailability=0)) SET @MorningSlots=0
	
	DECLARE @EveningSlots INT
	IF(@ShiftStart>'14:00:00')
	SET @EveningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE SET @EveningSlots= ((SELECT DATEDIFF(MINUTE,'14:00:00',@ShiftEnd))/15)
	IF((@EveningSlots<0) OR (@DoctorAvailability=0)) SET @EveningSlots=0
	
	DECLARE @Permission INT= (SELECT ModificationAlwd FROM Schedule WHERE DoctorID=@DoctorID AND ShiftDate=@ShiftDate)
	DECLARE @BookedMorningSlots INT= (SELECT COUNT(MinorSlotNo) FROM Appointment WHERE DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=1 AND Cancelled=0)
	DECLARE @BookedEveningSlots INT= (SELECT COUNT(MinorSlotNo) FROM Appointment WHERE DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=2 AND Cancelled=0)
	

	IF((@Permission>0) AND 
		EXISTS(SELECT * FROM Doctor WHERE DoctorID=@DoctorID))
	BEGIN
	
		UPDATE Appointment 
		SET Modified=1
		WHERE MinorSlotNo<=@MorningSlots AND
		DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=1
		
		UPDATE Appointment 
		SET Modified=1, Cancelled=1
		WHERE MinorSlotNo>@MorningSlots AND
		DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=1
		
		UPDATE Appointment 
		SET Modified=1
		WHERE MinorSlotNo<=@EveningSlots AND
		DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=2
		
		UPDATE Appointment 
		SET Modified=1, Cancelled=1
		WHERE MinorSlotNo>@EveningSlots AND
		DoctorID=@DoctorID AND ApptDate=@ShiftDate AND MajorSlotNo=2
		
		SET @MorningSlots=@MorningSlots-@BookedMorningSlots
		SET @EveningSlots=@EveningSlots-@BookedEveningSlots
		IF(@MorningSlots<0) SET @MorningSlots=0
		IF(@EveningSlots<0) SET @EveningSlots=0
	
		UPDATE Schedule
		SET ModificationAlwd=ModificationAlwd-1, 
		MorningSlots=@MorningSlots, EveningSlots=@EveningSlots, DocAvailable=@DoctorAvailability,
		ShiftStart=@ShiftStart, ShiftEnd=@ShiftEnd
		WHERE DoctorID=@DoctorID AND ShiftDate=@ShiftDate
		
	END
	
END
GO

CREATE PROC CancelAppointment
@ApptID INT
AS
BEGIN

DECLARE @DoctorID INT= (SELECT DoctorID FROM Appointment WHERE ApptID=@ApptID)
DECLARE @ApptDate DATETIME=(SELECT ApptDate FROM Appointment WHERE ApptID=@ApptID)
DECLARE @MajorSlotNo INT= (SELECT MajorSlotNo FROM Appointment WHERE ApptID=@ApptID)
DECLARE @MinorSlotNo INT= (SELECT MinorSlotNo FROM Appointment WHERE ApptID=@ApptID)

UPDATE Appointment 
SET Cancelled=1
WHERE ApptID=@ApptID

UPDATE Schedule
		SET MorningSlots=CASE
							WHEN (@MajorSlotNo=1) THEN MorningSlots+1
							ELSE MorningSlots
							END,
			EveningSlots=CASE
							WHEN (@MajorSlotNo=2) THEN EveningSlots+1
							ELSE EveningSlots
							END
		WHERE DoctorID= @DoctorID AND ShiftDate= @ApptDate
	
UPDATE Appointment 
SET MinorSlotNo=MinorSlotNo-1, Modified=1
WHERE MajorSlotNo=@MajorSlotNo AND MinorSlotNo>@MinorSlotNo

END
GO


CREATE PROC RequestAppointment
	@DoctorID INT,
	@PatientID INT,
	@AppointmentDate DATETIME,
	@SlotPreference INT,
	@DaysSinceInfected INT,
	@AilmentName VARCHAR(30)
AS
BEGIN
	DECLARE @ShiftStart DATETIME = (SELECT ShiftStart FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @ShiftEnd DATETIME = (SELECT ShiftEnd FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	
	DECLARE @MorningSlots INT = (SELECT MorningSlots FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @TotalMorningSlots INT
		IF(@ShiftEnd<'13:00:00')
		SET @TotalMorningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
		ELSE
		SET @TotalMorningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,'13:00:00'))/15)
		IF(@TotalMorningSlots<0) SET @TotalMorningSlots=0
	
								
	DECLARE @EveningSlots INT= (SELECT EveningSlots FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @TotalEveningSlots INT 
		IF(@ShiftStart>'14:00:00')
		SET @TotalEveningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
		ELSE
		SET @TotalEveningSlots=((SELECT DATEDIFF(MINUTE,'14:00:00',@ShiftEnd))/15)
		IF(@TotalEveningSlots<0) SET @TotalEveningSlots=0
	
	
	DECLARE @Permission INT=  (SELECT NewAppt FROM UserPermissions WHERE UserID=@PatientID)
 
	
	IF((@Permission>0) AND (NOT EXISTS(SELECT * FROM Appointment 
		WHERE ApptDate=@AppointmentDate AND PatientID=@PatientID
		AND ((MajorSlotNo=@SlotPreference) OR (DoctorID=@DoctorID)))))
	BEGIN
	IF((@SlotPreference=1) AND (@MorningSlots>0))
		BEGIN
		INSERT INTO Appointment
		VALUES(@PatientID,@DoctorID,@AppointmentDate,@SlotPreference,
		@TotalMorningSlots-@MorningSlots+1,@AilmentName,@DaysSinceInfected,2,0,0)
		SELECT @@IDENTITY
		
		UPDATE Schedule
		SET MorningSlots= MorningSlots-1
		WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate
		
		UPDATE UserPermissions
		SET NewAppt=NewAppt-1
		WHERE UserID=@PatientID
		END
		
	IF((@SlotPreference=2) AND (@EveningSlots>0))
		BEGIN
		INSERT INTO Appointment
		VALUES(@PatientID,@DoctorID,@AppointmentDate,@SlotPreference,
		@TotalEveningSlots-@EveningSlots+1,@AilmentName,@DaysSinceInfected,2,0,0)
		SELECT @@IDENTITY
		
		UPDATE Schedule
		SET EveningSlots=EveningSlots-1
		WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate
		
		UPDATE UserPermissions
		SET NewAppt=NewAppt-1
		WHERE UserID=@PatientID
		END
	END
END
GO

CREATE PROC SearchAvailableDoctor

	@ApptDate DATETIME,
	@MajorSlotNo INT,
	@Specialization VARCHAR(15)
	
	AS
BEGIN

	IF(@MajorSlotNo=1)
	BEGIN
	SELECT D.DoctorID,D.Name,D.Gender,DATEDIFF(YY,DOB,GETDATE()) AS Age,	D.Specialization,D.YOE AS [Experience (years)], LEFT(S.ShiftDate,11) AS Date, S.MorningSlots
	FROM Doctor AS D JOIN Schedule AS S
	ON D.DoctorID=S.DoctorID
	WHERE D.Specialization LIKE '%'+@Specialization+'%'
	AND S.ShiftDate=@ApptDate AND S.MorningSlots>0
	END
	
	IF(@MajorSlotNo=2)
	BEGIN
	SELECT D.DoctorID,D.Name,D.Gender,DATEDIFF(YY,DOB,GETDATE()) AS Age,	D.Specialization,D.YOE AS [Experience (years)], LEFT(S.ShiftDate,11) AS Date, S.EveningSlots
	FROM Doctor AS D JOIN Schedule AS S
	ON D.DoctorID=S.DoctorID
	WHERE D.Specialization LIKE '%'+@Specialization+'%'
	AND S.ShiftDate=@ApptDate AND S.EveningSlots>0
	END
END
GO

CREATE PROC ModifyAppointment
	@ApptID INT,
	@AppointmentDate DATETIME,
	@SlotPreference INT,
	@DaySinceInfected INT,
	@AilmentName VARCHAR(30)
AS
BEGIN
	DECLARE @Permission INT=  (SELECT ModificationAlwd FROM Appointment WHERE ApptID=@ApptID)
	DECLARE @PatientID INT=  (SELECT PatientID FROM Appointment WHERE ApptID=@ApptID)
	DECLARE @DoctorID INT= (SELECT DoctorID FROM Appointment WHERE ApptID=@ApptID)
	DECLARE @PrevDate DATETIME= (SELECT ApptDate FROM Appointment WHERE ApptID=@ApptID)
	DECLARE @PrevSlot INT= (SELECT MajorSlotNo FROM Appointment WHERE ApptID=@ApptID)
	
	DECLARE @ShiftStart DATETIME = (SELECT ShiftStart FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @ShiftEnd DATETIME = (SELECT ShiftEnd FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	
	DECLARE @MorningSlots INT = (SELECT MorningSlots FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @TotalMorningSlots INT
	IF(@ShiftEnd<'13:00:00')
	SET @TotalMorningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE
	SET @TotalMorningSlots= ((SELECT DATEDIFF(MINUTE,@ShiftStart,'13:00:00'))/15)
	IF(@TotalMorningSlots<0) SET @TotalMorningSlots=0
								
	DECLARE @EveningSlots INT= (SELECT EveningSlots FROM Schedule 
								WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate)
	DECLARE @TotalEveningSlots INT 
	IF(@ShiftStart>'14:00:00')
	SET @TotalEveningSlots=((SELECT DATEDIFF(MINUTE,@ShiftStart,@ShiftEnd))/15)
	ELSE
	SET @TotalEveningSlots=((SELECT DATEDIFF(MINUTE,'14:00:00',@ShiftEnd))/15)
	IF(@TotalEveningSlots<0) SET @TotalEveningSlots=0
	
	IF(@Permission>0)
	BEGIN
		IF((@PrevDate=@AppointmentDate)AND(@PrevSlot=@SlotPreference))
		UPDATE Appointment
		SET AilmentName=@AilmentName, DaySinceInfected=@DaySinceInfected
		WHERE ApptID=@ApptID
	
		ELSE
		IF(NOT EXISTS(SELECT * FROM Appointment 
		WHERE ApptDate=@AppointmentDate AND PatientID=@PatientID
		AND MajorSlotNo=@SlotPreference))
			BEGIN
			IF(((@SlotPreference=1) AND (@MorningSlots>0)) OR 
					((@SlotPreference=2) AND (@EveningSlots>0)))
			BEGIN
			EXEC CancelAppointment @ApptID
		
			UPDATE Appointment
			SET ApptDate=@AppointmentDate,MajorSlotNo=@SlotPreference,
			MinorSlotNo=CASE WHEN @SlotPreference=1 THEN
						@TotalMorningSlots-@MorningSlots+1
						WHEN @SlotPreference=2 THEN
						@TotalEveningSlots-@EveningSlots+1
						END,
			AilmentName=@AilmentName,DaySinceInfected=@DaySinceInfected,
			ModificationAlwd=ModificationAlwd-1,Cancelled=0
			WHERE ApptID=@ApptID
		
			UPDATE Schedule
			SET MorningSlots= CASE WHEN @SlotPreference=1 THEN MorningSlots-1
							ELSE MorningSlots
							END,
			EveningSlots = CASE WHEN @SlotPreference=2 THEN EveningSlots-1
							ELSE EveningSlots
							END
			WHERE DoctorID=@DoctorID AND ShiftDate=@AppointmentDate
			END
			END
END
END
GO


CREATE PROC ViewAppointment
(
	@ApptID INT
)
AS
BEGIN
DECLARE @ApptDate DATETIME= (SELECT ApptDate FROM Appointment WHERE ApptID=@ApptID)
DECLARE @DoctorID INT= (SELECT DoctorID FROM Appointment WHERE ApptID=@ApptID)
DECLARE @MajorSlot INT= (SELECT MajorSlotNo FROM Appointment WHERE ApptID=@ApptID)
DECLARE @MinorSlot INT= (SELECT MinorSlotNo FROM Appointment WHERE ApptID=@ApptID)
DECLARE @ApptTime DATETIME

IF(@MajorSlot=2)
	SET @ApptTime= (SELECT DATEADD(MI,15*(@MinorSlot-1),'14:00:00'))
ELSE
	IF(@MajorSlot=1)
	BEGIN
	SET @ApptTime= (SELECT ShiftStart FROM Schedule
				WHERE ShiftDate=@ApptDate AND DoctorID=@DoctorID)
	SET @ApptTime= DATEADD(MI,15*(@MinorSlot-1),@ApptTime)
	END

SELECT D.Name, U.FirstName+' '+U.LastName,A.ApptDate, @ApptTime,
			A.AilmentName, A.DaySinceInfected, A.Cancelled, A.MajorSlotNo
FROM Doctor D JOIN Appointment AS A JOIN UserDetails AS U
ON U.UserID=A.PatientID
ON D.DoctorID=A.DoctorID
WHERE A.ApptID=@ApptID

UPDATE Appointment SET Modified=0 WHERE ApptID=@ApptID
END
GO

CREATE PROC UpdateUserPermissions
(
@UserID INT
)
AS
BEGIN
DECLARE @LastDate DATETIME= (SELECT LastLoginTime FROM LoginCredentials WHERE UserID=@UserID)
IF((DATEDIFF(DD,@LastDate,GETDATE())>0))
	UPDATE UserPermissions
	SET ChangePass=3, NewAppt=2
	WHERE UserID=@UserID
END
GO


CREATE PROC UpdateAdminPermissions
AS
BEGIN
DECLARE @LastDate DATETIME= (SELECT MAX(LastLoginTime) FROM LoginCredentials WHERE UserType=1)
IF((DATEDIFF(MM,@LastDate,GETDATE())>0))
	UPDATE AdminPermissions
	SET AddSchedule=1
END
GO
GO

INSERT INTO LoginCredentials
VALUES(1,ENCRYPTBYPASSPHRASE('rrl','admin'),0,1,NULL,NULL,NULL,NULL)
GO

INSERT INTO UserDetails
VALUES(2000,'Admin','na','9/9/2009','others','na','na','na','na')
GO

INSERT INTO UserPermissions
VALUES(2000,3,0)
GO

