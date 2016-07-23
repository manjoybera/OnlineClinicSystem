using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class ModifyDoctor : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Doctor DoctorDetails= new OnlineClinicSystemClassLibrary.Doctor();

        
        protected void Page_Load(object sender, EventArgs e)
        {

            txtDoctorDOB_Calendar.EndDate = DateTime.Now.AddYears(-23);
            txtDoctorDOJ_Calendar.EndDate = DateTime.Now.Date;

            if (IsPostBack == false)
            {
                divDtailsMsg.Visible = false;
                divDetails.Visible = false;
    
                txtDOJ.Text = "";
                txtDOB.Text = "";
            }
        }

        protected void btnUpdate_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                DoctorDetails.DoctorID = Convert.ToInt32(txtDocID.Text);
                DoctorDetails.DoctorName = txtName.Text;
                DoctorDetails.Dob = Convert.ToDateTime(txtDOB.Text);
                DoctorDetails.Doj = Convert.ToDateTime(txtDOJ.Text);
                DoctorDetails.Gender = rblGender.SelectedItem.Text;
                DoctorDetails.Qualification = txtQualification.Text;
                DoctorDetails.Specialization = txtSpec.Text;
                DoctorDetails.Experience = Convert.ToInt32(txtYOE.Text);
                DoctorDetails.Address1 = txtAddress1.Text;
                DoctorDetails.Address2 = txtAddress2.Text;
                DoctorDetails.PhoneNo = txtPhoneNo.Text;
                
                int flag=DoctorDetails.ModifyDoctorDetails();
                if (flag > 0)
                {
                    lblDocID.Text = "Doctor details updated successfully.";
                    EnableEditDetails(false);
                }
                else lblDocID.Text = "Doctor details could not be updated.";



            }
            catch (Exception)
            {
                lblDocID.Text = "Entered Parameter are Invalid ,Try Again.";
                
            }
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            EnableEditDetails(true);
            txtDoctorDOB_Calendar.SelectedDate = Convert.ToDateTime(txtDOB.Text);
            lblDocID.Text = string.Empty;
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            DoctorDetails.DoctorID = Convert.ToInt32(txtDocID.Text);
            int flag = DoctorDetails.DeleteDoctorDetails();
            if (flag > 0)
            {
                lblDocID.Text = "Doctor details deleted successfully for: " + DoctorDetails.DoctorID;
                divDtailsMsg.Visible = false;
                divDetails.Visible = false;
            }
            else lblDocID.Text = "Doctor details could not be deleted.";
        }

        protected void btnView_Click(object sender, ImageClickEventArgs e)
        {
            lblDocID.Text = string.Empty;
            DoctorDetails.DoctorID = Convert.ToInt32(txtDocID.Text);
            int flag = DoctorDetails.ViewDoctorDetails();


            if (flag > 0)
            {
                if (DoctorDetails.Gender == "Male") rblGender.SelectedIndex = 0;
                else if (DoctorDetails.Gender == "Female") rblGender.SelectedIndex = 1;
                else rblGender.SelectedIndex = 2;

                txtName.Text = DoctorDetails.DoctorName;
                txtDOB.Text = DoctorDetails.Dob.ToShortDateString();
                txtDOJ.Text = DoctorDetails.Doj.ToShortDateString();
                txtQualification.Text = DoctorDetails.Qualification;
                txtSpec.Text = DoctorDetails.Specialization;
                txtYOE.Text = Convert.ToString(DoctorDetails.Experience);
                txtAddress1.Text = DoctorDetails.Address1;
                txtAddress2.Text = DoctorDetails.Address2;
                txtPhoneNo.Text = DoctorDetails.PhoneNo;
                EnableEditDetails(false);

                divDtailsMsg.Visible = true;
                divDetails.Visible = true;

            }
            else
            {
                lblDocID.Text = "The Doctor ID requested by you does not exist.";
                divDtailsMsg.Visible = false;
                divDetails.Visible = false;
            }
        }

        protected void EnableEditDetails(bool status)
        {

            txtName.Enabled = status;
            txtDOB.Enabled = status;
            txtDOJ.Enabled = status;
            txtQualification.Enabled = status;
            txtSpec.Enabled = status;
            txtYOE.Enabled = status;
            txtAddress1.Enabled = status;
            txtAddress2.Enabled = status;
            txtPhoneNo.Enabled = status;
            rblGender.Enabled = status;
        }
    }
}