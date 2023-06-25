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

using System.Data.SqlClient;
using System.Drawing;
using System.Xml;

using PWC.PresentationServices.Web.UI.Common;

public partial class DotNetPages_ReportsEngine_FeedBack : System.Web.UI.Page
{
    string FeedbackInsert = @"
INSERT INTO AdmFeedback
                      (UserId, Topic, Comments, Rating, ProcessName)
VALUES     ('{0}', '{1}', N'{2}', {3},'{4}')
";
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
        lblProcessName.Text = "N/A";

        if (Request.QueryString["ProcessName"] != null)
        {
            lblProcessName.Text = Request.QueryString["ProcessName"];
        }

        #region Adding PWCMenu_eng.css and StyleSheet_eng.css style sheets
        if(Session[FWConstants.SessionVariableNames.THEMEID]!=null)
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
        hdfbackButton.Value = PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif");
        hdfBackSelected.Value = PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBackSelected.gif");
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
    protected void btnSendFeedback_Click(object sender, EventArgs e)
    {
        string UserId="",FeedbackComments="",ProcessName="",Topic="";

        if (this.Session["EForms4UserId"] != null)
        {
            UserId = this.Session["EForms4UserId"].ToString();
        }

        ProcessName = lblProcessName.Text;

        int Rating;
        bool IsExceptionOccured = false;
        Rating = GetRating();
        if (txtFeedBackTopicSelected.Value.Trim() != string.Empty)
            Topic = txtFeedBackTopicSelected.Value.Substring(3);
        else
            Topic = "Compliment";
        FeedbackComments = txtFeedBackComments.Text.Replace("'","") ;
        string SQLFeedbackInsert = string.Format(FeedbackInsert, UserId, Topic, FeedbackComments, Rating, ProcessName);
        try
        {
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                CUtilityWeb.ExecScript(SQLFeedbackInsert, Conn);

            }
        }
        catch(Exception ex)
        {
            IsExceptionOccured = true;
            lblErrorMessage.Visible = true;
        }
        if (!IsExceptionOccured)
        {
            Response.Redirect("feedbackthanks.aspx?ProcessName=" + ProcessName, true);
        }

    }

    int GetRating()
    {
        string Rating = txtSelectedImage.Value.Trim();
        int iRating = 0;
        if (Rating == "")
        {
            return 0;
        }
        else
        {
            int.TryParse(Rating.Substring(Rating.Length - 1),out iRating);
            return iRating;
        }
    }
}

