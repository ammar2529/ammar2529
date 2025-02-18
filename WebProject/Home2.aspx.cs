using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                {
                    Response.Redirect("~/AdminPages/eForms/Login.aspx");

                    //frmHome.Hidden = false;
                    frmInbox.Hidden = true;
                }
            }
            else
            {
                //frmHome.Hidden = true;
                frmInbox.Hidden = false;
            }

       
        }
    }
}