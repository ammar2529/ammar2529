using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Reflection;
using System.Data.SqlClient;
namespace WebProject.ReportsEngine
{

    /// <summary>
    /// Purpose:    This class loads properties of objects from database.
    /// Author:     Muhammed Qasim
    /// Date:       21-05-2008
    /// 
    /// </summary>
    public class PropertyMapper
    {
        private Hashtable objHT = new Hashtable();

        /// <summary>
        /// Holds the SQL Query to get the properties for the object.
        /// </summary>
        private string _SQLObjectProperties = @"
SELECT     RPTChartEngineChartProperty.PropertyName, RPTChartEngineChartProperty.ChartId, RPTChartEngineChartProperty.PropertyValue, 
                      RPTChartEngineChartProperty.PropertyGroupId, CounterTable.NoOfProperties
FROM         RPTChartEngineChartProperty INNER JOIN
                          (SELECT     COUNT(*) AS NoOfProperties, PropertyGroupId
                            FROM          RPTChartEngineChartProperty
                            WHERE      ChartId = '{0}'
                            GROUP BY PropertyGroupId) CounterTable ON CounterTable.PropertyGroupId = RPTChartEngineChartProperty.PropertyGroupId
WHERE     (RPTChartEngineChartProperty.ChartId = '{0}')
ORDER BY RPTChartEngineChartProperty.PropertyGroupId
";

        public void LoadProperties(object ObjectToLoad, string ObjectID)
        {
            _SQLObjectProperties = string.Format(_SQLObjectProperties, ObjectID);
            DataTable dtProperties;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProperties = CUtilityWeb.getDataTable(_SQLObjectProperties, sqlConnection);
            }
            if (dtProperties.Rows.Count < 1) return;
            int iRow = 0;
            int NoOfProperties = 0;
            object CurrentObject = ObjectToLoad;
            string NewProperty, CurProperty = "";


            objHT.Add("root", ObjectToLoad);

            while (iRow < dtProperties.Rows.Count && dtProperties.Rows[iRow]["PropertyGroupId"].ToString().Trim() == "")
            {
                Type t = ObjectToLoad.GetType();
                PropertyInfo pi = t.GetProperty(dtProperties.Rows[iRow]["PropertyName"].ToString().Trim());

                pi.SetValue(ObjectToLoad, BoxValue(dtProperties.Rows[iRow]["PropertyValue"].ToString().Trim(), pi), null);
                iRow++;
            }
            while (true)
            {
                if (iRow < dtProperties.Rows.Count)
                {
                    NewProperty = dtProperties.Rows[iRow]["PropertyGroupId"].ToString();
                    NoOfProperties = Convert.ToInt32(dtProperties.Rows[iRow]["NoOfProperties"]);
                    CurrentObject = GetObject(CurrentObject, CurProperty, NewProperty);
                    for (int iLoop = 1; iLoop <= NoOfProperties; iLoop++)
                    {
                        Type t = CurrentObject.GetType();
                        PropertyInfo pi = t.GetProperty(dtProperties.Rows[iRow]["PropertyName"].ToString().Trim());
                        if (pi == null)
                        {
                            //string PropName=

                            string ErrorMsg = string.Format(@"Unable to get the property ""{0}"" using reflection", dtProperties.Rows[iRow]["PropertyName"].ToString());
                            throw new Exception(ErrorMsg);
                            //
                        }
                        pi.SetValue(CurrentObject, BoxValue(dtProperties.Rows[iRow]["PropertyValue"].ToString().Trim(), pi), null);
                        iRow++;
                    }
                    CurProperty = NewProperty;
                }
                else
                {
                    break;
                }
            }
        }
        protected object BoxValue(object PropertyValue, PropertyInfo PI)
        {
            if (PI.PropertyType.Name == "String" || PI.PropertyType.Name == "Object")
            {
                return PropertyValue;
            }
            else if (PI.PropertyType.BaseType.Name == "Enum")
            {
                return Enum.Parse(PI.PropertyType, PropertyValue.ToString());
            }
            else if (PI.PropertyType.Name == "Color")
            {
                return Color.FromArgb(Convert.ToInt32(PropertyValue));
            }
            else if (PI.PropertyType.Name == "Unit")
            {
                return new Unit(PropertyValue.ToString());
            }
            else
            {
                return Convert.ChangeType(PropertyValue, PI.PropertyType);
            }
            return 0;
        }
        object GetObject(object CurrentObject, string CurrentPath, string NewPath)
        {
            if (CurrentPath.Trim() == "" || NewPath.IndexOf(CurrentPath) < 0) //if root ojbect which is chart object
            {
                return GetLastChild(objHT["root"], "", NewPath);

            }
            else if (NewPath == CurrentPath)
            {
                return CurrentObject;
            }
            else if (NewPath.IndexOf(CurrentPath) >= 0)
            {
                string ReltivePath = NewPath.Replace(CurrentPath + ".", "");
                return GetLastChild(CurrentObject, CurrentPath, ReltivePath);

            }
            return null;
        }
        object GetLastChild(object obj, string CurrentPathDepth, string path)
        {
            CurrentPathDepth = CurrentPathDepth == "" ? GetFirstObjectNameInPath(path) : CurrentPathDepth + "." + GetFirstObjectNameInPath(path);
            if (path.IndexOf('.') > 0)
            {
                if (!objHT.ContainsKey(CurrentPathDepth))
                {
                    Type t = obj.GetType();
                    PropertyInfo pi = t.GetProperty(GetFirstObjectNameInPath(path));
                    object NextObj = pi.GetValue(obj, null);
                    objHT.Add(CurrentPathDepth, NextObj);
                    return GetLastChild(NextObj, CurrentPathDepth, GetPathWithoutFirstObjectName(path));
                }
                else
                {
                    object NextObj = objHT[CurrentPathDepth];
                    return GetLastChild(NextObj, CurrentPathDepth, GetPathWithoutFirstObjectName(path));

                }
            }
            else
            {
                if (!objHT.ContainsKey(CurrentPathDepth))
                {
                    Type t = obj.GetType();
                    PropertyInfo pi = t.GetProperty(path);
                    object NextObj = pi.GetValue(obj, null);
                    objHT.Add(CurrentPathDepth, NextObj);
                    return NextObj;
                }
                else
                {
                    return objHT[CurrentPathDepth];

                }
            }

        }
        string GetFirstObjectNameInPath(string path)
        {
            if (path.IndexOf('.') > 0)
            {
                return path.Substring(0, path.IndexOf('.'));
            }
            else
            {
                return path;
            }
        }
        string GetPathWithoutFirstObjectName(string path)
        {
            if (path.IndexOf('.') > 0)
            {
                return path.Substring(path.IndexOf('.') + 1);
            }
            else
            {
                return path;
            }
        }
    }




    /// <summary>
    /// Purpose:    This class loads properties of objects from database.
    /// Author:     Muhammed Qasim
    /// Date:       21-05-2008
    /// 
    /// </summary>
    public class CollectionPropertyMapper
    {
        private Hashtable objHT = new Hashtable();

        /// <summary>
        /// Holds the SQL Query to get the properties for the object.
        /// </summary>
        private string _SQLObjectProperties = @"
SELECT     RPTChartEngineCollectionProperty.ObjectID, RPTChartEngineCollectionProperty.CollectionName, 
                      RPTChartEngineCollectionProperty.CollectionPropertyPath, RPTChartEngineCollectionProperty.CollectionPropertyName, 
                      RPTChartEngineCollectionProperty.CollectionPropertyValue, CounterTable.NoOfProperties, RPTChartEngineCollectionProperty.CollectionIndex
FROM         (SELECT     COUNT(*) AS NoOfProperties, CollectionIndex, CollectionPropertyPath
                       FROM          RPTChartEngineCollectionProperty
                       WHERE      (ObjectID = '{0}') AND (CollectionName = '{1}')
                       GROUP BY CollectionIndex, CollectionPropertyPath) CounterTable INNER JOIN
                      RPTChartEngineCollectionProperty ON CounterTable.CollectionIndex = RPTChartEngineCollectionProperty.CollectionIndex AND 
                      CounterTable.CollectionPropertyPath = RPTChartEngineCollectionProperty.CollectionPropertyPath
WHERE     (RPTChartEngineCollectionProperty.ObjectID = '{0}') AND (RPTChartEngineCollectionProperty.CollectionName = '{1}')";
        public CollectionPropertyMapper(ICollection CollectionToLoad, string ObjectID, string CollectionName)
        {
            LoadProperties(CollectionToLoad, ObjectID, CollectionName);
        }
        public void LoadProperties(ICollection CollectionToLoad, string ObjectID, string CollectionName)
        {
            _SQLObjectProperties = string.Format(_SQLObjectProperties, ObjectID, CollectionName);

            DataTable dtProperties;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProperties = CUtilityWeb.getDataTable(_SQLObjectProperties, sqlConnection);
            }
            int iCollectionIndex = 0;
            foreach (object ObjectToLoad in CollectionToLoad)
            {
                DataRow[] drElementProperties = dtProperties.Select(" CollectionIndex=" + iCollectionIndex);

                if (drElementProperties.Length < 1) continue;
                int iRow = 0;
                int NoOfProperties = 0;
                object CurrentObject = ObjectToLoad;
                string NewProperty, CurProperty = "";
                objHT.Clear();
                objHT.Add("root", ObjectToLoad);
                while (drElementProperties[iRow]["CollectionPropertyPath"].ToString().Trim() == "")
                {
                    Type t = ObjectToLoad.GetType();
                    PropertyInfo pi = t.GetProperty(drElementProperties[iRow]["CollectionPropertyName"].ToString().Trim());

                    pi.SetValue(ObjectToLoad, BoxValue(drElementProperties[iRow]["CollectionPropertyValue"].ToString().Trim(), pi), null);
                    iRow++;
                }
                while (true)
                {
                    if (iRow < drElementProperties.Length)
                    {
                        NewProperty = drElementProperties[iRow]["CollectionPropertyPath"].ToString();
                        NoOfProperties = Convert.ToInt32(drElementProperties[iRow]["NoOfProperties"]);
                        CurrentObject = GetObject(CurrentObject, CurProperty, NewProperty);
                        for (int iLoop = 1; iLoop <= NoOfProperties; iLoop++)
                        {
                            Type t = CurrentObject.GetType();
                            PropertyInfo pi = t.GetProperty(drElementProperties[iRow]["CollectionPropertyName"].ToString().Trim());
                            pi.SetValue(CurrentObject, BoxValue(drElementProperties[iRow]["CollectionPropertyValue"].ToString().Trim(), pi), null);
                            iRow++;
                        }
                        CurProperty = NewProperty;
                    }
                    else
                    {
                        break;
                    }
                }
                iCollectionIndex++;
            }
        }
        protected object BoxValue(object PropertyValue, PropertyInfo PI)
        {
            if (PI.PropertyType.Name == "String" || PI.PropertyType.Name == "Object")
            {
                return PropertyValue;
            }
            else if (PI.PropertyType.BaseType.Name == "Enum")
            {
                return Enum.Parse(PI.PropertyType, PropertyValue.ToString());
            }
            else if (PI.PropertyType.Name == "Color")
            {
                return Color.FromArgb(Convert.ToInt32(PropertyValue));
            }
            else if (PI.PropertyType.Name == "Unit")
            {
                return new Unit(PropertyValue.ToString());
            }
            else
            {
                return Convert.ChangeType(PropertyValue, PI.PropertyType);
            }
            return 0;
        }
        object GetObject(object CurrentObject, string CurrentPath, string NewPath)
        {
            if (CurrentPath.Trim() == "" || NewPath.IndexOf(CurrentPath) < 0) //if root ojbect which is chart object
            {
                return GetLastChild(objHT["root"], "", NewPath);

            }
            else if (NewPath == CurrentPath)
            {
                return CurrentObject;
            }
            else if (NewPath.IndexOf(CurrentPath) >= 0)
            {
                string ReltivePath = NewPath.Replace(CurrentPath + ".", "");
                return GetLastChild(CurrentObject, CurrentPath, ReltivePath);

            }
            return null;
        }
        object GetLastChild(object obj, string CurrentPathDepth, string path)
        {
            CurrentPathDepth = CurrentPathDepth == "" ? GetFirstObjectNameInPath(path) : CurrentPathDepth + "." + GetFirstObjectNameInPath(path);
            if (path.IndexOf('.') > 0)
            {
                if (!objHT.ContainsKey(CurrentPathDepth))
                {
                    Type t = obj.GetType();
                    PropertyInfo pi = t.GetProperty(GetFirstObjectNameInPath(path));
                    object NextObj = pi.GetValue(obj, null);
                    objHT.Add(CurrentPathDepth, NextObj);
                    return GetLastChild(NextObj, CurrentPathDepth, GetPathWithoutFirstObjectName(path));
                }
                else
                {
                    object NextObj = objHT[CurrentPathDepth];
                    return GetLastChild(NextObj, CurrentPathDepth, GetPathWithoutFirstObjectName(path));

                }
            }
            else
            {
                if (!objHT.ContainsKey(CurrentPathDepth))
                {
                    Type t = obj.GetType();
                    PropertyInfo pi = t.GetProperty(path);
                    object NextObj = pi.GetValue(obj, null);
                    objHT.Add(CurrentPathDepth, NextObj);
                    return NextObj;
                }
                else
                {
                    return objHT[CurrentPathDepth];

                }
            }

        }
        string GetFirstObjectNameInPath(string path)
        {
            if (path.IndexOf('.') > 0)
            {
                return path.Substring(0, path.IndexOf('.'));
            }
            else
            {
                return path;
            }
        }
        string GetPathWithoutFirstObjectName(string path)
        {
            if (path.IndexOf('.') > 0)
            {
                return path.Substring(path.IndexOf('.') + 1);
            }
            else
            {
                return path;
            }
        }
    }
}

