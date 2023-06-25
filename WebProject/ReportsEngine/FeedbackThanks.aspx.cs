using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using PWC.PresentationServices.Web.UI.Common;


namespace WebProject.ReportsEngine
{
    public partial class FeedbackThanks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblProcessName.Text = "N/A";

            if (Request.QueryString["ProcessName"] != null)
            {
                lblProcessName.Text = Request.QueryString["ProcessName"];
            }


            #region Adding PWCMenu_eng.css and StyleSheet_eng.css style sheets
            if (Session[FWConstants.SessionVariableNames.THEMEID] != null)
            {
                HtmlLink css = new HtmlLink();
                css.Href = "../../" + PWC.PresentationServices.Web.UI.Common.ThemeInterface.GetStyleSheet(Session[FWConstants.SessionVariableNames.THEMEID].ToString(), Session[FWConstants.SessionVariableNames.USER_LANGUAGE].ToString(), "PWCMenu").ToString();
                css.Attributes["rel"] = "stylesheet";
                css.Attributes["type"] = "text/css";
                Page.Header.Controls.Add(css);

                HtmlLink css1 = new HtmlLink();
                css1.Href = "../../" + PWC.PresentationServices.Web.UI.Common.ThemeInterface.GetStyleSheet(Session[FWConstants.SessionVariableNames.THEMEID].ToString(), Session[FWConstants.SessionVariableNames.USER_LANGUAGE].ToString(), "StyleSheet").ToString();
                css1.Attributes["rel"] = "stylesheet";
                css1.Attributes["type"] = "text/css";
                Page.Header.Controls.Add(css1);
            }
            #endregion
        }

        public string ImageDirection(string posNeg)
        {
            if (posNeg == "positive")
            {
                if (Session[FWConstants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "rtl";
                else return "ltr";
            }
            else if (Session[FWConstants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "ltr";
            else return "rtl";
        }
    }
}