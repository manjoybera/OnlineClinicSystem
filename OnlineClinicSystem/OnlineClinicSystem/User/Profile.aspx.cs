using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.User
{
    public partial class Profile : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();
        OnlineClinicSystemClassLibrary.User userDetails = new OnlineClinicSystemClassLibrary.User();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                txtDOB_CalendarAppt.EndDate = DateTime.Now.AddDays(-1);
                
                if (IsPostBack == false)
                {
                    txtDOB.Text = "";
                    userDetails.UserID = Convert.ToInt32(Session["UserID"]);
                    int flag = userDetails.ViewUserDetails();
                    if (flag > 0)
                    {
                        txtFirstName.Text = userDetails.FirstName;
                        txtLastName.Text = userDetails.LastName;
                        txtDOB.Text = userDetails.Dob.ToShortDateString();
                        txtAddress1.Text = userDetails.Address1;
                        txtAddress2.Text = userDetails.Address2;
                        txtPhoneNo.Text = userDetails.PhoneNo;
                        txtEmail.Text = userDetails.Email;
                        if (userDetails.Gender == "Male") rblGender.SelectedIndex = 0;
                        else if (userDetails.Gender == "Female") rblGender.SelectedIndex = 1;
                        else rblGender.SelectedIndex = 2;
                    }

                    EnableEditDetails(false);
                    
                }
                
            }
            catch (Exception)
            {

                lblPassMsg.Text = "Details could not be fetched. Something went wrong";
            }
            
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
            txtOld.Text = string.Empty;
            txtNewPass.Text = string.Empty;
            txtConPass.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                authLogin.UserID = Convert.ToInt32(Session["UserID"]);
                authLogin.Password = txtOld.Text;
                authLogin.NewPassword = txtNewPass.Text;
                int flag = authLogin.ChangePassword();
                if (flag > 0)
                    lblPassMsg.Text = "Password changed Successfully.";
                else lblPassMsg.Text = "Password not changed. Please try again";
            }
            catch (Exception)
            {

                lblPassMsg.Text = "Password not changed. Invalid parameters.";
            }
            
        }

        protected void btnUpdateDetails_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                userDetails.UserID = Convert.ToInt32(Session["UserID"]);
                userDetails.FirstName = txtFirstName.Text;
                userDetails.LastName = txtLastName.Text;
                userDetails.Dob = Convert.ToDateTime(txtDOB.Text);
                userDetails.Address1 = txtAddress1.Text;
                userDetails.Address2 = txtAddress2.Text;
                userDetails.PhoneNo = txtPhoneNo.Text;
                userDetails.Email = txtEmail.Text;
                userDetails.Gender = rblGender.SelectedItem.Text;

                int flag = userDetails.EditUserDetails();

                if (flag > 0)
                {
                    lblAccountMsg.Text = "Account Details Updated Successfully.";
                    EnableEditDetails(false);
                }
                else lblAccountMsg.Text = "There was a problem updating your details.";
            }
            catch (Exception)
            {

                lblAccountMsg.Text = "Details could not be updated. Invalid parameters.";
            }
            
            
        }


        protected void EnableEditDetails(bool status)
        {

            txtFirstName.Enabled = status;
            txtLastName.Enabled = status;
            txtDOB.Enabled = status;
            txtAddress1.Enabled = status;
            txtAddress2.Enabled = status;
            txtPhoneNo.Enabled = status;
            txtEmail.Enabled = status;
            rblGender.Enabled = status;
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            EnableEditDetails(true);
        }


    }
}