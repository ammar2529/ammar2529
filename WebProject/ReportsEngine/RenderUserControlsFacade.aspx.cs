using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Xml;


namespace WebProject.ReportsEngine
{
    public partial class RenderUserControlsFacade : System.Web.UI.Page
    {
        [WebMethod]
        public string HellowWorld(string code)
        {
            return "Hello How are you";
        }
        [WebMethod]
        public static string[] GetASPGridHTML(string ReportId, string WidgetId, int PageIndex, string SortBy, string Parameters)
        {
            try
            {
                //System.Threading.Thread.Sleep(50000);
                //PageIndex = 1;
                return new string[] { WidgetId, RenderUserControl(PortalConfiguration.WidgetsPath + "ASPGridWidget.ascx", ReportId, WidgetId, PageIndex, SortBy, Parameters) };
            }
            catch (Exception e)
            {
                return new string[] { WidgetId, e.Message + "\t\n" + e.StackTrace };
            }
        }
        public static string RenderUserControl(string path, params object[] Parameters)
        {
            Page pageHolder = new Page();

            System.Web.UI.Control UserControl = LoadControl(path, pageHolder, Parameters);
            UserControl.ID = Parameters[0] + "_" + Parameters[1];

            HtmlForm HTMLForm = new HtmlForm();
            HtmlGenericControl div = new HtmlGenericControl("DynamicUserControl");
            div.Controls.Add(UserControl);
            HTMLForm.Controls.Add(div);
            pageHolder.Controls.Add(HTMLForm);
            pageHolder.DesignerInitialize();
            using (System.IO.StringWriter output = new System.IO.StringWriter())
            {
                HttpContext.Current.Server.Execute(pageHolder, output, false);
                int UserControlStartIndex, UserControlEndIndex;
                string UCRenderedHtml = output.ToString();
                UserControlStartIndex = UCRenderedHtml.IndexOf("<DynamicUserControl>") + "<DynamicUserControl>".Length;
                UserControlEndIndex = UCRenderedHtml.IndexOf("</DynamicUserControl>") - "</DynamicUserControl>".Length + 1;

                //System.Xml.XmlDocument xDoc = new System.Xml.XmlDocument();
                //xDoc.LoadXml(output.ToString());
                return UCRenderedHtml.Substring(UserControlStartIndex, UserControlEndIndex - UserControlStartIndex);


                //XmlParserContext xhtmlContext = CreateXhtmlContext();
                //XmlValidatingReader rdr = new XmlValidatingReader(output.ToString(), XmlNodeType.Document, xhtmlContext);
                //rdr.ValidationType = ValidationType.None;
                //rdr.XmlResolver = RenderUserControlsFacade.CreateXhtmlResolver();
                //// Now use the handy XmlDocument to get the content:
                //XmlDocument doc = new XmlDocument();
                //doc.Load(rdr);



            }
        }
        private static UserControl LoadControl(string UserControlPath, Page _Page, object[] constructorParameters)
        {
            List<Type> constParamTypes = new List<Type>();
            foreach (object constParam in constructorParameters)
            {
                constParamTypes.Add(constParam.GetType());
            }

            UserControl ctl = _Page.LoadControl(UserControlPath) as UserControl;

            // Find the relevant constructor
            ConstructorInfo constructor = ctl.GetType().BaseType.GetConstructor(constParamTypes.ToArray());

            //And then call the relevant constructor
            if (constructor == null)
            {
                throw new MemberAccessException("The requested constructor was not found on : " + ctl.GetType().BaseType.ToString());
            }
            else
            {
                constructor.Invoke(ctl, constructorParameters);
            }

            // Finally return the fully initialized UC
            return ctl;
        }


        //private static XmlParserContext CreateXhtmlContext()
        //{
        //    XmlNameTable nt = new NameTable();
        //    XmlNamespaceManager nsmgr = new XmlNamespaceManager(nt);
        //    XmlParserContext context = new XmlParserContext(null, nsmgr, null, XmlSpace.None);
        //    context.DocTypeName = "html";
        //    context.PublicId = "-//W3C//DTD XHTML 1.0 Strict//EN";
        //    context.SystemId = "xhtml1-strict.dtd";
        //    return context;
        //}
        //private static XmlResolver CreateXhtmlResolver()
        //{
        //    KnownResourceXmlResolver resolver = new KnownResourceXmlResolver();
        //    resolver.AddResource(new Uri("urn:" + "-//W3C//DTD XHTML 1.0 Strict//EN"), typeof(Program), XhtmlStrict);
        //    resolver.AddResource(new Uri("urn:" + XhtmlStrict), typeof(Program), XhtmlStrict);
        //    resolver.AddResource(new Uri("urn:" + XhtmlLat1), typeof(Program), XhtmlLat1);
        //    resolver.AddResource(new Uri("urn:" + XhtmlSpecial), typeof(Program), XhtmlSpecial);
        //    resolver.AddResource(new Uri("urn:" + XhtmlSymbol), typeof(Program), XhtmlSymbol);
        //    return resolver;
        //}

    }
}