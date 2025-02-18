using Azure.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Caching;

namespace WebProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["SittingId"] == null) // create new session as no session exists
            {
                var sittingId = Guid.NewGuid().ToString().Replace("-","") ;
                var Sitting= new Dictionary<string, object>
                {
                
                    
                    { "SittingDate", DateTime.Now }
                };  
               
                NewStaticCache.AddToCache(sittingId, Sitting);
                Response.Redirect("WebForm2.aspx?SittingId=" + sittingId);
            }

           var sessionid= Request.QueryString["SittingId"];

            var sitting= (Dictionary<string, object>)NewStaticCache.GetFromCache(sessionid);
             sitting["userid"] = "amirza";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}