using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.User
{
    public partial class ViewAppointment : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment userAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);
                lblHeader.Text = Convert.ToString(Session["Header"]);
                
                divTable.Visible = false;
                
                int flag = userAppointments.ViewAppointment();
                if (flag > 0)
                {
                    lblID.Text = Convert.ToString(userAppointments.AppointmentID);
                    lblDoctor.Text = userAppointments.DoctorName;
                    lblPatient.Text = userAppointments.PatientName;
                    lblDate.Text = userAppointments.AppointmentDate;
                    lblTime.Text = userAppointments.AppointmentTime.ToShortTimeString();
                    lblAilment.Text = userAppointments.AilmentName;
                    lblDays.Text = Convert.ToString(userAppointments.DaysSinceInfected);
                    lblStatus.Text = Convert.ToString(userAppointments.Status);
                    divTable.Visible = true;
                }
                else lblMesg.Text = "Appointment details could not be fetched.";
            }
            catch (Exception)
            {

                lblMesg.Text = "Appointment details could not be fetched. Invalid Parameters";
            }
            
        }
    }
}