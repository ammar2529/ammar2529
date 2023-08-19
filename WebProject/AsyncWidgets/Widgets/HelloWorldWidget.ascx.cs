using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class HelloWorldWidget : System.Web.UI.UserControl
    {
        
        [Browsable(true), Category("General"), DefaultValue("No-Name")]
        public string YourName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var ltr = new Literal();
            ltr.ID = "testprop";
            ltr.Text = $@"<script>
                        Widgets.push({{id:'{ID}',WidgetType:'HelloWorldWidget',YouName:'{YourName}' }});
                    </script>";
            //ltr.Visible = true;
            ltr.Mode = LiteralMode.PassThrough;
            ContainerHolder.Controls.Add(ltr);
        }
    }
}