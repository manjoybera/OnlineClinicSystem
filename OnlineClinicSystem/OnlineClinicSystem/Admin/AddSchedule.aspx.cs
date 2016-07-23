using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class AddSchedule : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Schedule AddMonthlySchedule = new OnlineClinicSystemClassLibrary.Schedule();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtMonth_CalendarAddSch.StartDate = DateTime.Now.AddDays(1-DateTime.Now.Day);
            txtMonth_CalendarAddSch.EndDate = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.Day);
           
           if(IsPostBack==false) 
            txtMonth.Text = string.Empty;
            
        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                AddMonthlySchedule.DoctorID = Convert.ToInt32(txtDocID.Text);
                AddMonthlySchedule.ShiftDate = txtMonth.Text;
                AddMonthlySchedule.ShiftStart = Convert.ToDateTime(txtStart1.Text);
                AddMonthlySchedule.ShiftEnd = Convert.ToDateTime(txtEnd1.Text);

                int flag = AddMonthlySchedule.AddMonthlySchedule();
                if (flag > 0)
                {
                    lblDocID.Text = "Monthly Schedule Added Successfully for Doctor ID: " + txtDocID.Text;
                }
                else

                    lblDocID.Text = "Schedule Not Added ,Try Again";

            }
            catch (Exception)
            {
                lblDocID.Text = "Valid Details are not Entered,Try Again";

               
            }

        }

        protected void imgReset_Click(object sender, ImageClickEventArgs e)
        {
            txtDocID.Text = string.Empty;
            txtMonth.Text = string.Empty;
            txtStart1.Text = string.Empty;
            txtEnd1.Text = string.Empty;
            lblDocID.Text = string.Empty;
        }

       
    }
}