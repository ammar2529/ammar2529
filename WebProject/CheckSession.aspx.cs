using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class CheckSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session == null || Session["UserID"] == null)
            {
                Response.Write("expired");
            }
            else
            {
                Response.Write("active");
            }
        }
    }
}