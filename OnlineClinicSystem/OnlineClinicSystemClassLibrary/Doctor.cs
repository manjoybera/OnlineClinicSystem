using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace OnlineClinicSystemClassLibrary
{
    public class Doctor
    {
        public string DoctorName { get; set; }
        public int DoctorID { get; set; }
        public DateTime Dob { get; set; }
        public DateTime Doj { get; set; }
        public string Gender { get; set; }
        public string Qualification { get; set; }
        public string Specialization { get; set; }
        public int Experience { get; set; }
        public string PhoneNo { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public int Age { get; set; }
        public DataSet DSDoctors { get; set; }

        public int AddDoctorDetails()
         {
            int intDoctorID=0;

            SqlConnection conAddDoctorDetails = new SqlConnection();
            SqlCommand cmdAddDoctorDetails = new SqlCommand();
            conAddDoctorDetails.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdAddDoctorDetails.Connection = conAddDoctorDetails;

            cmdAddDoctorDetails.CommandType = System.Data.CommandType.StoredProcedure;
            cmdAddDoctorDetails.CommandText = "AddDoctorDetails";
            cmdAddDoctorDetails.Parameters.AddWithValue("@Name", DoctorName);
            cmdAddDoctorDetails.Parameters.AddWithValue("@DOB", Dob);
            cmdAddDoctorDetails.Parameters.AddWithValue("@DOJ", Doj);
            cmdAddDoctorDetails.Parameters.AddWithValue("@Gender", Gender);
            cmdAddDoctorDetails.Parameters.AddWithValue("@Qualification", Qualification);
            cmdAddDoctorDetails.Parameters.AddWithValue("@Specialization", Specialization);
            cmdAddDoctorDetails.Parameters.AddWithValue("@YOE", Experience);
            cmdAddDoctorDetails.Parameters.AddWithValue("@Address1", Address1);
            cmdAddDoctorDetails.Parameters.AddWithValue("@Address2", Address2);
            cmdAddDoctorDetails.Parameters.AddWithValue("@PhoneNo", PhoneNo);

            conAddDoctorDetails.Open();
            intDoctorID = Convert.ToInt32(cmdAddDoctorDetails.ExecuteScalar().ToString());
            conAddDoctorDetails.Close();


            return intDoctorID;
            
         }

        public int DeleteDoctorDetails()
     {

         SqlConnection conDeleteDoctorDetails = new SqlConnection();
            SqlCommand cmdDeleteDoctorDetails = new SqlCommand();
            conDeleteDoctorDetails.ConnectionString =System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdDeleteDoctorDetails.Connection = conDeleteDoctorDetails;

            cmdDeleteDoctorDetails.CommandType = System.Data.CommandType.StoredProcedure;
            cmdDeleteDoctorDetails.CommandText = "DeleteDoctorDetails";
            cmdDeleteDoctorDetails.Parameters.AddWithValue("@DoctorID", DoctorID);

            conDeleteDoctorDetails.Open();
            int flag = cmdDeleteDoctorDetails.ExecuteNonQuery();
            conDeleteDoctorDetails.Close();

            return flag;

     }

        public int ModifyDoctorDetails()
         {
             SqlConnection conModifyDoctorDetails = new SqlConnection();
            SqlCommand cmdModifyDoctorDetails = new SqlCommand();
            conModifyDoctorDetails.ConnectionString =System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdModifyDoctorDetails.Connection = conModifyDoctorDetails;

            cmdModifyDoctorDetails.CommandType = System.Data.CommandType.StoredProcedure;
            cmdModifyDoctorDetails.CommandText = "ModifyDoctorDetails";

            cmdModifyDoctorDetails.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Name", DoctorName);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@DOB", Dob);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@DOJ", Doj);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Gender", Gender);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Qualification", Qualification);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Specialization", Specialization);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@YOE", Experience);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Address1",  Address1);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@Address2", Address2);
            cmdModifyDoctorDetails.Parameters.AddWithValue("@PhoneNo", PhoneNo);
            

            conModifyDoctorDetails.Open();
            int flag = cmdModifyDoctorDetails.ExecuteNonQuery();
            conModifyDoctorDetails.Close();
            return flag;
         }

        public int ViewDoctorDetails()
         {
            int flag=0;
            SqlConnection conViewDoctorDetails = new SqlConnection();
            SqlCommand cmdViewDoctorDetails = new SqlCommand();

            conViewDoctorDetails.ConnectionString =System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdViewDoctorDetails.Connection = conViewDoctorDetails;

            cmdViewDoctorDetails.CommandType = System.Data.CommandType.StoredProcedure;
            cmdViewDoctorDetails.CommandText = "ViewDoctorDetails";

            cmdViewDoctorDetails.Parameters.AddWithValue("@DoctorID", DoctorID);
            SqlDataReader drViewDoctorDetails;

            conViewDoctorDetails.Open();
            drViewDoctorDetails = cmdViewDoctorDetails.ExecuteReader();
            while (drViewDoctorDetails.Read())
            {

                if (drViewDoctorDetails.HasRows)
                {
                    
                    DoctorName = Convert.ToString(drViewDoctorDetails[1]);
                    Dob = Convert.ToDateTime(drViewDoctorDetails[2]);
                    Doj = Convert.ToDateTime(drViewDoctorDetails[3]);
                    Gender = Convert.ToString(drViewDoctorDetails[4]);
                    Qualification = Convert.ToString(drViewDoctorDetails[5]);
                    Specialization = Convert.ToString(drViewDoctorDetails[6]);
                    Experience = Convert.ToInt32(drViewDoctorDetails[7]);
                    Address1 = Convert.ToString(drViewDoctorDetails[8]);
                    Address2 = Convert.ToString(drViewDoctorDetails[9]);
                    PhoneNo = Convert.ToString(drViewDoctorDetails[10]);
                    flag = 1;
                }
                else flag = 0;


            }
            conViewDoctorDetails.Close();
            return flag;
           
         }

        
    }

}
