using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace OnlineClinicSystem.User
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment RequestAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {

            txtDateCalendarExtender.StartDate = DateTime.Now;
            txtDateCalendarExtender.EndDate = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.Day);
            

            if (IsPostBack == false)
            {    
                divDocMsg.Visible = false;
                divDocGrid.Visible = false;
                divBookMsg.Visible = false;
                divBookFields.Visible = false;
                lblDocID.Text = "";
                lblGrid.Text = "";
                txtDate.Text = string.Empty;
            }

        }

        

        protected void imgSubmit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                DataSet dsSearchDoctor = new DataSet();
                RequestAppointments.AppointmentDate = txtDate.Text;
                RequestAppointments.MajorSlotNo = Convert.ToInt32(ddlSlot.SelectedValue);

                int flag = RequestAppointments.SearchAvailableDoctor(txtSpec.Text);
                dsSearchDoctor = RequestAppointments.DSAppointments;

                if (flag > 0)
                {
                    gridViewDoc.DataSource = dsSearchDoctor;
                    gridViewDoc.DataBind();
                    divDocMsg.Visible = true;
                    divDocGrid.Visible = true;
                    divBookMsg.Visible = true;
                    divBookFields.Visible = true;
                    lblDocID.Text = "";
                    lblGrid.Text = "";
                }
                else
                {
                    lblDocID.Text = "Sorry!! No Doctor match your specifications.";
                    divDocMsg.Visible = false;
                    divDocGrid.Visible = false;
                    divBookMsg.Visible = false;
                    divBookFields.Visible = false;
                    lblGrid.Text = "";
                }


            }

            catch (Exception)
            {

                throw;
            }
        }


        protected void imgBook_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                RequestAppointments.AilmentName = txtName.Text;
                int intDays;
                if (int.TryParse(txtDays.Text,out intDays)==false)
                    RequestAppointments.DaysSinceInfected = 0;
                else RequestAppointments.DaysSinceInfected = intDays;
                RequestAppointments.PatientID = Convert.ToInt32(Session["UserID"]);
                RequestAppointments.AppointmentDate = txtDate.Text;
                RequestAppointments.MajorSlotNo = Convert.ToInt32(ddlSlot.SelectedValue);

                foreach (GridViewRow SelectedRow in gridViewDoc.Rows)
                {
                    RadioButton rdbtn = (RadioButton)SelectedRow.FindControl("rdbtnDocID");
                    if (rdbtn != null && rdbtn.Checked)
                    {
                        RequestAppointments.DoctorID = Convert.ToInt32(gridViewDoc.DataKeys[SelectedRow.RowIndex][0]);
                    }
                }

                int flag = RequestAppointments.RequestAppointment();
                if (flag > 0)
                {
                    Session["ApptID"] = RequestAppointments.AppointmentID;
                    Session["Header"] = "Success";
                    Response.Redirect("ViewAppointment.aspx");
                }
                else lblGrid.Text = "Sorry! Appointment could not be booked. Try again with different parameters.";




            }
            catch (Exception)
            {

                lblOptn.Text = "Request contains some invalid parameters";
            }
            
            
        }

    }
}