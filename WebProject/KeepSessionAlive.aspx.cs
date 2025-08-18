
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class KeepSessionAlive : System.Web.UI.Page
    {
        protected string WindowStatusText = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Temporary for testing: Abandon session if ?abandon=true
            if (Request.QueryString["abandon"] == "true")
            {
                Session.Abandon();
            }

            if (HttpContext.Current.Session == null || Session["UserID"] == null)
            {
                // Session timeout ho gaya hai
                Response.Redirect("BudastoorLogin.aspx"); // BREAKPOINT HERE
                return;
            }

            try
            {
                if (User.Identity.IsAuthenticated)
                {
                    // Meta refresh ko 10 seconds ke liye set karna (testing ke liye)
                    MetaRefresh.Attributes["content"] = "10;url=KeepSessionAlive.aspx?q=" + DateTime.Now.Ticks;
                    WindowStatusText = "Last refresh " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                }
            }
            catch (Exception ex)
            {
                // Log error
                Response.Redirect("Error.aspx");
            }
        }
    }
}
