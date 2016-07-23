using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineClinicSystemClassLibrary;

namespace OnlineClinicSystem.Authentication
{
    public partial class Login : System.Web.UI.Page
    {

        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

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
                authLogin.UserID = Convert.ToInt32(txtUserID.Text);
                authLogin.Password = txtPassword.Text;
                Session["LoginStatus"] = false;
                int flagLogin = authLogin.UserLogOn();
                if (flagLogin > 0)
                {
                    Session["UserID"] = authLogin.UserID;
                    Session["FirstTime"] = authLogin.FirstTime;
                    Session["UserType"] = authLogin.UserType;
                    Session["FirstName"] = authLogin.FirstName;
                    Session["LoginStatus"] = false;
                    if (authLogin.UserType == true)
                    {
                        Response.Redirect("../Admin/AdminHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("../User/UserHome.aspx");
                    }
                }
                else
                {
                    Session["LoginStatus"] = authLogin.LogOnStatus;
                    Response.Redirect("LoginFalse.aspx");
                }
            }
            catch (Exception)
            {
               lblMessage.Text = "Invalid parameters entered";

            }
            
            
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
            txtUserID.Text = string.Empty;
            txtPassword.Text = string.Empty;
            lblMessage.Text = string.Empty;
        }
    }
}