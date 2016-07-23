using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace OnlineClinicSystem
{
    public class Global : System.Web.HttpApplication
    {
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Session["UserType"] = null;
            Session["FirstName"] = null;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            
           Response.Redirect("~/ErrorPages/ErrorGeneral.aspx");

        }

        protected void Session_End(object sender, EventArgs e)
        {
            try
            {

                authLogin.UserID = Convert.ToInt32(Session["UserID"]);
                authLogin.LogOffStatusUpdate();
                Session["UserID"] = null;
                Session["FirstTime"] = null;
                Session["UserType"] = null;
                Session["FirstName"] = null;
            }
            catch (Exception)
            {

                throw;
            }
            
            
            Session.Abandon();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            
        }
    }
}