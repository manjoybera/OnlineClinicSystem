using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.ErrorPages
{
    public partial class ErrorGeneral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["UserType"]) == true) Response.Redirect("ErrorAdmin.aspx");
            if (Convert.ToBoolean(Session["UserType"]) == false) Response.Redirect("ErrorUser.aspx");
        }
    }
}