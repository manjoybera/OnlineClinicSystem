using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace OnlineClinicSystemClassLibrary
{
    public class Appointment
    {
        public string AilmentName { get; set; }
        public string AppointmentDate { get; set; }
        public int AppointmentID { get; set; }
        public DateTime AppointmentTime { get; set; }
        public int MajorSlotNo { get; set; }
        public int DaysSinceInfected { get; set; }
        public int DoctorID { get; set; }
        public int PatientID { get; set; }
        public string DoctorName { get; set; }
        public string PatientName { get; set; }
        public string Status { get; set; }
        public DataSet DSAppointments { get; set; }

        public int RequestAppointment()
        {
            int flag = 0;
            SqlConnection conRequestAppointment = new SqlConnection();
            SqlCommand cmdRequestAppointment = new SqlCommand();
            conRequestAppointment.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdRequestAppointment.Connection = conRequestAppointment;
            cmdRequestAppointment.CommandType = System.Data.CommandType.StoredProcedure;
            cmdRequestAppointment.CommandText = "RequestAppointment";

            cmdRequestAppointment.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmdRequestAppointment.Parameters.AddWithValue("@PatientID", PatientID);
            cmdRequestAppointment.Parameters.AddWithValue("@AppointmentDate", AppointmentDate);
            cmdRequestAppointment.Parameters.AddWithValue("@SlotPreference", MajorSlotNo);
            cmdRequestAppointment.Parameters.AddWithValue("@DaysSinceInfected", DaysSinceInfected);
            cmdRequestAppointment.Parameters.AddWithValue("@AilmentName", AilmentName);

            conRequestAppointment.Open();
            AppointmentID = Convert.ToInt32(cmdRequestAppointment.ExecuteScalar());
            if(AppointmentID>2999) flag=1;
            conRequestAppointment.Close();
            return flag;
        }

        public int ModifyAppointment()
        {
            SqlConnection conModifyAppointment = new SqlConnection();
            SqlCommand cmdModifyAppointment = new SqlCommand();
            conModifyAppointment.ConnectionString =System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdModifyAppointment.Connection = conModifyAppointment;
            cmdModifyAppointment.CommandType = System.Data.CommandType.StoredProcedure;
            cmdModifyAppointment.CommandText = "ModifyAppointment";

            cmdModifyAppointment.Parameters.AddWithValue("@ApptID", AppointmentID);
            cmdModifyAppointment.Parameters.AddWithValue("@AppointmentDate", AppointmentDate);
            cmdModifyAppointment.Parameters.AddWithValue("@SlotPreference", MajorSlotNo);
            cmdModifyAppointment.Parameters.AddWithValue("@DaySinceInfected", DaysSinceInfected);
            cmdModifyAppointment.Parameters.AddWithValue("@AilmentName", AilmentName);

            conModifyAppointment.Open();
            int flag = Convert.ToInt32(cmdModifyAppointment.ExecuteNonQuery());
            conModifyAppointment.Close();
            return flag;
 
        }

        public int CancelAppointment()
        {
            SqlConnection conCancelAppointment = new SqlConnection();
            SqlCommand cmdCancelAppointment = new SqlCommand();
            conCancelAppointment.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdCancelAppointment.Connection = conCancelAppointment;

            cmdCancelAppointment.CommandType = System.Data.CommandType.StoredProcedure;
            cmdCancelAppointment.CommandText = "CancelAppointment";
            cmdCancelAppointment.Parameters.AddWithValue("@ApptID", AppointmentID);

            conCancelAppointment.Open();
            int flag = cmdCancelAppointment.ExecuteNonQuery();
            conCancelAppointment.Close();

            return flag;
        }

        public int ViewAppointment()
        {
            int flag=0;
            SqlConnection conViewAppointment = new SqlConnection();
            SqlCommand cmdViewAppointment = new SqlCommand();
            conViewAppointment.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdViewAppointment.Connection = conViewAppointment;

            cmdViewAppointment.CommandType = System.Data.CommandType.StoredProcedure;
            cmdViewAppointment.CommandText = "ViewAppointment";
            SqlDataReader drViewAppointment;
            cmdViewAppointment.Parameters.AddWithValue("@ApptID", AppointmentID);
          
            conViewAppointment.Open();
            drViewAppointment= cmdViewAppointment.ExecuteReader();
            while (drViewAppointment.Read())
            {
                if (drViewAppointment.HasRows)
                {
                    DoctorName = Convert.ToString(drViewAppointment[0]);
                    PatientName = Convert.ToString(drViewAppointment[1]);
                    AppointmentDate = (Convert.ToDateTime(drViewAppointment[2])).ToShortDateString().ToString();
                    AppointmentTime = Convert.ToDateTime(drViewAppointment[3]);
                    AilmentName = Convert.ToString(drViewAppointment[4]);
                    DaysSinceInfected = Convert.ToInt32(drViewAppointment[5]);
                    if (Convert.ToBoolean(drViewAppointment[6]))
                        Status = "Appointment Cancelled";
                    else Status = "Active Appointment";
                    MajorSlotNo = Convert.ToInt32(drViewAppointment[7]);
                    flag = 1;
                }
            }
            conViewAppointment.Close();
            return flag;
        }

        public int ViewAllAppointment()
        {
            int flag = 0;
            SqlConnection conViewAllAppointment = new SqlConnection();
            conViewAllAppointment.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            string strCommand = "SELECT ApptID,PatientID,LEFT(ApptDate,11) AS Date,AilmentName,DaySinceInfected,Cancelled FROM Appointment WHERE DoctorID= " + DoctorID;
            SqlDataAdapter daAppointment = new SqlDataAdapter(strCommand,conViewAllAppointment);
            DSAppointments = new DataSet();
            conViewAllAppointment.Open();
            flag= daAppointment.Fill(DSAppointments);
            conViewAllAppointment.Close();
            return flag;
        }

        public int SelectAppointment()
        {
            int flag = 0;
            SqlConnection conSelectAppointment = new SqlConnection();
            conSelectAppointment.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();

            string strCommandWithoutDoc = "SELECT ApptID,DoctorID,LEFT(ApptDate,11) AS Date,ModificationAlwd AS [Allowed Modifications],Cancelled FROM Appointment WHERE PatientID= " + PatientID;
            string strCommandWithDoc = "SELECT ApptID,DoctorID,LEFT(ApptDate,11) AS Date,ModificationAlwd AS [Allowed Modifications],Cancelled FROM Appointment WHERE DoctorID= " + DoctorID + " AND PatientID= " + PatientID;
            string strCommand;

            if (DoctorID == -1) strCommand=strCommandWithoutDoc;
            else strCommand = strCommandWithDoc;
            SqlDataAdapter daAppointment = new SqlDataAdapter(strCommand, conSelectAppointment);
            
            DSAppointments = new DataSet();
            conSelectAppointment.Open();
            flag = daAppointment.Fill(DSAppointments);
            conSelectAppointment.Close();
            return flag;
        }

        public int SearchAvailableDoctor(string specialization)
        {
            int flag = 0;
            SqlConnection conSearchAvailableDoctor = new SqlConnection();
            SqlCommand cmdSearchAvailableDoctor = new SqlCommand();
            DSAppointments = new DataSet();
            conSearchAvailableDoctor.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdSearchAvailableDoctor.Connection = conSearchAvailableDoctor;
            cmdSearchAvailableDoctor.CommandType = System.Data.CommandType.StoredProcedure;
            cmdSearchAvailableDoctor.CommandText = "SearchAvailableDoctor";
            SqlDataAdapter daAppointment = new SqlDataAdapter(cmdSearchAvailableDoctor);

            cmdSearchAvailableDoctor.Parameters.AddWithValue("@ApptDate", AppointmentDate);
            cmdSearchAvailableDoctor.Parameters.AddWithValue("@MajorSlotNo", MajorSlotNo);
            cmdSearchAvailableDoctor.Parameters.AddWithValue("@Specialization", specialization);

            conSearchAvailableDoctor.Open();
            flag = daAppointment.Fill(DSAppointments);
            conSearchAvailableDoctor.Close();
            return flag;
        }

        public int ModifiedNotification()
        {

            try
            {
                int flag = 0;
                SqlConnection conModifiedNotification = new SqlConnection();
                SqlCommand cmdModifiedNotification = new SqlCommand();
                conModifiedNotification.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdModifiedNotification.Connection = conModifiedNotification;
                cmdModifiedNotification.CommandText = "SELECT COUNT(Modified) FROM Appointment WHERE Modified=1 AND PatientID= " + PatientID;
                conModifiedNotification.Open();
                flag = Convert.ToInt32(cmdModifiedNotification.ExecuteScalar().ToString());
                conModifiedNotification.Close();
                return flag;

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
