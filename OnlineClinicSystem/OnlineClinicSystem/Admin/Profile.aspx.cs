using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineClinicSystem.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        OnlineClinicSystemClassLibrary.LogOn authLogin = new OnlineClinicSystemClassLibrary.LogOn();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                authLogin.UserID = Convert.ToInt32(Session["UserID"]);
                authLogin.Password = txtOld.Text;
                authLogin.NewPassword = txtNewPass.Text;
                int flag = authLogin.ChangePassword();
                if (flag > 0)
                    lblMessage.Text = "Password changed Successfully.";
                else lblMessage.Text = "Password not changed. Please try again";

            }
            catch (Exception)
            {
                lblMessage.Text = "Entries are Invalid,Please try again";
                
                
            }
            
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
            txtOld.Text = string.Empty;
            txtNewPass.Text = string.Empty;
            txtConPass.Text = string.Empty;
            lblMessage.Text = string.Empty;
        }

        


       
    }
}