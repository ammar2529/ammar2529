using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.ComponentModel;
using System.IO;
namespace WebProject.AsyncWidgets.UI.Widgets
{
    public class ScriptContainer : WebControl, INamingContainer
    {
        string Template;
        public ScriptContainer()
        {
            this.PreRender += new EventHandler(TagContainer_PreRender);
        }

        protected void TagContainer_PreRender(object sender, EventArgs e)
        {
            this.Style.Add("display", "none");
            this.Attributes.Add("template", this.Template);
            this.Attributes.Add("wid", this.Parent.Parent.ID);

        }
        public ScriptContainer(string tag) :
            base(tag)
        {
            this.PreRender += new EventHandler(TagContainer_PreRender);
            this.Template = "script";
        }
        public ScriptContainer(string tag,string Template) :
            base(tag)
        {
            this.PreRender += new EventHandler(TagContainer_PreRender);
            this.Template = Template;
        }

        public override void RenderControl(HtmlTextWriter writer)
        {
            StringWriter sw = new StringWriter(new System.Text.StringBuilder(),
              System.Globalization.CultureInfo.InvariantCulture);
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            base.RenderControl(htw);
            string html = sw.ToString();
            if (html.IndexOf("<script>") > -1)
            {
                html = html.Remove(html.IndexOf("<script>"), 8).Remove(html.LastIndexOf("</script>") - 8, 9);
            }
            writer.Write(html);
        }
    }

    public class TemplateContainer : WebControl, INamingContainer
    {
        public TemplateContainer() { }
        public TemplateContainer(string tag) : base(tag) { }
    }
    public class ScriptBlock : Control
    {

        public ScriptBlock()
        {
           string assemblyName = System.Reflection.Assembly.GetExecutingAssembly().FullName;
        }
        public  void pubfun(){
        
        }
    }
}