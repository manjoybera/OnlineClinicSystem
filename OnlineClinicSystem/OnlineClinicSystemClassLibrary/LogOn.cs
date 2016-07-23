using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace OnlineClinicSystemClassLibrary
{
    public class LogOn
    {

        public int UserID { get; set; }
        public bool UserType { get; set; }
        public string Password { get; set; }
        public string NewPassword { get; set; }
        public bool LogOnStatus { get; set; }
        public bool FirstTime { get; set; }
        public string LastLogOnIP { get; set; }
        public string LastLogOnTime { get; set; }
        public string FailedLogOnIP { get; set; }
        public string FailedLogOnTime { get; set; }
        public string FirstName { get; set; }

        public int UserLogOn()
        {

            try
            {
                int flag = 0;
                SqlConnection conUserLogin = new SqlConnection();
                SqlCommand cmdUserLogin = new SqlCommand();
                conUserLogin.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdUserLogin.Connection = conUserLogin;
                cmdUserLogin.CommandType = System.Data.CommandType.StoredProcedure;
                cmdUserLogin.CommandText = "UserLogin";
                SqlDataReader drUserLogin;

                cmdUserLogin.Parameters.AddWithValue("@UserID", UserID);
                cmdUserLogin.Parameters.AddWithValue("@Password", Password);

                conUserLogin.Open();
                drUserLogin = cmdUserLogin.ExecuteReader();
                while (drUserLogin.Read())
                {
                    if (drUserLogin.HasRows)
                    {
                        LogOnStatus = Convert.ToBoolean(drUserLogin[0]);
                        UserType = Convert.ToBoolean(drUserLogin[1]);
                        FirstTime = Convert.ToBoolean(drUserLogin[2]);
                        FirstName = Convert.ToString(drUserLogin[3]);
                        flag = 1;
                    }

                    else flag=0;
                }

                conUserLogin.Close();

                return flag;
            }

            catch (Exception)
            {

                throw;
            }
            
        }

        public int LogOnStatusUpdate()
        {

            try
            {
                int flag = 0;
                SqlConnection conLoginStatus = new SqlConnection();
                SqlCommand cmdLoginStatus = new SqlCommand();
                conLoginStatus.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdLoginStatus.Connection = conLoginStatus;
                cmdLoginStatus.CommandText = "UPDATE LoginCredentials SET LoginStatus=1, FirstTime=0, LastLoginTime=GETDATE(), LastLoginIP=HOST_NAME() WHERE UserID= " + UserID;
                conLoginStatus.Open();
                flag = cmdLoginStatus.ExecuteNonQuery();
                conLoginStatus.Close();
                return flag;

            }
            catch (Exception)
            {

                throw;
            }

        }

        public int LogOnInfo()
        {

            try
            {
                int flag = 0;
                SqlConnection conLoginInfo = new SqlConnection();
                SqlCommand cmdLoginInfo = new SqlCommand();
                conLoginInfo.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdLoginInfo.Connection = conLoginInfo;
                cmdLoginInfo.CommandText = "SELECT LastLoginTime, LastLoginIP, FailedLoginTime, FailedLoginIP FROM LoginCredentials WHERE UserID= "+UserID;
                SqlDataReader drLoginInfo;

                conLoginInfo.Open();
                drLoginInfo = cmdLoginInfo.ExecuteReader();
                while (drLoginInfo.Read())
                {

                    if (drLoginInfo.HasRows)
                    {
                        LastLogOnTime = Convert.ToString(drLoginInfo[0]);
                        LastLogOnIP = Convert.ToString(drLoginInfo[1]);
                        FailedLogOnTime = Convert.ToString(drLoginInfo[2]);
                        FailedLogOnIP = Convert.ToString(drLoginInfo[3]);
                        flag = 1;
                    }

                    else flag = 0;
                }

                conLoginInfo.Close();

                return flag;
            }

            catch (Exception)
            {

                throw;
            }
  
        }

        public int ChangePassword()
        {

            try
            {
                int flag = 0;
                SqlConnection conChangePassword = new SqlConnection();
                SqlCommand cmdChangePassword = new SqlCommand();
                conChangePassword.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdChangePassword.Connection = conChangePassword;
                cmdChangePassword.CommandType = System.Data.CommandType.StoredProcedure;
                cmdChangePassword.CommandText = "ChangePassword";

                cmdChangePassword.Parameters.AddWithValue("@UserID", UserID);
                cmdChangePassword.Parameters.AddWithValue("@Password", Password);
                cmdChangePassword.Parameters.AddWithValue("@NewPassword", NewPassword);

                conChangePassword.Open();
                flag = cmdChangePassword.ExecuteNonQuery();
                conChangePassword.Close();
                return flag;
            }
            catch (Exception)
            {

                throw;
            }


        }

        public int UpdateUserPermissions()
        {

            try
            {

                SqlConnection conUpdateUserPermissions = new SqlConnection();
                SqlCommand cmdUpdateUserPermissions = new SqlCommand();
                conUpdateUserPermissions.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdUpdateUserPermissions.Connection = conUpdateUserPermissions;
                cmdUpdateUserPermissions.CommandType = System.Data.CommandType.StoredProcedure;
                cmdUpdateUserPermissions.CommandText = "UpdateUserPermissions";

                cmdUpdateUserPermissions.Parameters.AddWithValue("@UserID", UserID);

                conUpdateUserPermissions.Open();
                int flag = cmdUpdateUserPermissions.ExecuteNonQuery();
                conUpdateUserPermissions.Close();
                return flag;
            }
            catch (Exception)
            {

                throw;
            }


        }

        public int UpdateAdminPermissions()
        {

            try
            {

                SqlConnection conUpdateAdminPermissions = new SqlConnection();
                SqlCommand cmdUpdateAdminPermissions = new SqlCommand();
                conUpdateAdminPermissions.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdUpdateAdminPermissions.Connection = conUpdateAdminPermissions;
                cmdUpdateAdminPermissions.CommandType = System.Data.CommandType.StoredProcedure;
                cmdUpdateAdminPermissions.CommandText = "UpdateAdminPermissions";

                conUpdateAdminPermissions.Open();
                int flag = cmdUpdateAdminPermissions.ExecuteNonQuery();
                conUpdateAdminPermissions.Close();
                return flag;
            }
            catch (Exception)
            {

                throw;
            }


        }

        public int LogOffStatusUpdate()
        {
            try
                {
                    int flag = 0;
                    SqlConnection conLogOffStatusUpdate = new SqlConnection();
                    SqlCommand cmdLogOffStatusUpdate = new SqlCommand();
                    conLogOffStatusUpdate.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                    cmdLogOffStatusUpdate.Connection = conLogOffStatusUpdate;
                    cmdLogOffStatusUpdate.CommandText = "UPDATE LoginCredentials SET LoginStatus=0 WHERE UserID= " + UserID;
                    conLogOffStatusUpdate.Open();
                    flag=cmdLogOffStatusUpdate.ExecuteNonQuery();
                    conLogOffStatusUpdate.Close();
                    return flag;

                }
                catch (Exception)
                {

                    throw;
                }

        }


    }
}
