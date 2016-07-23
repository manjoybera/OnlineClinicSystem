using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                // To get user ID from session
                authLogin.UserID = Convert.ToInt32(Session["UserID"]);

                // To update admin permissions table
                authLogin.UpdateAdminPermissions();

                // To update login information.
                authLogin.LogOnInfo();
                lblName.Text = Convert.ToString(Session["FirstName"]);
                lblFailedLoginIP.Text = authLogin.FailedLogOnIP;
                lblFailedLoginTime.Text = authLogin.FailedLogOnTime;

                // For storing last login ip, time only once in a entire session
                if (Convert.ToBoolean(Session["LoginStatus"]) == false)
                {
                    Session["LastLoginIP"] = authLogin.LastLogOnIP;
                    Session["LastLoginTime"] = authLogin.LastLogOnTime;
                    Session["LoginStatus"] = true;
                }

                // Storing last login ip, time in sessions
                lblLastLoginIP.Text = Convert.ToString(Session["LastLoginIP"]);
                lblLastLoginTime.Text = Convert.ToString(Session["LastLoginTime"]);

                // Updating login info, status each time the page loads
                authLogin.LogOnStatusUpdate();
                if (lblFailedLoginIP.Text == "") divFailedLoginInfo.Visible = false;
                if (lblLastLoginIP.Text == "") divLastLoginInfo.Visible = false;

                bool flag = Convert.ToBoolean(Session["FirstTime"]);
                if (flag == true)
                {
                    Response.Write("<script>alert('Please Change your password immediately.')</script>");
                    Session["FirstTime"] = false;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }
    }
}