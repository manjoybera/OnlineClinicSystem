using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class ModifySchedule : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Schedule ModifyDailySchedule = new OnlineClinicSystemClassLibrary.Schedule();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtMonth_CalendarAddSch.StartDate = DateTime.Now;
            txtMonth_CalendarAddSch.EndDate = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.Day);

            if (IsPostBack == false) 
            txtDate.Text = string.Empty;
        }
        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                ModifyDailySchedule.DoctorID = Convert.ToInt32(txtDocID.Text);
                ModifyDailySchedule.ShiftDate = txtDate.Text;
                ModifyDailySchedule.ShiftStart = Convert.ToDateTime(txtStart1.Text);
                ModifyDailySchedule.ShiftEnd = Convert.ToDateTime(txtEnd1.Text);
                ModifyDailySchedule.DoctorAvailability = Convert.ToBoolean(ddlAvailability.SelectedValue);

                int flag = ModifyDailySchedule.ModifyDailySchedule();
                if (flag > 0)
                {
                    lblDocID.Text = "Schedule modified Successfully for Doctor ID: " + txtDocID.Text;
                }
                else

                    lblDocID.Text = "Schedule Not modified ,Try Again";
            }
            catch (Exception)
            {
                     lblDocID.Text = "Parameter Entered is Invalid,Try Again";
               
            }
            
            
        }

        protected void imgReset_Click(object sender, ImageClickEventArgs e)
        {
              txtDocID.Text = string.Empty;
              txtDate.Text = string.Empty;
              txtStart1.Text = string.Empty;
              txtEnd1.Text = string.Empty;
              lblDocID.Text = string.Empty;
        }
    }
}