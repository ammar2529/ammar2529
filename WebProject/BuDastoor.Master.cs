using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    public partial class BuDastoor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrScrpt.Mode = LiteralMode.PassThrough;
            var json = Session["MenuData"] != null ? JsonConvert.SerializeObject(Session["MenuData"]) : "{}";
            var script = $@"
window.Environment = {{
    env: '{ConfigurationManager.AppSettings["Environment"]}',
    startupWidgetId: '{ConfigurationManager.AppSettings["StartupWidgetId"]}'
}};
window.MenuData = {json};
";
            ltrScrpt.Text = $@"<script type='text/javascript'>
{script}
</script>";
        }

    }
}