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
    public partial class UploadFile : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.RequestType == "POST")
            {
                Response.Clear();
                Response.ContentType = "application/json";
                Response.Write(UploadFiles());
                Response.End();
            }
        }

        public static string UploadFiles()
        {
            string firstError = "";
            string uploadPath = "~/Uploads/";
            try
            {

                var httpRequest = HttpContext.Current.Request;
                var files = httpRequest.Files;
                var savePath = HttpContext.Current.Server.MapPath(uploadPath);

                if (files.Count > 0)
                {

                    string FileGuid = httpRequest.Form["FileGuid"];
                    string newFileName = "";

                    for (int i = 0; i < files.Count; i++)
                    {
                        var postedFile = files[i];
                        string OriginalFileName = Path.GetFileName(postedFile.FileName);
                        var FURecId = SaveFileToDb(postedFile.FileName);
                        var arrFURecId = FURecId.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);
                        // Combine the prefixes and the original file name
                        if (arrFURecId.Length > 1)
                        {
                            newFileName = $"{arrFURecId[0]}_{FileGuid}_{OriginalFileName}";

                            var filePath = Path.Combine(savePath, newFileName);
                            postedFile.SaveAs(filePath);
                        }
                    }




                }
            }
            catch (Exception e)
            {
                firstError = e.Message;
            }
            try
            {
                return GetUploadedFileList();
            }
            catch (Exception ex)
            {
                return $@"{{""status"":""Error"",""response"":{{message:""{firstError} - {ex.Message}""}}}}";
            }
        }
        private static string SaveFileToDb(string fileName)
        {
            var PD = GetParamsFromPost();
            PD.Add("FileName", new QueryParameter(fileName));
            PD.Add("DBAction", new QueryParameter("AddUploadedFile")); // Add DBAction parameter
            return "'" + DBHelper.InvokeSP("FX_UPD_FileUpload_SP", PD).ToString() + "'";

            // DBHelper.GetDataTableProc("SPName", PD);
        }



        static ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> GetParamsFromPost()
        {
            var request = HttpContext.Current.Request;
            var PD =
                new ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>("UploadFile2", "");
            foreach (var prm in request.Form.AllKeys)
            {
                PD.Add(prm, new QueryParameter(request.Form[prm]));

            }

            return PD;
        }

        static string GetUploadedFileList()
        {
            var PD = GetParamsFromPost();
            //
            PD.Add("DBAction", new QueryParameter("GetUploadedFiles")); // Add DBAction parameter
            DataSet ds = DBHelper.GetDataTableProc("FX_UPD_FileUpload_SP", PD);



            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // var rows = JsonConvert.SerializeObject(ds.Tables[0], new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());
                var obj = new
                {
                    status = "OK",
                    response = new { rows = ds.Tables[0], count = ds.Tables[0].Rows.Count }
                };


                return JsonConvert.SerializeObject(obj, new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());

                //$@"{{status:""OK"",response:{{Rows:{rows},Count:{ds.Tables[0].Rows.Count}}}}}";
            }
            //var a=@"""Ammar""";
            return @"{status:""No Files Found"",response:""""}";

        }
    }
}