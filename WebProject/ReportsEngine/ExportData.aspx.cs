using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;

//using PWC.PresentationServices.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Xml;
using ExpertPdf.HtmlToPdf;
using HtmlAgilityPack;

namespace WebProject.ReportsEngine
{
    public partial class ExportData : System.Web.UI.Page
    {
        string GraphID = "";
        string GridID = "";
        string SearchPanelID = "";
        SearchPanel SPanel = null;
        GridHolder GRDHolder = null;
        ReportHolder RPTHolder = null;
        string Filename;

        void Page_PreInit(object sender, EventArgs e)
        {
            ReportsSecurity.IsUserAuthenticated(this, ResolveUrl("~/NoAccess.htm"));

            if (Request.QueryString["NextReportID"] != null)
            {
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
                GridID = RPTHolder.GridID;
                SearchPanelID = RPTHolder.SearchPanelID;
            }
            if (SearchPanelID != null)
            {
                SearchPanelID = SearchPanelID.Trim();
                if (SearchPanelID != "")
                {
                    SPanel = new SearchPanel(SearchPanelID, this);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            //   Page.LoadComplete += new EventHandler(Page_LoadComplete);
            if (GridID != null)
            {
                GridID = GridID.Trim();
                if (GridID.ToString() != "")
                {
                    GRDHolder = new GridHolder(GridID.ToString(), PanelDGVMain, gvMain, true);
                }
            }
            if (SPanel != null && GRDHolder != null)
            {
                try
                {
                    GRDHolder.QueryData(SPanel);
                    UpdGrid.Update();
                }
                catch (Exception ex)
                {
                }
            }
            else if (GRDHolder == null)
            {
                StoredProcInvoker Spi;
                Hashtable SearchpanelHash = new Hashtable();
                SearchpanelHash = (Hashtable)Session["SearchPanelvalues"];
                string strArray = Session["GridPagination"].ToString();
                string[] _strArg = strArray.Split(',');
                RPTHolder = new ReportHolder(_strArg[3]);
                GridID = RPTHolder.GridID.Trim();
                SearchPanelID = RPTHolder.SearchPanelID;
                if (GridID != null)
                {
                    if (GridID.ToString() != "")
                    {
                        GRDHolder = new GridHolder(GridID.ToString(), PanelDGVMain, gvMain);
                    }
                }
                string strConnectionstring = GRDHolder.DataConnectionString;
                if (strConnectionstring != null)
                {
                    Spi = new StoredProcInvoker(_strArg[2], _strArg, strConnectionstring, SearchpanelHash);
                }
                else
                {
                    Spi = new StoredProcInvoker(_strArg[2], _strArg, string.Empty, SearchpanelHash);
                }
                gvMain.DataSource = Spi.ResultTable;
                gvMain.DataBind();
                // UpdGrid.Update();
            }
        }
        protected void Page_Render(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "pdf")
            {
                // exportToPDF();
                ConvertHTMLStringToPDF(ControlToHTML(GRDHolder.GridViewControl));
            }
            else
            {
                ExportGridView();
            }
            GC.Collect();
        }
            protected void Page_LoadComplete(object sender, EventArgs e)
        {

           
        }
        private void ExportGridView()
        {
            //ERROR: Control 'gvPaymentDeptBased' of type 'GridView' must be placed inside a form tag with runat=server
            //MUST on HTML page: EnableEventValidation = "false"
            string attachment;
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] != "")
            {
                attachment = string.Format("attachment; filename={0}.xls", Request.QueryString["NextReportID"]);
            }
            else
            {
                Filename = "DataExport";
                attachment = string.Format("attachment; filename={0}.xls", Filename);
            }
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            //gvExport is copy of gvPaymentDeptBased hidden inside PanelGridExport
            GRDHolder.GridViewControl.RenderControl(htw);
            Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
            Response.Write(sw.ToString());
            Response.End();

        }
        string ControlToHTML(Control control)
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            //gvExport is copy of gvPaymentDeptBased hidden inside PanelGridExport
            // GRDHolder.GridViewControl.RenderControl(htw);
            control.RenderControl(htw);
            string htmlString = sw.ToString();


            HtmlDocument htmlDoc = new HtmlDocument();
            htmlDoc.LoadHtml(htmlString);
            HtmlNode Root = htmlDoc.DocumentNode.SelectSingleNode("//table");
            string[] Totals = Root.GetAttributeValue("sumcols", "").Split(new string[] { "||" }, StringSplitOptions.None);

            if (Totals.Length > 1)
            {
                HtmlNode HeadRow = htmlDoc.DocumentNode.SelectSingleNode("(//table/tr)[1]");
                //HtmlNode bodyNode = htmlDoc.DocumentNode.SelectSingleNode("(//table/tr)[last()]");
                HtmlNode SumRow = htmlDoc.DocumentNode.SelectSingleNode("(//table/tr)[last()]").Clone();


                //HtmlNodeCollection cols = SumRow.SelectNodes("td");
                int i = 0;
                foreach (HtmlNode col in SumRow.SelectNodes("td"))
                {
                    if (i == 0)
                        col.InnerHtml = "Total";
                    else
                    {
                        string ColumnId = HeadRow.SelectSingleNode("(th)[" + (i + 1) + "]").GetAttributeValue("columnid", "");

                        col.InnerHtml = ColTotal(Totals, ColumnId);
                    }

                    col.SetAttributeValue("style", col.GetAttributeValue("style", "") + " 'font-weight': 'bold', 'background-color': '#D2CEC6', 'color': '#0000ff', 'border': '1px dotted black', 'border-top': '1px solid black', 'border-bottom': '1px solid black'");
                    i++;
                }
                htmlDoc.DocumentNode.SelectSingleNode("//table").InsertAfter(SumRow, htmlDoc.DocumentNode.SelectSingleNode("(//table/tr)[last()]"));
                sw = new StringWriter();
                htmlDoc.Save(sw);
                return sw.ToString();
            }
            return htmlString;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void exportToPDF()
        {
            Rectangle Custompagesize;
            Response.ContentType = "application/pdf";
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] != "")
            {
                Filename = Request.QueryString["NextReportID"].ToString();
            }
            else
            {
                Filename = "DataExport";
            }
            Response.AddHeader("content-disposition", "attachment;filename=" + Filename + ".pdf");
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GRDHolder.GridViewControl.RenderControl(hw);
            if (GRDHolder.GridViewControl.Columns.Count < 5)
            {
                Custompagesize = PageSize.A3;
            }
            else
            {
                Custompagesize = PageSize.ARCH_E;
            }
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(Custompagesize, 0f, 0f, 0f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
        }
        private void ConvertHTMLStringToPDF(string htmlString)
        {
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] != "")
            {
                //  attachment = string.Format("attachment; filename={0}.xls", Request.QueryString["NextReportID"]);
                Filename = Request.QueryString["NextReportID"];
            }
            else
            {
                Filename = "DataExport";
                // attachment = string.Format("attachment; filename={0}.xls", Filename);
            }
            // PDFSize=A4&SinglePagePDF=true
            bool PDFSize = Request.QueryString["PDFSize"] == "A4";
            bool SinglePagePDF = Convert.ToBoolean(Request.QueryString["SinglePagePDF"]);
            //  string htmlString = textBoxHTMLCode.Text;
            string baseURL = "";//textBoxBaseURL.Text.Trim();
            bool selectablePDF = true;//radioConvertToSelectablePDF.Checked;

            // Create the PDF converter. Optionally you can specify the virtual browser 
            // width as parameter. 1024 pixels is default, 0 means autodetect
            PdfConverter pdfConverter = new PdfConverter();
            // set the license key
            //pdfConverter.LicenseKey = "put your license key here";
            // set the converter options
            if (PDFSize)
            {
                pdfConverter.PdfDocumentOptions.PdfPageSize = PdfPageSize.A4;///.PdfDocumentOptions.PdfPageSize=PdfPageSize.Custom

            }
            else
            {
                pdfConverter.PdfDocumentOptions.PdfPageSize = PdfPageSize.Custom;
                pdfConverter.PageWidth = 0;
                pdfConverter.PdfDocumentOptions.AutoSizePdfPage = true;
                pdfConverter.PdfDocumentOptions.FitWidth = false;// cbFitWidth.Checked;

            }
            pdfConverter.PdfDocumentOptions.SinglePage = SinglePagePDF;
            pdfConverter.PdfDocumentOptions.PdfCompressionLevel = PdfCompressionLevel.Normal;
            pdfConverter.PdfDocumentOptions.PdfPageOrientation = PDFPageOrientation.Portrait;

            // set if header and footer are shown in the PDF - optional - default is false 
            // pdfConverter.PdfDocumentOptions.ShowHeader = true;// cbAddHeader.Checked;
            // pdfConverter.PdfDocumentOptions.ShowFooter = true; //cbAddFooter.Checked;
            // set to generate a pdf with selectable text or a pdf with embedded image - optional - default is true
            pdfConverter.PdfDocumentOptions.GenerateSelectablePdf = true;// radioConvertToSelectablePDF.Checked;
                                                                         // set if the HTML content is resized if necessary to fit the PDF page width - optional - default is true
                                                                         // 
                                                                         // set the embedded fonts option - optional - default is false

            // pdfConverter.PdfDocumentOptions.EmbedFonts = cbEmbedFonts.Checked;

            // set the live HTTP links option - optional - default is true

            //pdfConverter.PdfDocumentOptions.LiveUrlsEnabled = cbLiveLinks.Checked;

            //if (radioConvertToSelectablePDF.Checked)
            //{
            //    // set if the JavaScript is enabled during conversion to a PDF with selectable text 
            //    // - optional - default is false
            //    pdfConverter.ScriptsEnabled = cbClientScripts.Checked;
            //    // set if the ActiveX controls (like Flash player) are enabled during conversion 
            //    // to a PDF with selectable text - optional - default is false
            //    pdfConverter.ActiveXEnabled = cbActiveXEnabled.Checked;
            //}
            //else
            //{
            //    // set if the JavaScript is enabled during conversion to a PDF with embedded image 
            //    // - optional - default is true
            //    pdfConverter.ScriptsEnabledInImage = cbClientScripts.Checked;
            //    // set if the ActiveX controls (like Flash player) are enabled during conversion 
            //    // to a PDF with embedded image - optional - default is true
            //    pdfConverter.ActiveXEnabledInImage = cbActiveXEnabled.Checked;
            //}

            // set if the images in PDF are compressed with JPEG to reduce the PDF document size - optional - default is true
            //  pdfConverter.PdfDocumentOptions.JpegCompressionEnabled = cbJpegCompression.Checked;

            // enable auto-generated bookmarks for a specified list of tags (e.g. H1 and H2)
            //if (cbBookmarks.Checked)
            //{
            pdfConverter.PdfBookmarkOptions.TagNames = new string[] { "H1", "H2" };
            //}

            // set PDF security options - optional
            //pdfConverter.PdfSecurityOptions.CanPrint = true;
            //pdfConverter.PdfSecurityOptions.CanEditContent = true;
            //pdfConverter.PdfSecurityOptions.UserPassword = "";

            //set PDF document description - optional
            //    pdfConverter.PdfDocumentInfo.AuthorName = "ExperPDF HTML to PDF Converter";

            // add HTML header
            //if (cbAddHeader.Checked)
            //    AddHeader(pdfConverter);
            //// add HTML footer
            //if (cbAddFooter.Checked)
            //    AddFooter(pdfConverter);

            // Performs the conversion and get the pdf document bytes that you can further 
            // save to a file or send as a browser response
            //
            // The baseURL parameter helps the converter to get the CSS files and images
            // referenced by a relative URL in the HTML string. This option has efect only if the HTML string
            // contains a valid HEAD tag. The converter will automatically inserts a <BASE HREF="baseURL"> tag. 

            byte[] pdfBytes = null;

            if (baseURL.Length > 0)
                pdfBytes = pdfConverter.GetPdfBytesFromHtmlString(htmlString, baseURL);
            else
                pdfBytes = pdfConverter.GetPdfBytesFromHtmlString(htmlString);

            // send the PDF document as a response to the browser for download
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.Clear();
            response.AddHeader("Content-Type", "binary/octet-stream");
            response.AddHeader("Content-Disposition",
                "attachment; filename=" + Filename + ".pdf; size=" + pdfBytes.Length.ToString());
            response.Flush();
            response.BinaryWrite(pdfBytes);
            response.Flush();
            response.End();
        }
        string ColTotal(string[] SumValues, string ColName)
        {
            string Ret = "&nbsp;";
            try
            {
                for (int i = 0; i < SumValues.Length; i += 2)
                {
                    if (SumValues[i] == ColName)
                    {
                        Ret = SumValues[i + 1];
                        break;
                    }
                }
            }
            catch (Exception ex)
            { }
            return Ret;
        }


        //string SetTagAttr(string Html, string Tag, string value, int Index)
        //{
        //    int idx = Index;
        //    List<int> al = new List<int >();
        //    int st=0,i=0;
        //    string Res;
        //    while (true)
        //    {

        //        st = Html.IndexOf("<"+Tag, st);
        //        if (st < 0) break;
        //        st += Tag.Length + 1;
        //        al.Add(st);
        //        i++;
        //    }
        //    if (idx > -1) Res = Html.Insert(al[idx]," "+ value + " ");
        //    else
        //    {
        //        Res = Html;
        //        for (i = 0; i < al.Count; i++)
        //        {
        //            Res = Res.Insert(al[idx], " " + value + " ");
        //        }
        //    }
        //    return Res;
        //}
        //public string RemoveTables(string Html)
        //{
        //    string Res = Html;
        //    int st=0,end;
        //    while(Res.IndexOf("<table") >-1)
        //    {
        //        st=Res.IndexOf("<table",st);
        //        end = Res.IndexOf("</table>", st)+8;
        //        Res = Res.Replace(Res.Substring(st, end - st), "");
        //    }
        //    return Res;
        //}
        //public string GetFirstRow(HtmlAgilityPack.HtmlDocument  htmlDoc) {
        //    //return GetFirstRow(Html, 0);
        //    return "";

        //}
        //public string GetFirstRow(string Html,int Pos)
        //{
        //    int ClosingIndex =Html.IndexOf("</tr>",Pos,StringComparison.CurrentCultureIgnoreCase)+5,         StartingIndex = Html.IndexOf("<tr",Pos,StringComparison.CurrentCultureIgnoreCase),st,end;
        //    string Res = Html.Substring(StartingIndex, ClosingIndex - StartingIndex);
        //    end =st = StartingIndex;
        //    while (Occurs(Res,"<tr") != Occurs(Res,"</tr>"))
        //    {
        //        end = Html.IndexOf("</tr>", end)+5;
        //        Res = Html.Substring(StartingIndex, end - StartingIndex);
        //    }
        //    if (ClosingIndex > end) end = ClosingIndex;
        //    if (Res.IndexOf("<td") < 0)
        //        return GetFirstRow(Html, end);
        //    else return Res;
        //}
        //public  int Occurs(string text, string pattern)
        //{
        //    // Loop through all instances of the string 'text'.
        //    int count = 0;
        //    int i = 0;
        //    while ((i = text.IndexOf(pattern, i)) != -1)
        //    {
        //        i += pattern.Length;
        //        count++;
        //    }
        //    return count;
        //}

    }
}
