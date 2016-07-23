using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace OnlineClinicSystem
{
    /// <summary>
    /// Summary description for MainServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    // To allow this Web Service to be called from script, using ASP.NET AJAX. 
    [System.Web.Script.Services.ScriptService]

    public class MainServices : System.Web.Services.WebService
    {

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public AjaxControlToolkit.Slide[] GetPhotos()
        {
            AjaxControlToolkit.Slide[] photos = new AjaxControlToolkit.Slide[5];
            for (int i = 1; i <=5; i++)
            {

                photos[i-1] = new AjaxControlToolkit.Slide("Resources/SlideNo" +i+".jpg", "SlideNo" +i+ ".jpg", "");
            }
            return photos;
        }
    }
}
