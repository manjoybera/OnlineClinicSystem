using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.MasterPages
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Convert.ToBoolean(Session["UserType"]) == false) || (Session["UserType"] == null) || (Session["UserID"] == null))
                Response.Redirect("../Index.aspx");

            // Stop Caching in IE
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);

            // Stop Caching in Firefox
            Response.Cache.SetNoStore();
        }
    }
}