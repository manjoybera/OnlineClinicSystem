using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineClinicSystemClassLibrary
{
    public class Schedule
    {
        public int DoctorID { get; set; }
        public string ShiftDate { get; set; }
        public DateTime ShiftStart { get; set; }
        public DateTime ShiftEnd { get; set; }
        public bool DoctorAvailability { get; set; }

        public int AddMonthlySchedule()
        {
            SqlConnection conAddMonthlySchedule = new SqlConnection();
            SqlCommand cmdAddMonthlySchedule = new SqlCommand();
            conAddMonthlySchedule.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdAddMonthlySchedule.Connection = conAddMonthlySchedule;
            cmdAddMonthlySchedule.CommandType = System.Data.CommandType.StoredProcedure;
            cmdAddMonthlySchedule.CommandText = "AddMonthlySchedule";
            string strShiftStart = ShiftStart.ToShortTimeString();
            string strShiftEnd = ShiftEnd.ToShortTimeString();
            cmdAddMonthlySchedule.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmdAddMonthlySchedule.Parameters.AddWithValue("@StartDate", ShiftDate);
            cmdAddMonthlySchedule.Parameters.AddWithValue("@ShiftStart", strShiftStart);
            cmdAddMonthlySchedule.Parameters.AddWithValue("@ShiftEnd", strShiftEnd);

            conAddMonthlySchedule.Open();
            int flag = cmdAddMonthlySchedule.ExecuteNonQuery();
            conAddMonthlySchedule.Close();
            return flag;

        }
        public int ModifyDailySchedule()
        {
            SqlConnection conModifyDailySchedule = new SqlConnection();
            SqlCommand cmdModifyDailySchedule = new SqlCommand();
            conModifyDailySchedule.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOCS"].ToString();
            cmdModifyDailySchedule.Connection = conModifyDailySchedule;
            cmdModifyDailySchedule.CommandType = System.Data.CommandType.StoredProcedure;
            cmdModifyDailySchedule.CommandText = "ModifyDailySchedule";
            string strShiftStart=ShiftStart.ToShortTimeString();
            string strShiftEnd=ShiftEnd.ToShortTimeString();
            cmdModifyDailySchedule.Parameters.AddWithValue("@DoctorID", DoctorID);
            cmdModifyDailySchedule.Parameters.AddWithValue("@ShiftDate", ShiftDate);
            cmdModifyDailySchedule.Parameters.AddWithValue("@ShiftStart", strShiftStart);
            cmdModifyDailySchedule.Parameters.AddWithValue("@ShiftEnd", strShiftEnd);
            cmdModifyDailySchedule.Parameters.AddWithValue("@DoctorAvailability", DoctorAvailability);

            conModifyDailySchedule.Open();
            int flag = cmdModifyDailySchedule.ExecuteNonQuery();
            conModifyDailySchedule.Close();
            return flag;
        }

    }
}
