using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace WebProject.MasterPages
{
    public partial class eForms : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrScrpt.Mode = LiteralMode.PassThrough;
            
            var script = $@"
window.Environment='{ConfigurationManager.AppSettings["Environment"]}';
window.StartupWidgetId='{ConfigurationManager.AppSettings["StartupWidgetId"]}';
";
            ltrScrpt.Text = $@"<script type='text/javascript'>
{script}
</script>";
        }
    }
}