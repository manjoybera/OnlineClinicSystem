using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Authentication
{
    public partial class RegFalse : System.Web.UI.Page
    {
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
    }
}