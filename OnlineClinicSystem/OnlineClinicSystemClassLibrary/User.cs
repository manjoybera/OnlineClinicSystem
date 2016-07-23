using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineClinicSystemClassLibrary
{
    public class User
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Dob { get; set; }
        public string Gender { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public int AddUserDetails()
        {
            try
            {
                UserID = 0;
                SqlConnection conAddUserDetails = new SqlConnection();
                SqlCommand cmdAddUserDetails = new SqlCommand();
                conAddUserDetails.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdAddUserDetails.Connection = conAddUserDetails;
                cmdAddUserDetails.CommandType = System.Data.CommandType.StoredProcedure;
                cmdAddUserDetails.CommandText = "AddUserDetails";
                

                cmdAddUserDetails.Parameters.AddWithValue("@FirstName", FirstName);
                cmdAddUserDetails.Parameters.AddWithValue("@LastName", LastName);
                cmdAddUserDetails.Parameters.AddWithValue("@DOB", Dob);
                cmdAddUserDetails.Parameters.AddWithValue("@Gender", Gender);
                cmdAddUserDetails.Parameters.AddWithValue("@Address1", Address1);
                cmdAddUserDetails.Parameters.AddWithValue("@Address2", Address2);
                cmdAddUserDetails.Parameters.AddWithValue("@PhoneNo", PhoneNo);
                cmdAddUserDetails.Parameters.AddWithValue("@Email", Email);
                cmdAddUserDetails.Parameters.AddWithValue("@Password",  Password);

                conAddUserDetails.Open();
                UserID = Convert.ToInt32(cmdAddUserDetails.ExecuteScalar().ToString());
                conAddUserDetails.Close();
                return UserID;
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }

        public int EditUserDetails()
        {
            
            try
            {
                SqlConnection conEditUserDetails = new SqlConnection();
                SqlCommand cmdEditUserDetails = new SqlCommand();
                conEditUserDetails.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
                cmdEditUserDetails.Connection = conEditUserDetails;
                cmdEditUserDetails.CommandText = "EditUserDetails";
                cmdEditUserDetails.CommandType = System.Data.CommandType.StoredProcedure;

                cmdEditUserDetails.Parameters.AddWithValue("@UserID", UserID);
                cmdEditUserDetails.Parameters.AddWithValue("@FirstName", FirstName);
                cmdEditUserDetails.Parameters.AddWithValue("@LastName", LastName);
                cmdEditUserDetails.Parameters.AddWithValue("@DOB", Dob);
                cmdEditUserDetails.Parameters.AddWithValue("@Gender", Gender);
                cmdEditUserDetails.Parameters.AddWithValue("@Address1", Address1);
                cmdEditUserDetails.Parameters.AddWithValue("@Address2", Address2);
                cmdEditUserDetails.Parameters.AddWithValue("@PhoneNo", PhoneNo);
                cmdEditUserDetails.Parameters.AddWithValue("@Email", Email);
                
                conEditUserDetails.Open();
                int flag = cmdEditUserDetails.ExecuteNonQuery();
                conEditUserDetails.Close();
                return flag;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int ViewUserDetails()
        {

            try
            {
                int flag=0;
                SqlConnection conViewUserDetails = new SqlConnection();
                SqlCommand cmdViewUserDetails = new SqlCommand();

                conViewUserDetails.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();

                cmdViewUserDetails.Connection = conViewUserDetails;
                cmdViewUserDetails.CommandText = "ViewUserDetails";
                cmdViewUserDetails.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader drViewUserDetails;

                cmdViewUserDetails.Parameters.AddWithValue("@UserID", UserID);

                conViewUserDetails.Open();
                drViewUserDetails = cmdViewUserDetails.ExecuteReader();
                while (drViewUserDetails.Read())
                {

                    if (drViewUserDetails.HasRows)
                    {
                        FirstName = Convert.ToString(drViewUserDetails[1]);
                        LastName = Convert.ToString(drViewUserDetails[2]);
                        Dob = Convert.ToDateTime(drViewUserDetails[3]);
                        Gender = Convert.ToString(drViewUserDetails[4]);
                        Address1 = Convert.ToString(drViewUserDetails[5]);
                        Address2 = Convert.ToString(drViewUserDetails[6]);
                        PhoneNo = Convert.ToString(drViewUserDetails[7]);
                        Email = Convert.ToString(drViewUserDetails[8]);
                        flag = 1;
                    }
                    else flag = 0;

                    
                }
                conViewUserDetails.Close();
                return flag;
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}
