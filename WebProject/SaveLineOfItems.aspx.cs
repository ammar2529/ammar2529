using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProject.AsyncWidgets.DAL;

namespace WebProject
{
    public partial class SaveLineOfItems : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.RequestType == "POST")
            {
                Response.Clear();
                Response.ContentType = "application/json";
                var resp = SaveLineOfItem();
                Response.Write(resp);

                Response.End();
            }
        }

        public static string SaveLineOfItem()
        {
            string firstError = "";

            try
            {

                var httpRequest = HttpContext.Current.Request;
                

              

                  string ItemId = httpRequest.Form["ItemId"];
                 string InvoiceRecId = httpRequest.Form["InvoiceRecId"];
                string SparePartQuantity = httpRequest.Form["SparePartQTY"];
                string SparePartName = httpRequest.Form["SparePartName"];
                string SparePartUnitPrice = httpRequest.Form["SparePartUnitPrice"];
                string TotalPrice = httpRequest.Form["TotalPrice"];



           

            var FURecId = SaveItemToDb(ItemId, InvoiceRecId, SparePartQuantity, SparePartName, SparePartUnitPrice, TotalPrice);







        }
            catch (Exception e)
            {
                firstError = e.Message;
            }
            try
            {
                return GetUploadedItemList();
}
            catch (Exception ex)

            {
    
    return $@"{{""Status"":""Error"",""Response"":{{message:""{firstError} - {ex.Message}""}}}}";
}

        }

        private static string SaveItemToDb(String ItemId, string InvoiceRecId, string SparePartQuantity, string SparePartName, string SparePartUnitPrice,string TotalPrice)
        {
            var PD = GetParamsFromPost();
        //    PD.Add("ItemId", new QueryParameter(ItemId));
        //    PD.Add("InvoiceRecId", new QueryParameter(InvoiceRecId)); // Add DBAction parameter
        //    PD.Add("SparePartQuantity", new QueryParameter(SparePartQuantity));
        //    PD.Add("SparePartName", new QueryParameter(SparePartName));
        //    PD.Add("SparePartQTY", new QueryParameter(SparePartQuantity));
        //    PD.Add("SparePartUnitPrice", new QueryParameter(SparePartUnitPrice));
        //    PD.Add("TotalPrice", new QueryParameter(TotalPrice));




        //    PD.Add("DBAction", new QueryParameter("AddUploadedItem"));
            return DBHelper.InvokeSP("UPD_SparePartInventoryInvoiceDetails_SP", PD).ToString();

            // DBHelper.GetDataTableProc("SPName", PD);
        }



        static ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> GetParamsFromPost()
        {
            var request = HttpContext.Current.Request;
            var PD =
                new ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>("SaveLineOfItems", "");
            foreach (var prm in request.Form.AllKeys)
            {
                PD.Add(prm, new QueryParameter(request.Form[prm]));

            }

            return PD;
        }

        static string GetUploadedItemList()
        {
            var PD = GetParamsFromPost();
            //
            PD.Add("DBAction", new QueryParameter("GetUploadedItems")); // Add DBAction parameter
            DataSet ds = DBHelper.GetDataTableProc("UPD_SparePartInventoryInvoiceDetails_SP", PD);



            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // var rows = JsonConvert.SerializeObject(ds.Tables[0], new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());
                var obj = new
                {
                    status = "OK",
                    Response = new { Rows = ds.Tables[0], Count = ds.Tables[0].Rows.Count }
                };


                return JsonConvert.SerializeObject(obj, new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());

                //$@"{{status:""OK"",response:{{Rows:{rows},Count:{ds.Tables[0].Rows.Count}}}}}";
            }
            //var a=@"""Ammar""";
            return @"{status:""No Item Found"",response:""""}";

        }
    }
}