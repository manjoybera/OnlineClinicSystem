using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment DocAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DocAppointments.AppointmentID = Convert.ToInt32(Session["ApptID"]);

                divTable.Visible = false;

                int flag = DocAppointments.ViewAppointment();
                if (flag > 0)
                {
                    lblID.Text = Convert.ToString(DocAppointments.AppointmentID);
                    lblDoctor.Text = DocAppointments.DoctorName;
                    lblPatient.Text = DocAppointments.PatientName;
                    lblDate.Text = DocAppointments.AppointmentDate;
                    lblTime.Text = DocAppointments.AppointmentTime.ToShortTimeString();
                    lblAilment.Text = DocAppointments.AilmentName;
                    lblDays.Text = Convert.ToString(DocAppointments.DaysSinceInfected);
                    lblStatus.Text = Convert.ToString(DocAppointments.Status);
                    divTable.Visible = true;
                }
                else lblMesg.Text = "Appointment details could not be fetched.";
            }
            catch (Exception)
            {
                lblMesg.Text = "Invalid Parameter Entered, Try Again";

                
            }

        }
    }
}