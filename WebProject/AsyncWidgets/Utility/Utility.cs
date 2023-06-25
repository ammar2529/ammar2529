using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Web;
namespace WebProject.AsyncWidgets.Utility
{
  public  class UtilityFunctions
    {

        public static string BreakCamelCase(string CamelString)
        {
            string output = string.Empty;
            bool SpaceAdded = true;

            for (int i = 0; i < CamelString.Length; i++)
            {
                if (CamelString.Substring(i, 1) ==
                    CamelString.Substring(i, 1).ToLower()) //if Small Letter
                {
                    output += CamelString.Substring(i, 1);
                    SpaceAdded = false; //set with last char space flag to false
                }
                else //if 
                {
                    //current get the next char if exists
                    string NextChar = i != (CamelString.Length - 1) ? CamelString.Substring(i + 1, 1) : "";
                    // not first char, next char not empty, next char in small cap, we need to add space be current char 
                    if (i != 0 && NextChar != "" && NextChar == NextChar.ToLower()) SpaceAdded = false;
                    if (!SpaceAdded) //if Sapce add falg(for last char) is false then add space
                    {
                        output += " ";
                        output += CamelString.Substring(i, 1);
                        SpaceAdded = true;
                        //SpaceAdded =  NextChar ==NextChar.ToLower()  ? false:true;
                    }
                    else
                        output += CamelString.Substring(i, 1);
                }
            }

            return output;
        }
        public static string FixupUrl(string Url)
        {

            if (Url.StartsWith("~"))

                return (HttpContext.Current.Request.ApplicationPath +
                        Url.Substring(1)).Replace("//", "/");

            return Url;

        }
    }

}

