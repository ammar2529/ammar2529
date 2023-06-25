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
using System.Configuration;
using System.Data.SqlClient;







using PWC.PresentationServices.Web.UI.Common;


namespace WebProject.ReportsEngine
{
    public partial class FormHistoryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["PageID"] = "Inbox";
                //txtError.Text = "";
                LoadFormHeader();
                GenerateReport();

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
        protected String SortField
        {

            get
            {
                object o = ViewState["SortField"];
                return (o == null) ? String.Empty : (String)o;

            }
            set
            {
                ViewState["SortField"] = value;
            }
        }

        private void LoadFormHeader()
        {

            string strSQL = "";
            string strTableName = "";
            if (Request.QueryString["T"].ToString() == "D")
            {
                // Get Table Name From DataProfileClasses
                strSQL = "Select DataSource From DataProfileClasses Where DataProfileClassId='" + Request.QueryString["FormName"].ToString() + "'";
                SqlCommand cmd1 = new SqlCommand(strSQL, new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
                cmd1.Connection.Open();
                strTableName = cmd1.ExecuteScalar().ToString();
                cmd1.Connection.Close();
                cmd1.Dispose();
                // Get Table Name From GlobalInboxType
                strSQL = "Select FormName From GlobalInboxType Where DataProfileId = '" + Request.QueryString["FormName"].ToString() + "'";
            }
            else
            {
                // Get Table Name From Query String
                strTableName = Request.QueryString["FormName"].ToString();
                // Get Table Name From GlobalInboxType
                strSQL = "Select FormName From GlobalInboxType Where FormType = '" + Request.QueryString["FormName"].ToString() + "'";
            }

            SqlCommand cmd2 = new SqlCommand("Select FormName From GlobalInboxType Where DataProfileId = '" + Request.QueryString["FormName"].ToString() + "'", new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
            cmd2.Connection.Open();
            object objFormName = cmd2.ExecuteScalar();
            string strFormName = "";
            if (objFormName == null)
                strFormName = Request.QueryString["FormName"].ToString();
            else
                strFormName = objFormName.ToString();
            cmd2.Connection.Close();
            cmd2.Dispose();

            string strSql = "Select FormCode,IsNull(C.Name,P.CreatedBy) CreatedBy, IsNull(CF.Name,P.RequestFor) CreatedFor ,IsNull(S.Name,SenderId) SenderName,IsNull(R.Name,RecipientId)RecipientName ,P.DateModified ReceivedDate,IsNull(DPS.StateName,P.StateId) CurrentStatus,p.DateCreated as DateCreated" +
                " From  " + strTableName + " P " +
                " Left Outer Join Users C On C.UserId=P.CreatedBy " +
                " Left Outer Join Users CF On CF.UserId=P.RequestFor " +
                " Left Outer Join Users S On S.UserId=P.SenderId " +
                " Left Outer Join Users R On R.UserId=P.RecipientId " +
                " Left Outer Join DataProfileClassWFStates DPS On DPS.StateId=P.StateId " +
                " Where FormCode = '" + Request.QueryString["FormCode"].ToString() + "'";


            //string strSql = "Select * From " + Request.QueryString["FormName"].ToString() + " Where FormCode = '" + Request.QueryString["FormCode"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(strSql, new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
            cmd.Connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblFormName.Text = strFormName;
                lblFormCode.Text = Request.QueryString["FormCode"].ToString();
                lblCreatedBy.Text = dr["CreatedBy"].ToString();
                lblCreatedFor.Text = dr["CreatedFor"].ToString();
                lblSenderName.Text = dr["SenderName"].ToString();
                lblRecipientName.Text = dr["RecipientName"].ToString();
                lblDateCreated.Text = Convert.ToDateTime(dr["DateCreated"]).ToString("dd/MM/yyyy hh:mm:ss tt");
                lblCurrentStatus.Text = dr["CurrentStatus"].ToString();
                lblReceivedDate.Text = Convert.ToDateTime(dr["ReceivedDate"]).ToString("dd/MM/yyyy hh:mm:ss tt");//  .ToString();
            }
            dr.Close();
            cmd.Connection.Close();
            cmd.Dispose();
        }

        private void DataGrid1_Command(object sender, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                string strID = e.Item.Cells[0].Text;
                string strLink = e.Item.Cells[11].Text;

                Session["FormID"] = strID;
                Response.Redirect(strLink);
            }


            if (e.CommandName == "List")
            {
                string strLink = e.Item.Cells[11].Text;
                string strListLink = strLink.Replace("View", "List");
                Response.Redirect(strListLink);
            }


            //History 	
            if (e.CommandName == "History")
            {
                Session["FormID"] = e.Item.Cells[0].Text;
                Session["TableName"] = e.Item.Cells[12].Text;
                Session["HistoryTableName"] = e.Item.Cells[13].Text;
                Session["FieldName"] = e.Item.Cells[14].Text;
                Response.Write("<SCR" + "IPT>window.open('ListHistory.aspx','_blank','titlebar=no,scrollbars=yes,height=400,width=600');</SCR" + "IPT>");
            }

        }

        private void GenerateReport()
        {
            DataSet ds = new DataSet();
            ds = this.GetDataSet();
            //lblRecordCount.Text = ds.Tables[0].Rows.Count.ToString();
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
            //dgPRFReport.Columns[0].ItemStyle.ForeColor = Color.Blue;
        }

        private System.Data.DataSet GetDataSet()
        {
            string strSQL = "";
            string strTableName = "";
            if (Request.QueryString["T"].ToString() == "D")
            {
                // Get Data Profile Class From Query String
                strTableName = Request.QueryString["FormName"].ToString();
            }
            else
            {
                // Get DataProfileClass From Table Name in Query String
                strSQL = "Select DataProfileClassId From DataProfileClasses Where DataSource='" + Request.QueryString["FormName"].ToString() + "'";
                SqlCommand cmd1 = new SqlCommand(strSQL, new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
                cmd1.Connection.Open();
                strTableName = cmd1.ExecuteScalar().ToString();
                cmd1.Connection.Close();
                cmd1.Dispose();
            }

            // For DataGrid Display Purpose

            SqlCommand mySelectCommand = new SqlCommand();

            mySelectCommand.Connection = new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString_Audit"]);
            mySelectCommand.CommandText = "Sp_Get_FormHistory_List";
            mySelectCommand.CommandType = CommandType.StoredProcedure;
            mySelectCommand.Parameters.Add("@DatabseNameParam", SqlDbType.VarChar, 50);
            mySelectCommand.Parameters.Add("@FormNameParam", SqlDbType.VarChar, 50);
            mySelectCommand.Parameters.Add("@FormCodeParam", SqlDbType.VarChar, 50);
            mySelectCommand.Parameters["@DatabseNameParam"].Value = ConfigurationSettings.AppSettings["eFromsDBName"].ToString();
            mySelectCommand.Parameters["@FormNameParam"].Value = strTableName;
            mySelectCommand.Parameters["@FormCodeParam"].Value = Request.QueryString["FormCode"].ToString();

            SqlDataAdapter myCommand = new SqlDataAdapter(mySelectCommand);

            DataSet ds = new DataSet();


            try
            {
                myCommand.Fill(ds);

            }
            catch (Exception ex)
            {
                throw (ex);
            }

            return ds;

        }

        private void DataGrid1_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
        {

        }

        protected void lbtnGraph_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("FormHistoryChart.aspx?FormName=" + Request.QueryString["FormName"].ToString() + "&FormCode=" + Request.QueryString["FormCode"].ToString() + "&Story=" + Request.QueryString["Story"].ToString() + "&U=" + Request.QueryString["U"].ToString() + "&T=" + Request.QueryString["T"].ToString());
        }

        protected void lbtnList_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("FormHistoryList.aspx?FormName=" + Request.QueryString["FormName"].ToString() + "&FormCode=" + Request.QueryString["FormCode"].ToString() + "&Story=" + Request.QueryString["Story"].ToString() + "&U=" + Request.QueryString["U"].ToString() + "&T=" + Request.QueryString["T"].ToString());
        }

        protected void lbtnFlowDiagram_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("FormHistoryFlow.aspx?FormName=" + Request.QueryString["FormName"].ToString() + "&FormCode=" + Request.QueryString["FormCode"].ToString() + "&Story=" + Request.QueryString["Story"].ToString() + "&U=" + Request.QueryString["U"].ToString() + "&T=" + Request.QueryString["T"].ToString());
        }

        protected void lbtnEmail_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("FormHistoryEmail.aspx?FormName=" + Request.QueryString["FormName"].ToString() + "&FormCode=" + Request.QueryString["FormCode"].ToString() + "&Story=" + Request.QueryString["Story"].ToString() + "&U=" + Request.QueryString["U"].ToString() + "&T=" + Request.QueryString["T"].ToString());
        }
    }
}