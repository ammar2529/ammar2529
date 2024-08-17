using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebProject.Pages.eForms.iRental.Modules
{
    public partial class SparePartInventory1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected override void CreateChildControls()
        //{
        //    string UserRoles;
        //    if (Session["Roles"] == null) UserRoles = "('Anonymous')";
        //    else
        //    {
        //        UserRoles = Session["Roles"].ToString();
        //        UserRoles = UserRoles.Trim() == "" ? "('Anonymous')" : UserRoles;
        //    }
        //    ProcessControls(this, UserRoles);
        //    base.CreateChildControls();
        //}

        //void ProcessControls(Control ctrl, string UserRole)
        //{
        //    foreach (Control c in ctrl.Controls)
        //    {
        //        HtmlControl hc = c as HtmlControl;
        //        WebControl wc = c as WebControl;

        //        if (hc != null)
        //        {

        //            string roles = hc.Attributes["Roles"];
        //            string DisplayRoles = hc.Attributes["DisplayRoles"];
        //            if (roles != null)
        //            {
        //                if (UserRole.IndexOf(roles, StringComparison.OrdinalIgnoreCase) == -1)
        //                {
        //                    hc.Visible = false;
        //                    continue;
        //                }
        //            }
        //            if (DisplayRoles != null)
        //            {
        //                if (UserRole.IndexOf(DisplayRoles, StringComparison.OrdinalIgnoreCase) == -1)
        //                {
        //                    hc.Style.Add("display", "none");
        //                    continue;
        //                }
        //            }
        //        }
        //        else if (wc != null)
        //        {
        //            string roles = wc.Attributes["Roles"];
        //            if (roles != null)
        //            {
        //                if (UserRole.IndexOf(roles, StringComparison.OrdinalIgnoreCase) == -1)
        //                {
        //                    wc.Visible = false;
        //                    continue;
        //                }
        //            }


        //        }

        //        if (c.Controls.Count > 0)
        //        {
        //            ProcessControls(c, UserRole);
        //        }
        //    }
        //}
    }
}