using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.User
{
    public partial class UserHome : System.Web.UI.Page
    {
        
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();
        OnlineClinicSystemClassLibrary.Appointment notifications = new OnlineClinicSystemClassLibrary.Appointment();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                // To get user ID in Seesion
                authLogin.UserID = Convert.ToInt32(Session["UserID"]);

                // To update user permissions table
                authLogin.UpdateUserPermissions();

                // To fetch last login information
                authLogin.LogOnInfo();
                lblName.Text = Convert.ToString(Session["FirstName"]);
                lblFailedLoginIP.Text = authLogin.FailedLogOnIP;
                lblFailedLoginTime.Text = authLogin.FailedLogOnTime;

                // for storing last login ip, time only once in a entire session
                if (Convert.ToBoolean(Session["LoginStatus"]) == false)
                {
                    Session["LastLoginIP"] = authLogin.LastLogOnIP;
                    Session["LastLoginTime"] = authLogin.LastLogOnTime;
                    Session["LoginStatus"] = true;
                }

                //storing last login ip, time in sessions
                lblLastLoginIP.Text = Convert.ToString(Session["LastLoginIP"]);
                lblLastLoginTime.Text = Convert.ToString(Session["LastLoginTime"]);

                // updating login info, status each time
                authLogin.LogOnStatusUpdate();
                if (lblFailedLoginIP.Text == "") divFailedLoginInfo.Visible = false;
                if (lblLastLoginIP.Text == "") divLastLoginInfo.Visible = false;

                bool flag = Convert.ToBoolean(Session["FirstTime"]);
                if (flag == true)
                {
                    Response.Write("<script>alert('Please Change your password immediately.')</script>");
                    Session["FirstTime"] = false;
                }

                notifications.PatientID = Convert.ToInt32(Session["UserID"]);
                int intCount = notifications.ModifiedNotification();
                if (intCount > 0)
                {
                    Response.Write("<script>alert('You have " + intCount + " new Appointment Changes. Please have a look.')</script>");
                }
            }
            catch (Exception)
            {
                
                throw;
            }

            
        }
    }
}