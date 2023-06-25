using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)//user logged in
            {
                frmHome.Hidden = true;
                frmInbox.Hidden = false;
            }
            else
            {
                frmHome.Hidden = false;
                frmInbox.Hidden = true;
            }
        }
    }
}