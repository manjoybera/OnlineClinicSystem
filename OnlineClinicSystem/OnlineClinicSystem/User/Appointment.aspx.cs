using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlineClinicSystem.User
{
    public partial class Appointment : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment UserAppointments = new OnlineClinicSystemClassLibrary.Appointment();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                divMsg.Visible = false;
                divTable.Visible = false;
                divButtons.Visible = false;
            }
        }

        protected void Confirm_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (txtDocID.Text == "____" || txtDocID.Text == "") UserAppointments.DoctorID = -1;
                else UserAppointments.DoctorID = Convert.ToInt32(txtDocID.Text);

                DataSet dsViewAllAppointments = new DataSet();
                UserAppointments.PatientID = Convert.ToInt32(Session["UserID"]);
                int flag = UserAppointments.SelectAppointment();
                dsViewAllAppointments = UserAppointments.DSAppointments;
                if (flag > 0)
                {
                    gridViewAppt.DataSource = dsViewAllAppointments;
                    gridViewAppt.DataBind();
                    divTable.Visible = true;
                    divButtons.Visible = true;
                    lblMesg.Text = "";
                }
                else lblMesg.Text = "There are no such Appointment details.";
                divMsg.Visible = true;
            }

            catch (Exception)
            {
                
                throw;
            }
            
            
            
        }

        protected void btnView_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                foreach (GridViewRow SelectedRow in gridViewAppt.Rows)
                {
                    RadioButton rdbtn = (RadioButton)SelectedRow.FindControl("rdbtnApptID");
                    if (rdbtn != null && rdbtn.Checked)
                    {
                        Session["ApptID"] = Convert.ToInt32(gridViewAppt.DataKeys[SelectedRow.RowIndex][0]);
                        Session["Header"] = "Appointment Details";
                        Response.Redirect("ViewAppointment.aspx");
                    }

                } 
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                foreach (GridViewRow SelectedRow in gridViewAppt.Rows)
                {
                    RadioButton rdbtn = (RadioButton)SelectedRow.FindControl("rdbtnApptID");
                    if (rdbtn != null && rdbtn.Checked)
                    {
                        if (Convert.ToBoolean(gridViewAppt.DataKeys[SelectedRow.RowIndex][1]) == false)
                        {
                            Session["ApptID"] = Convert.ToInt32(gridViewAppt.DataKeys[SelectedRow.RowIndex][0]);
                            Response.Redirect("DeleteAppointment.aspx");
                        }
                        else lblMesg.Text = "You have already cancelled this appointment.";
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnModify_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                foreach (GridViewRow SelectedRow in gridViewAppt.Rows)
                {
                    RadioButton rdbtn = (RadioButton)SelectedRow.FindControl("rdbtnApptID");
                    if (rdbtn != null && rdbtn.Checked)
                    {
                        if (Convert.ToBoolean(gridViewAppt.DataKeys[SelectedRow.RowIndex][1]) == false)
                        {
                            
                            Session["ApptID"] = Convert.ToInt32(gridViewAppt.DataKeys[SelectedRow.RowIndex][0]);
                            Response.Redirect("ModifyAppointment.aspx");
                        }
                        else lblMesg.Text = "You can not modify a cancelled appointment.";
                    }

                }
            }
            catch (Exception)
            {

                lblMesg.Text = "Something went wrong. Could not modify at this moment.";
            }
        }
    }
}