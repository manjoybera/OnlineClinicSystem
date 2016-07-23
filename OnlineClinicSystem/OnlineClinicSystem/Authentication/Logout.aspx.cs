using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Authentication
{

    public partial class Logout : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if ((Session["UserType"] == null) || (Session["UserID"] == null)) Response.Redirect("../Index.aspx");
                else
                {
                    authLogin.UserID = Convert.ToInt32(Session["UserID"]);
                    authLogin.LogOffStatusUpdate();
                    Session["UserID"] = null;
                    Session["FirstTime"] = null;
                    Session["UserType"] = null;
                    Session["FirstName"] = null;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            

        }
    }
}