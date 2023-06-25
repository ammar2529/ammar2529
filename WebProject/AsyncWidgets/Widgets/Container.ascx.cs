using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class Container : System.Web.UI.UserControl
    {
        string _conf = "{{WidgetId:'{0}',WidgetType:'Container',AutoInit:false,Caption:'{1}'}}";
        WebResponse _WebResponse;
        ContainerState _WidgetState;
        string _Action;

        string _EmptyHeight;
        [Browsable(true), DefaultValue("200px"), Category("Appearence")]
        public string EmptyHeight { get { return _EmptyHeight; } set { _EmptyHeight = value; } }

        string _Caption;
        [Browsable(true), Category("Appearence")]
        public string Caption { get { return _Caption == "" ? this.ID : _Caption; } set { _Caption = value; } }

        bool _Hidden;
        [Browsable(true), Category("Appearence")]
        public bool Hidden
        {
            get { return _Hidden; }
            set
            {
                _Hidden = value;
            }
        }
        private ITemplate _Childern;
        [TemplateContainer(typeof(ChildernContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate Childern
        {
            get
            {
                return _Childern;
            }
            set
            {
                _Childern = value;
            }
        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            WPNL.Controls.Clear();

            if (_Childern == null)
            {
                //  ContainerHolder.Controls.Add(new LiteralControl("No template defined"));
                return;

            }
            ChildernContainer container = new ChildernContainer();
            _Childern.InstantiateIn(container);
            WPNL.Controls.Add(container);
        }
        public Container()
        {
            //  System.Web.UI.Design.WebControls
        }
        public Container(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<ContainerState>(WidgetState);
            _Action = Action;

            _WebResponse.UpdateHtml = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //  WPNL.ClientID = this.ID;

            if (_Action != null) //if async call
            {
                //  System.Threading.Thread.Sleep(2000);
                //   System.Threading.Thread.Sleep(3000);

                //WPNL.Visible = false;
                //AsyncPNL.Visible = true;
                InvokeAction();
            }
            else // if first call(non-async)
            {
                WPNL.Attributes.Add("conf", string.Format(_conf, ID, _Caption));
                WPNL.Attributes.Add("EmptyHeight", EmptyHeight);
                if (_Hidden)
                    WPNL.Style.Add("display", "none");

                // WPNL.Attributes.Add("prejs", "[{path:'/Scripts/',	files:['jquery.ui.core.js','jquery.ui.widget.js','jquery.ui.datepicker.js','jquery.alphanumeric.js']}]");

                // WPNL.Attributes.Add("postjs", "[{path:'/Scripts/',	files:['home.js']}]");
                // WPNL.Attributes.Add("style", WidgetStyle);
                //if (_EmptyHeight != "") WPNL.Attributes.Add("EmptyHeight", _EmptyHeight);
                WPNL.Visible = true;

            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //  WPNL.Attributes.Remove("id");
        }
        public override void RenderControl(HtmlTextWriter writer)
        {
            StringWriter sw = new StringWriter(new System.Text.StringBuilder(),
              System.Globalization.CultureInfo.InvariantCulture);
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            base.RenderControl(htw);
            string chtml = RemoveIdTag(sw, "id");
            sw.Close();
            writer.Write(chtml);
        }
        private string RemoveIdTag(StringWriter sw, string Attribute)
        {
            return Regex.Replace(sw.ToString(), @"\b" + Attribute + @"[\s]*=[\s]*([""'])?[^\1]*?\1", "", RegexOptions.IgnoreCase);
            //return sw.ToString();
        }
        public object InvokeAction()
        {
            // System.Threading.Thread.Sleep(5000);
            Type type = this.GetType();
            // ((string)type.GetMethod(Action).Invoke(this, null)); //new object[] { ServiceInfo }));
            MethodInfo Action = type.GetMethod(_Action);
            if (Action != null)
                return Action.Invoke(this, null); //new object[] { ServiceInfo }));
            else
                return null;

        }
        public object InvokeAction(string ActionToExecute)
        {
            Type type = this.GetType();
            // ((string)type.GetMethod(Action).Invoke(this, null)); //new object[] { ServiceInfo }));
            MethodInfo Action = type.GetMethod(ActionToExecute);
            if (Action != null)
                return Action.Invoke(this, null); //new object[] { ServiceInfo }));
            else
                return null;
            // System.Threading.Thread.Sleep(2000);
        }
     }


    public class ChildernContainer : Control, INamingContainer
    {
        public ChildernContainer() { }
    }
    public class ContainerState : WidgetState
    {

    }
}