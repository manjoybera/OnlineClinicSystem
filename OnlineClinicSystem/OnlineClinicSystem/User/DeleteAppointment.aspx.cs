using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.User
{
    public partial class DeleteAppointment : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment userAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            divTable.Visible = false;
            userAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);

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

        protected void imgDelete_Click(object sender, ImageClickEventArgs e)
        {
            userAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);
            int flag= userAppointments.CancelAppointment();
            if (flag > 0)
            {
                lblMesg.Text = "Appointment details cancelled for Appointment ID: " + userAppointments.AppointmentID;
                divTable.Visible = false;
            }
            else lblMesg.Text = "Appointment details could not be deleted";
        }
    }
}