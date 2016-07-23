using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class AddDoctor : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.Doctor DoctorDetails = new OnlineClinicSystemClassLibrary.Doctor();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            

            if (IsPostBack == false)
            {

                txtDOBCalender.SelectedDate = DateTime.Now.AddYears(-23);
                txtDOBCalender.EndDate = DateTime.Now.AddYears(-23);
                txtDOJCalender.EndDate = DateTime.Now.Date;
                txtDOJ.Text = "";
                txtDOB.Text = "";
            }
            
        }

        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
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
                
                int flag=DoctorDetails.AddDoctorDetails();
                if (flag > 999)
                {
                    lblMessage.Text = "New Doctor details added successfully with ID: " + flag;
                    divDetails.Visible = false;
                }
                else lblMessage.Text = "Unable to add new Doctor Details";
                

            }
            catch (Exception)
            {
                lblMessage.Text = "Invalid Parameters entered. Please try again.";
            }
            
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {  
            txtName.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtDOJ.Text = string.Empty;
            txtQualification.Text = string.Empty;
            txtSpec.Text= string.Empty;
            txtYOE.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            lblMessage.Text = string.Empty;
        }
    }
}