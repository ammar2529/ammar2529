using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProject.AsyncWidgets.DAL;

namespace WebProject
{
    public partial class TestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
  
        }

        [System.Web.Services.WebMethod]
        public static string UploadFile()
        {
          return SaveToDb();
        }

        private static string SaveToDb()
        {
            var PD = GetParamsFromPost();
            //   PD.Add("Command", new QueryParameter("test"));
           // PD.Add("param1", new QueryParameter("value1"));

            return "'" + DBHelper.InvokeSP("SaveUploadedFile_SP", PD).ToString() + "'";
        }

       static ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>  GetParamsFromPost()
        {
            var request = HttpContext.Current.Request;
            var PD =
                new ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>("test", "");
            //NameValueCollection form = request.Form;
            foreach (var prm in request.Form.AllKeys)
            {
                PD.Add(prm, new QueryParameter(request.Form[prm]));
            }
            return PD;
        }
    }
}