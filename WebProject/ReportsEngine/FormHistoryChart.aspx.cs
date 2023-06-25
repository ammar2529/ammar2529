using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
using System.Drawing;
using dotnetCHARTING;

namespace WebProject.ReportsEngine
{
    public partial class FormHistoryChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["PageID"] = "Inbox";
                //txtError.Text = "";
                LoadFormHeader();
                LoadCharts();
            }
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
            //string strRequestURL = Request.UserAgent;
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

            SqlCommand cmd2 = new SqlCommand(strSQL, new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
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

        private void LoadCharts()
        {
            //			string strSQL = "";
            //			string strTableName ="";
            //			if (Request.QueryString["T"].ToString()=="D")
            //			{
            //				// Get Data Profile Class From Query String
            //				strTableName = Request.QueryString["FormName"].ToString();
            //			}
            //			else
            //			{
            //				// Get DataProfileClass From Table Name in Query String
            //				strSQL = "Select DataProfileClassId From DataProfileClasses Where DataSource='" + Request.QueryString["FormName"].ToString() + "'";               
            //				SqlCommand cmd1 = new SqlCommand(strSQL,new SqlConnection(ConfigurationSettings.AppSettings["eFromsDBConnectionString"]));
            //				cmd1.Connection.Open();
            //				strTableName =cmd1.ExecuteScalar().ToString();
            //				cmd1.Connection.Close();
            //				cmd1.Dispose();
            //			}

            FormHistoryChart_v4 formHistoryChart = new FormHistoryChart_v4();
            formHistoryChart.GenerateChart(dncFormHistoryChart, ConfigurationSettings.AppSettings["eFromsDBName"].ToString(), Request.QueryString["FormName"].ToString(), Request.QueryString["FormCode"].ToString(), Request.QueryString["Story"].ToString(), Request.QueryString["U"].ToString(), Request.QueryString["T"].ToString());

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


        //void Status_Images_Load()
        //{
        //    EFormsDataGrid dg = new EFormsDataGrid();
        //    dg.ServerPath = ConfigurationSettings.AppSettings["ServerPath"];
        //    dg.LoadStatusImage(ref DataGrid1, 8, 9);
        //}

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

        private void Imagebutton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            lbtnGraph_Click(sender, e);
        }

        private void Imagebutton5_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            lbtnGraph_Click(sender, e);
        }

    }
    public class FormHistoryChart_v4
    {
        private string strStory;
        private bool IsNoData;
        public FormHistoryChart_v4()
        {
            //
            // TODO: Add constructor logic here
            //
            strStory = "";
            IsNoData = false;
        }

        public void GenerateChart(dotnetCHARTING.Chart ChartPRF, string DBName, string FormName, string FormCode, string Story, string UserId, string Type)
        {

            // Set the title.
            ChartPRF.Title = " Form History \n";

            // Set the chart Type
            //ChartPRF.Type = ChartType.ComboHorizontal;

            // Change the shading mode
            ChartPRF.ShadingEffectMode = ShadingEffectMode.Three;

            // Set the y axis Scale
            //ChartPRF.ChartArea.YAxis.Scale = Scale.Stacked;

            //Hide the mentor;
            ChartPRF.Mentor = false;

            // Set the x axis label
            ChartPRF.ChartArea.XAxis.Label.Text = "";

            // Set the y axis label
            ChartPRF.ChartArea.YAxis.Label.Text = "";

            ChartPRF.XAxis.StaticColumnWidth = 50;

            // Set the directory where the images will be stored.
            //  ChartPRF.TempDirectory = "/temp";

            ChartPRF.DefaultElement.Hotspot.Attributes.Custom.Add("OnMouseOver", "this.T_WIDTH=60;return escape('%Name %YValue %Name')");


            // This setting will instruct the chart to place the legend into the title and get rid of the box legend.
            ChartPRF.TitleBox.Position = TitleBoxPosition.Full;
            ChartPRF.TitleBox.Background.GlassEffect = true;
            ChartPRF.TitleBox.Background.Bevel = true;
            ChartPRF.DefaultLegendBox.Visible = false;


            // Clear the data.
            ChartPRF.SeriesCollection.Clear();

            ChartPRF.SeriesCollection.Add(getChartData(DBName, FormName, FormCode, UserId, Type));
            Annotation aHistory = new Annotation();
            if (IsNoData == false)
            {
                //Show story link
                Annotation a = new Annotation();
                if (Story == "false" || Story == "")
                {
                    a.ClearColors();
                    a.Label.Text = "Show Detailed History";
                    a.Label.Color = Color.Blue;
                    a.Label.Font = new Font("Arial", 8, FontStyle.Underline);
                    a.URL = "FormHistoryChart.aspx?FormName=" + FormName + "&FormCode=" + FormCode + "&Story=true&U=" + UserId + "&T=" + Type;
                    a.Position = new Point(680, 10);
                    a.DynamicSize = false;
                }
                else
                {
                    a.ClearColors();
                    a.Label.Text = "Hide Detailed History";
                    a.Label.Color = Color.Indigo;
                    a.Label.Font = new Font("Arial", 8, FontStyle.Underline);
                    a.URL = "FormHistoryChart.aspx?FormName=" + FormName + "&FormCode=" + FormCode + "&Story=false&U=" + UserId + "&T=" + Type;
                    a.Position = new Point(680, 10);
                    a.DynamicSize = false;


                    aHistory.Label.Text = strStory;
                    //aHistory.TextAlignmentHorizontal = StringAlignment.Near;
                    //aHistory.TextAlignmentVertical = StringAlignment.Near;
                    aHistory.Label.Color = Color.Navy;
                    aHistory.Label.Font = new Font("Arial", 8, FontStyle.Regular);
                    aHistory.Position = new Point(40, 40);
                    aHistory.Background.GlassEffect = true;
                    aHistory.Background.Bevel = true;
                    aHistory.Background.Mode = BackgroundMode.Gradient;
                    aHistory.DynamicSize = false;
                    ChartPRF.Annotations.Add(aHistory);


                    // ChartPRF.TitleBox.Label.Font.= true;
                }
                ChartPRF.TitleBox.Background.Color = aHistory.Background.Color;
                ChartPRF.TitleBox.Label.Text = " ";
                ChartPRF.TitleBox.Padding = 5;
                ChartPRF.DefaultAxis.NumberPercision = 0;// Series.YAxis.NumberPrecision = 0;
                ChartPRF.Annotations.Add(a);
            }

        }

        SeriesCollection getChartData(string DBName, string FormName, string FormCode, string UserId, string Type)
        {
            string strSQL = "";
            string strTableName = "";
            if (Type == "D")
            {
                // Get Data Profile Class From Query String
                strTableName = FormName;
            }
            else
            {
                // Get DataProfileClass From Table Name in Query String
                strSQL = "Select DataProfileClassId From DataProfileClasses Where DataSource='" + FormName + "'";
                SqlCommand cmd1 = new SqlCommand(strSQL, new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString"]));
                cmd1.Connection.Open();
                strTableName = cmd1.ExecuteScalar().ToString();
                cmd1.Connection.Close();
                cmd1.Dispose();
            }
            SeriesCollection SC = new SeriesCollection();
            Series s = new Series();
            s.Name = "Form History";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Sp_Get_FormHistory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@DatabseNameParam", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@FormNameParam", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@FormCodeParam", SqlDbType.VarChar, 50);
            cmd.Parameters["@DatabseNameParam"].Value = DBName;
            cmd.Parameters["@FormNameParam"].Value = strTableName;
            cmd.Parameters["@FormCodeParam"].Value = FormCode;
            cmd.Connection = new SqlConnection(ConfigurationSettings.AppSettings["SQLConnectionString_Audit"]);
            cmd.Connection.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            strStory = "\n";
            int Counter = 0;
            while (dr.Read())
            {
                Element e = new Element();
                e.Name = dr["ToStateName"].ToString();
                e.Color = Color.Green;//Color.Yellow;
                e.ShowValue = true;
                e.LabelTemplate = "%YValue";
                e.ToolTip = dr["Story"].ToString();
                e.SmartLabel.Alignment = LabelAlignment.OutsideTop;
                e.SmartLabel.Font = new Font("Arial Black", 8, FontStyle.Bold);
                e.SmartLabel.Color = Color.Black;
                e.YValue = Convert.ToDouble(dr["DaysTaken"]);
                s.Elements.Add(e);

                strStory += "   " + ((int)++Counter).ToString() + ") " + dr["Story"].ToString() + "\n";
            }
            if (Counter == 0)
                IsNoData = true;
            else
                IsNoData = false;
            dr.Close();
            cmd.Connection.Close();
            SC.Add(s);
            return SC;
        }



    }
}