using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data;
using WebProject.AsyncWidgets.UI.Widgets;
using WebProject.AsyncWidgets.DAL;

namespace WebProject.AsyncWidgets
{
    public partial class eFormsAdmin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string assemblyName = System.Reflection.Assembly.GetExecutingAssembly().FullName;

            ScriptBlock sb = new ScriptBlock();
            // this.Master.
            //<link rel='stylesheet' type='text/css' href='/AsyncWidgets/AsyncWidgets/Widgets/resources/css/jquery.autocomplete.css' />
            /*
    <script language='javascript' type='text/javascript' src='Scripts/jquery.autocomplete.js'></script>          
             */
            System.Web.Configuration.AuthenticationSection section = (AuthenticationSection)WebConfigurationManager.GetSection("system.web/authentication");
            if (section.Mode.ToString().ToLower() == "windows")
            {
                NTAuthentication();
            }
            else
            {
                Session["EForms4UserId"] = "anoorahmed"; //"anoorahmed";"skumarvenkat";
                Session["AuthorisedRoles"] = @"('SysAdmin','SysRecipient','SysHistorySender','PWC_EformsTask_Team','PWC_EformsTask_Requestor','Pwc_IT_EFormsTechnicalTeam','PWC_EformsTask_Team','RPT_MobileBill','RPT_Admin')";

            }
            string scripts = string.Format("<script language='javascript' type='text/javascript' >ROOT_PATH='{0}';</script>", AsyncWidgets.Utility.UtilityFunctions.FixupUrl("~/")) +
    @"
<link href='Widgets/resources/css/common.eForms.css' rel='stylesheet' type='text/css' />
<link href='Widgets/resources/css/Widgets/TabPanel-jQueryUI-Gray.css' rel='stylesheet' type='text/css' />
<link href='Widgets/resources/css/jquery.autocomplete.css' rel='stylesheet' type='text/css' />

<script language='javascript' type='text/javascript' src='Scripts/jquery.js'></script>
<script language='javascript' type='text/javascript' src='Scripts/jquery.alphanumeric.js'></script>

<script language='javascript' type='text/javascript' src='Scripts/Custom-Ext.js'></script>  
                                             
<script language='javascript' type='text/javascript' src='Scripts/WidgetBase.js'></script>
";
            Literal ltr = (Literal)Master.FindControl("LastLiteral");
            ltr.Text = scripts;
            ltr.EnableViewState = false;
            //       Header.Controls.Add(new LiteralControl(
            //);

        }
        //protected void Page_PreRender(object sender, EventArgs e)
        //{
        //    Form.Controls.Add(new LiteralControl(@""));
        //}
        protected override void CreateChildControls()
        {
            string UserRoles;
            if (Session["AuthorisedRoles"] == null) UserRoles = "('Anonymous')";
            else
            {
                UserRoles = Session["AuthorisedRoles"].ToString();
                UserRoles = UserRoles.Trim() == "" ? "('Anonymous')" : UserRoles;
            }
            ProcessControls(this, UserRoles);
            base.CreateChildControls();
        }
        void ProcessControls(Control ctrl, string UserRole)
        {
            foreach (Control c in ctrl.Controls)
            {
                HtmlControl hc = c as HtmlControl;
                WebControl wc = c as WebControl;

                if (hc != null)
                {

                    string roles = hc.Attributes["Roles"];
                    if (roles != null)
                    {
                        //if (roles.IndexOf(UserRole, StringComparison.OrdinalIgnoreCase) == -1)
                        //{
                        if (UserRole.IndexOf(roles, StringComparison.OrdinalIgnoreCase) == -1)
                        {
                            hc.Visible = false;
                            continue;
                        }
                    }

                }
                else if (wc != null)
                {
                    string roles = wc.Attributes["Roles"];
                    if (roles != null)
                    {
                        if (UserRole.IndexOf(roles, StringComparison.OrdinalIgnoreCase) == -1)
                        {
                            wc.Visible = false;
                            continue;
                        }
                    }


                }

                //if (wc != null || hc != null)
                //{
                if (c.Controls.Count > 0)
                {
                    ProcessControls(c, UserRole);
                }
                //}

            }

        }

        protected void NTAuthentication()
        {
            string UserID = Request.ServerVariables["LOGON_USER"];
            UserID = UserID.Substring(UserID.IndexOf("\\") + 1);
            Session["EForms4UserId"] = UserID.ToString();
            AuthorisedRoles(UserID);
        }
        void AuthorisedRoles(string UserId)
        {
            //Authorised Roles are storedd as a session variable.........
            ParamDictionary<string, QueryParameter> pd = new ParamDictionary<string, QueryParameter>("GetUserInfo", "");
            pd.AddQueryParam("UserId", new QueryParameter(UserId));
            DataSet ds = AsyncWidgets.DAL.DBHelper.GetDataTableProc("sp_GetUserInfo", pd);

            if (ds.Tables[0].Rows.Count >= 3)
            {
                Session["OrganizationIDs"] = ds.Tables[0].Rows[0][0].ToString();
                Session["DepartmentIDs"] = ds.Tables[0].Rows[1][0].ToString();
                Session["AuthorisedRoles"] = ds.Tables[0].Rows[2][0].ToString();
                Session["AuthorisedID"] = Session.SessionID;

                //if (Session["AuthorisedRoles"] != null && Session["AuthorisedRoles"].ToString() != "")
                //{
                //    Response.Redirect("DotNetPages/reportsengine/SimpleSingleGraph.aspx");
                //    //Response.Redirect("Pages/ITProcessRequest/ITMangHomePage.aspx");
                //    //Response.Redirect("Pages/ReportsAdmin/AvailableReportsList.aspx");
                //}
            }
        }
    }
}
