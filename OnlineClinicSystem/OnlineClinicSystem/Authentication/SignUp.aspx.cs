using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineClinicSystemClassLibrary;
using System.Security.Cryptography;

namespace OnlineClinicSystem.Authentication
{
    public partial class SignUp : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.User UserDetails= new OnlineClinicSystemClassLibrary.User();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                DOBCalender.EndDate = DateTime.Now.AddDays(-1);
                if ((Session["UserType"] != null) && (Session["UserID"] != null))
                {
                    if (Convert.ToBoolean(Session["UserType"]) == true) Response.Redirect("../Admin/AdminHome.aspx");
                    if (Convert.ToBoolean(Session["UserType"]) == false) Response.Redirect("../User/UserHome.aspx");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
        {
            try 
	            {	
                
		        UserDetails.FirstName= txtFirstName.Text;
                UserDetails.LastName= txtLastName.Text;
                UserDetails.Dob= Convert.ToDateTime(txtDOB.Text);
                UserDetails.Gender= rblGender.SelectedItem.Text;
                UserDetails.Password= txtConfirmPass.Text;
                UserDetails.Address1= txtAddress1.Text;
                UserDetails.Address2= txtAddress2.Text;
                UserDetails.PhoneNo= txtPhoneNo.Text;
                UserDetails.Email = txtEmail.Text;
                UserDetails.AddUserDetails();
                
                Session["UserID"]=UserDetails.UserID;
                if(UserDetails.UserID>2000) Response.Redirect("RegTrue.aspx");
                else Response.Redirect("RegFalse.aspx");
	            }

	        catch (Exception)
	            {

                    lblMessage.Text = "Invalid parameters entered.";
	            }
            
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
            txtFirstName.Text="";
            txtLastName.Text="";
            txtDOB.Text = "";
            rblGender.SelectedIndex =0;
            txtConfirmPass.Text="";
            txtAddress1.Text="";
            txtAddress2.Text="";
            txtPhoneNo.Text="";
            txtEmail.Text="";
            lblMessage.Text = "";
        }
    }
}