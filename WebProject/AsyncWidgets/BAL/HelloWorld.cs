using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Reflection;
using System.Web.Security;
using System.Xml;

using System.IO;

using Newtonsoft.Json;
using WebProject.AsyncWidgets.Utility;
using WebProject.AsyncWidgets.DAL;

namespace WebProject.AsyncWidgets.BAL
{
    public class HelloWorld: ActionExecuter
    {
        public string SayHello(string ServiceInfo)
        {
            ServiceInfo = ServiceInfo.Replace("&nbsp;", "");
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();

            return $@"{{ StudentRec:{JsonConvert.SerializeObject(new Student())} }}";
        }
        class Student {
          public  string Name="Ammar";
          public  string RollNo="9090";
        }
    }
}