using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.User
{
    public partial class ModifyAppointments : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment userAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                txtDateCalendarExtender.StartDate = DateTime.Now;
                txtDateCalendarExtender.EndDate = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.Day);
                
                if (IsPostBack == false)
                {
                    divTable.Visible = false;
                    userAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);
                    txtDate.Text = "";

                    int flag = userAppointments.ViewAppointment();
                    if (flag > 0)
                    {
                        lblID.Text = Convert.ToString(userAppointments.AppointmentID);
                        lblDoctor.Text = userAppointments.DoctorName;
                        lblPatient.Text = userAppointments.PatientName;
                        txtDate.Text = userAppointments.AppointmentDate;
                        txtAilment.Text = userAppointments.AilmentName;
                        txtDays.Text = Convert.ToString(userAppointments.DaysSinceInfected);
                        if (userAppointments.MajorSlotNo == 1) ddlSlot.SelectedIndex = 0;
                        else ddlSlot.SelectedIndex = 1;
                        divTable.Visible = true;
                    }
                    else lblMesg.Text = "Appointment details could not be fetched.";
                }
            }
            catch (Exception)
            {

                lblMesg.Text = "Appointment details could not be fetched. Something went wrong.";
            }
            
        }

        protected void imgSubmit_Click(object sender, ImageClickEventArgs e)
        {

            try
            {
                divTable.Visible = false;
                userAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);
                userAppointments.AppointmentDate = txtDate.Text;
                userAppointments.MajorSlotNo = Convert.ToInt32(ddlSlot.SelectedValue);
                userAppointments.DaysSinceInfected = Convert.ToInt32(txtDays.Text);
                userAppointments.AilmentName = txtAilment.Text;

                
                int flag = userAppointments.ModifyAppointment();
                if (flag > 0)
                {
                    divTable.Visible = false;
                    lblMesg.Text = "Appointment details modified successfully for Appointment ID: "+userAppointments.AppointmentID;
                   
                }
                else lblMesg.Text = "Appointment details could not be modified. Select some other dates";
            }
            catch (Exception)
            {

                lblMesg.Text = "Appointment details could not be modified. Invalid parameters.";
            }
        }

        protected void imgReset_Click(object sender, ImageClickEventArgs e)
        {
            txtAilment.Text = "";
            txtDate.Text = "";
            txtDays.Text = "";
            ddlSlot.SelectedIndex =0;
        }
    }
}