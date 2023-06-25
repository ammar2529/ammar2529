using System;
using System.Collections.Generic;
using System.Web;

namespace WebProject.AsyncWidgets.DAL
{

    /// <summary>
    /// Summary description for ParamDictionary
    /// </summary>
    public interface IQueryParameter
    {
        // string ParameterName { get; }
        string ParameterValue { get; }
        // string ParameterGroup { get; }
        // bool IsUnique { get; }

    }
    public class QueryParameter : IQueryParameter
    {
        public QueryParameter(string ParameterValue) //, string ParameterValue )
        {
            // _ParameterName = ParameterName;
            _ParameterValue = ParameterValue;
        }
        public QueryParameter(string ParameterValue, bool IncludeInUpdate) //, string ParameterValue )
        {
            // _ParameterName = ParameterName;
            _ParameterValue = ParameterValue;
            _IncludeInUpdate = IncludeInUpdate;
        }
        #region IQueryParameter Members
        //string _ParameterName = null;
        //public string ParameterName
        //{
        //    get { return _ParameterName; }
        //}
        string _ParameterValue = null;
        public string ParameterValue
        {
            get { return _ParameterValue; }
        }
        //string _ParameterGroup = null;
        //public string ParameterGroup
        //{
        //    get { return _ParameterGroup; }
        //    set { _ParameterGroup = value ; }
        //}
        bool _IncludeInUpdate = true;
        public bool IncludeInUpdate
        {
            get { return _IncludeInUpdate; }
            set { IncludeInUpdate = value; }
        }

        #endregion
    }

    public class ParamDictionary<Tkey, TValue> : Dictionary<string, TValue>

    {
        public delegate AddQueryParamDel AddQueryParamDel(string ParamName, TValue ParamValue);
        AddQueryParamDel AQPD;
        private string _FormName;
        private string _UniqueKeys;
        private string _UniqueKeysCommas;
        public ParamDictionary(string FormName, string UniqueKeys)
            : base(StringComparer.InvariantCultureIgnoreCase)
        {
            _FormName = FormName;
            _UniqueKeys = UniqueKeys;
            _UniqueKeysCommas = "," + _UniqueKeys + ",";
            AQPD = AddQueryParam;
        }

        //public AddQueryParamDel AddQP(string ParamName, string ParamValue)
        //{
            
        //    return this.AddQueryParam(ParamName, new TValue(ParamValue));
        //}
        public AddQueryParamDel AddQueryParam(string ParamName, TValue ParamValue)
        {
            this.Add(ParamName, ParamValue);
            return AQPD;
        }
        public bool IsParamUnique(string ParamName)
        {
            return _UniqueKeysCommas.Contains("," + ParamName + ",");

        }
        // private ParamDictionary() { }
        public string FormName { get { return _FormName; } }
        public string UniqueKeys { get { return _UniqueKeys; } }
    }
}