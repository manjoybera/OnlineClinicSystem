using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.General
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Happy(object sender, EventArgs e)
        {
            Message.Text = "Thank You. We are pleased to serve you.";
        }

        protected void Okay(object sender, EventArgs e)
        {
            Message.Text = "We will try to improve our services to serve you better.";
        }

        protected void Sad(object sender, EventArgs e)
        {
            Message.Text = "We are Sorry to hear that. We will get back to you soon."; 
        }
    }
}