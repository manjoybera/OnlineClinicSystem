using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace OnlineClinicSystem.Admin
{
    public partial class ViewAppointments : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Appointment UserAppointments = new OnlineClinicSystemClassLibrary.Appointment();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            divMsg.Visible = false;
            divTable.Visible = false;
            divButtons.Visible = false;
        }

        protected void btnConfirm_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                UserAppointments.DoctorID = Convert.ToInt32(txtDocID.Text);
                DataSet dsViewAllAppointments = new DataSet();
                int flag = UserAppointments.ViewAllAppointment();
                dsViewAllAppointments = UserAppointments.DSAppointments;
                if (flag > 0)
                {
                    gridViewAllAppt.DataSource = dsViewAllAppointments;
                    gridViewAllAppt.DataBind();
                    divTable.Visible = true;
                    divButtons.Visible = true;
                    lblGridMsg.Text = "";
                    lblDocID.Text = "";

                }
                else
                {
                    lblGridMsg.Text = "There are no such Appointment details.";
                    divTable.Visible = false;
                    divButtons.Visible = false;
                }

                divMsg.Visible = true;

            }
            catch (Exception)
            {
               lblDocID.Text = "Invalid Entries,Try Again.";
                
            }
           
        }

        protected void btnView_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                foreach (GridViewRow SelectedRow in gridViewAllAppt.Rows)
                {
                    RadioButton rdbtn = (RadioButton)SelectedRow.FindControl("rdbtnApptID");
                    if (rdbtn != null && rdbtn.Checked)
                    {
                        Session["ApptID"] = Convert.ToInt32(gridViewAllAppt.DataKeys[SelectedRow.RowIndex][0]);
                        Response.Redirect("ViewDetails.aspx");
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}