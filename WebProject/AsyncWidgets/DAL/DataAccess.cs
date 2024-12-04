using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Common;
using System.Configuration;
using System.Collections;
using System.Xml;
using WebProject.AsyncWidgets.Utility;
using NLog;
using NLog.Fluent;
using System.ServiceModel.Channels;
using System.Configuration.Provider;
namespace WebProject.AsyncWidgets.DAL
{
 



    public class DbConnContainer : IDisposable 
    {
        DbConnection _DbConnection;
        string _Provider;
        bool Disposed = false;
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();
        public DbConnContainer(DbConnection DbConnection, string Provider)
        {
            _DbConnection = DbConnection;
            _Provider = Provider;
        }
        public DbConnection DbConnection { get { return _DbConnection; } }
        public string Provider { get { return _Provider; } }

        public static explicit operator DbConnection(DbConnContainer RSide)
        {
            return RSide.DbConnection ;
        }

        #region IDisposable Members

        public void Dispose()
        {
            Dispose(true);
            // GC.SuppressFinalize(this);
            //DbConnection.Close();
            
            DbConnection.Dispose();
            Log.Info("Disposed Connection");
        }
        private void Dispose(bool Disposing)
        {

            if (!this.Disposed)
            {

                if (Disposing)
                {
                    _DbConnection.Dispose();
                    _Provider = null;
                }
            }
            Disposed = true;
        }
        #endregion
    }
     public  class DBHelper
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();
        //private static DbConnContainer RetConn = null;
        private static Dictionary<string, DbConnContainer> Connections = new Dictionary<string, DbConnContainer>();
        public static DbConnContainer GetConnection()
         {
             return GetConnection(
                    ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
                    ConfigurationManager.ConnectionStrings["DefaultConnection"].ProviderName
                    );
         }
         public static DbConnContainer GetConnection(string ConnName)
        {
            if (!string.IsNullOrEmpty(ConnName))
            {
                ConnName = "DefaultConnection";
            }
            return GetConnection( ConfigurationManager.ConnectionStrings[ConnName].ConnectionString,
             ConfigurationManager.ConnectionStrings[ConnName].ProviderName 
            );
        }
        // public static DbConnContainer GetConnection(string ConnectionString, string ProviderName)
        //{
        //    DbConnContainer RetConn;
        //    switch (ProviderName)
        //    {
        //        case "System.Data.SqlClient":
        //            RetConn =new DbConnContainer( new SqlConnection(ConnectionString),ProviderName );
        //            break;
        //        default:
        //            return null;
        //            break;

        //    }
        //    RetConn.DbConnection.Open();
        //    return RetConn; 
        //}
        //        public static DbConnContainer GetConnection(string ConnectionString, string ProviderName)
        //        {
        //            if (Connections.ContainsKey(ConnectionString) && Connections[ConnectionString].DbConnection.State == ConnectionState.Open)
        //            {
        //                    return Connections[ConnectionString];
        //            }
        //            else
        //            {
        //                if (Connections.ContainsKey(ConnectionString))
        //                {
        //                    Connections[ConnectionString].DbConnection.Dispose();
        //                    Connections.Remove(ConnectionString);
        //                }
        //            }

        //            try
        //            {
        //                DbConnContainer retConn;
        //                switch (ProviderName)
        //                {
        //                    case "System.Data.SqlClient":
        //                        retConn = new DbConnContainer(new SqlConnection(ConnectionString), ProviderName);


        //                        break;
        //                    default:
        //                        return null;
        //                }

        //                // Attempt to open the connection
        //                Connections.Add(ConnectionString, retConn);

        //                if(Connections[ConnectionString].DbConnection.State == ConnectionState.Open)
        //                {
        //                    retConn.DbConnection.Close();
        //                }
        //                retConn.DbConnection.Open();
        //                return retConn;
        //            }
        ////            catch (InvalidOperationException ex)
        ////            {
        ////                Log.Info($@"exception occured:
        ////{ex.Message}
        ////-----------------------------------------------------------------------
        ////{ex.StackTrace}
        ////-----------------------------------------------------------------------
        ////{ex.InnerException?.Message}
        ////");
        ////                // Handle specific connection-related exceptions, such as timeout
        ////                //Console.WriteLine("Failed to obtain a connection from the pool: " + ex.Message);
        ////                //RetConn?.DbConnection.Dispose(); // Ensure disposal of partially created objects
        ////                return null;
        ////            }
        //            catch (Exception ex)
        //            {
        //                Log.Info($@"exception occured:
        //{ex.Message}
        //-----------------------------------------------------------------------
        //{ex.StackTrace}
        //-----------------------------------------------------------------------
        //{ex.InnerException?.Message}
        //");

        //                // Handle other potential exceptions
        //                // Console.WriteLine("An error occurred: " + ex.Message);
        //                // RetConn?.DbConnection.Dispose(); // Ensure disposal of partially created objects
        //                return null;
        //            }
        //        }

        private static readonly object _lock = new object();

        public static DbConnContainer GetConnection(string ConnectionString, string ProviderName)
        {

            // Lock the code section to ensure only one thread can enter
            //lock (_lock)
            //{
                //if (Connections.ContainsKey(ConnectionString) && Connections[ConnectionString].DbConnection.State == ConnectionState.Open)
                //{
                //    return Connections[ConnectionString];
                //}
                //else
                //{
                //    if (Connections.ContainsKey(ConnectionString))
                //    {
                //        Connections[ConnectionString].DbConnection.Dispose();
                //        Connections.Remove(ConnectionString);
                //    }
                //}

                try
                {
                    DbConnContainer retConn;
                    switch (ProviderName)
                    {
                        case "System.Data.SqlClient":
                            retConn = new DbConnContainer(new SqlConnection(ConnectionString), ProviderName);
                            break;
                        default:
                            return null;
                    }

                    //// Attempt to open the connection
                    //Connections.Add(ConnectionString, retConn);

                    //if (Connections[ConnectionString].DbConnection.State == ConnectionState.Open)
                    //{
                    //    Logger.Info($@"closing connection:");
                    //    retConn.DbConnection.Close();
                    //    Logger.Info($@"closed connection:");
                    //}
                    Logger.Info($@"Opening connection:");
                    retConn.DbConnection.Open();
                    Logger.Info($@"Connection Opened");
                    return retConn;
                }
                catch (Exception ex)
                {
                    Logger.Error($@"failed to open connection: exception occured:
{ex.Message}
-----------------------------------------------------------------------
{ex.StackTrace}
-----------------------------------------------------------------------
{ex.InnerException?.Message}
");

                    // Handle other potential exceptions
                    return null;
                }
            }
        //}


        public static DataSet GetDataSet(string SQLText)
        {
            using (DbConnContainer dbConn = DBHelper.GetConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
                    , ConfigurationManager.ConnectionStrings["DefaultConnection"].ProviderName))
            {
                return GetDataSet(SQLText, dbConn);
            }
        }
        public static DataSet GetDataSet(string SQLText, string ConnName)
        {

            using (DbConnContainer dbConn = DBHelper.GetConnection( ConfigurationManager.ConnectionStrings[ConnName].ConnectionString
                , ConfigurationManager.ConnectionStrings[ConnName].ProviderName))
            {
                return GetDataSet(SQLText,dbConn);
            }
        }
        public static DataSet GetDataSet(string SQLText, string ConnString, string ProviderName)
        {
            using (DbConnContainer dbConn = DBHelper.GetConnection(ConnString, ProviderName))
            {
                return GetDataSet(SQLText, dbConn);
            }
        }
        public static DataSet GetDataSet(string SQLText,DbConnContainer ConnContainer)
        {
            DataSet dsFrom = null;
            switch (ConnContainer.Provider)
            {
                case "System.Data.SqlClient":

                    try
                    {
                        dsFrom = new DataSet();
                        SqlConnection SQLConn = (SqlConnection)ConnContainer;
                            SqlDataAdapter daFrom = new SqlDataAdapter(SQLText, SQLConn);
                            daFrom.Fill(dsFrom, "tTable");
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    return dsFrom;
                    break;
                default:
                    return null;
                    break;

            }

        }

        public static DataSet GetDataTableProc(string SPName, ParamDictionary<string, QueryParameter> Params)
        {
            using (var conn= GetConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
ConfigurationManager.ConnectionStrings["DefaultConnection"].ProviderName)) {

                return GetDataTableProc(SPName, Params,conn );
            }
        }
        public static DataSet GetDataTableProc(string SPName, ParamDictionary<string, QueryParameter> Params, string ConnName)
        {
            using (var conn = GetConnection(ConfigurationManager.ConnectionStrings[ConnName].ConnectionString,
 ConfigurationManager.ConnectionStrings[ConnName].ProviderName))
            {
                return GetDataTableProc(SPName, Params, conn);
            }
        }
        public static DataSet GetDataTableProc(string SPName, ParamDictionary<string, QueryParameter> Params, string ConnectionString, string ProviderName)
        {
            using (var conn = GetConnection(ConnectionString, ProviderName))
            {
                return GetDataTableProc(SPName, Params, conn);
            }
        }
        public static DataSet GetDataTableProc(string SPName, ParamDictionary<string, QueryParameter> Params, DbConnContainer ConnContainer)
        {
            return GetDataTableProc(SPName, GetSPParams(SPName, Params, ConnContainer), ConnContainer);
        }
        public static DataSet GetDataTableProc(string SPName,  DbParameter[] oParameterList,DbConnContainer ConnContainer)
        {
            DataSet dsFrom = new DataSet();

            switch (ConnContainer.Provider)
            {
                case "System.Data.SqlClient":
                    

                    SqlConnection SQLConn = (SqlConnection)ConnContainer.DbConnection;
                    try
                    {
                        using (SqlCommand SQLCMD = SQLConn.CreateCommand())
                        {
                            SQLCMD.CommandType = CommandType.StoredProcedure;
                            SQLCMD.Connection = SQLConn;
                            SQLCMD.CommandTimeout = 120;
                            SQLCMD.CommandText = SPName;
                            if (oParameterList != null)
                            {
                                IEnumerator oEnumerator = oParameterList.GetEnumerator();
                                while (oEnumerator.MoveNext())
                                {
                                    if (oEnumerator.Current != null)
                                        SQLCMD.Parameters.Add(oEnumerator.Current);
                                }
                            }
                            SqlDataAdapter daFrom = new SqlDataAdapter(SQLCMD);

                            daFrom.Fill(dsFrom, "tTable");
                            daFrom.Dispose();
                            daFrom = null;
                        }
                    }
                    catch (Exception ex)
                    {
                        var st = ex.StackTrace;
                       // throw ex;
                    }
                    break;
                default:
                    return null;
            }
            return dsFrom;
        }
 
         
        public static string InvokeSP(string SPName, ParamDictionary<string, QueryParameter> Params)
        {
            using (var conn = GetConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString,
ConfigurationManager.ConnectionStrings["DefaultConnection"].ProviderName))
            {
                return InvokeSP(SPName, Params,conn);
            }
        }
        public static string  InvokeSP(string SPName, ParamDictionary<string, QueryParameter> Params ,string ConnectionString, string ProviderName)
        {
            using (var conn= GetConnection(    ConnectionString,ProviderName))
            {
                return InvokeSP(SPName, Params, conn);
            }
        }
        public static string InvokeSP(string SPName, ParamDictionary<string, QueryParameter> Params, DbConnContainer ConnContainer)
        {
            SqlConnection SQLConn = (SqlConnection)ConnContainer.DbConnection;
            string Status = "";
            using (SqlCommand SQLCMD = SQLConn.CreateCommand())
            {
                SQLCMD.CommandType = CommandType.StoredProcedure;
                SQLCMD.Connection = SQLConn;
                SQLCMD.CommandTimeout = 120;
                SQLCMD.CommandText = SPName;

                SQLCMD.Parameters.AddRange(GetSPParams(SPName, Params, ConnContainer));
                SQLCMD.ExecuteNonQuery();

                if (SQLCMD.Parameters.Contains("@Status"))
                {
                    Status = SQLCMD.Parameters["@Status"].Value.ToString();
                }
            }
            return Status;
        }
        public static SqlParameter[] GetSPParams(string SPName, ParamDictionary<string, QueryParameter> Params, DbConnContainer ConnContainer)
         {
             SqlConnection sqlConn = (SqlConnection)ConnContainer.DbConnection;
             string SPUniqueName = sqlConn.DataSource + "_" + sqlConn.Database + "_" + SPName;
             //get it from static cache
             if (StaticCache.HasItem("SPParamsInfo", SPUniqueName))
             {
                 return (SqlParameter[])StaticCache.GetCachedItem("SPParamsInfo", SPUniqueName);
             }

             SqlParameter[] arrSqlParams = new SqlParameter[1];
             arrSqlParams[0] = GetSQLParam("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);

            try
            {
                DataTable dtProcParams;
                var ds = GetDataTableProc("sp_sproc_columns", arrSqlParams, ConnContainer);
                dtProcParams = ds.Tables[0];
                if (dtProcParams.Rows.Count == 0)
                {
                    throw new Exception("Stored procedure not found!");
                }

                arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
                int iRow = 0;

                foreach (DataRow DR in dtProcParams.Rows)
                {
                    if (iRow == 0) { iRow++; continue; }
                    string ParamValue;
                    string ParamName = DR["Column_Name"].ToString();

                    SqlDbType ParamDBType = (SqlDbType)Enum.Parse(typeof(SqlDbType),
                        DR["Type_Name"].ToString().Replace("numeric", "Decimal"), true); // GetSQLDataType(DR["Type_Name"].ToString());
                    int ParamLen = Convert.ToInt32(DR["Length"]);
                    ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
                    if (ParamName.Substring(1).Equals("Status", StringComparison.CurrentCultureIgnoreCase))
                    {
                        arrSqlParams[iRow - 1] = GetSQLParam(ParamName, ParamDBType, ParamLen, "", ParameterDirection.Output);
                    }
                    else if (Params.ContainsKey(ParamName.Substring(1)))
                    {
                        ParamValue = Params[ParamName.Substring(1)].ParameterValue;//SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString();

                        arrSqlParams[iRow - 1] = GetSQLParam(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                    }
                    else
                    {
                        ParamValue = "@EV"; //then pass null to stored procedure
                        arrSqlParams[iRow - 1] = GetSQLParam(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                    }
                    iRow++;
                }
                ds.Dispose();
                ds = null;
                dtProcParams.Dispose();
                dtProcParams = null;
                return arrSqlParams;


            }
            catch (Exception ex) {
                throw ex; 
            
            }
        }
       
         private static object SetEmptyValues(string Value, SqlDbType ParamDBType)
         {
             //if (Value == "DBNull" || Value == "-1" || (Value.Trim() == "" && ParamDBType == SqlDbType.DateTime))
             //{
           
             if ( Value == "@EV" && ParamDBType == SqlDbType.DateTime)
             {
                 return DBNull.Value;
             }
             else if (ParamDBType == SqlDbType.UniqueIdentifier)
             {
                 if (Value == "@EV" || Value == "@EA")
                 {
                     return DBNull.Value;
                 }
                 else
                 {
                     return Guid.Parse(Value);

                 }
             }
            else if (Value == "@EV" )
             {
                 return DBNull.Value;
             }
             else if (Value == "@EA")
             {
                 return "";
             }
             else if (ParamDBType == SqlDbType.Bit)
             {
                 if (Value == "0" || Value.ToUpper() == "N" || Value.ToUpper() == "NO")
                 {
                     return false;
                 }
                 else
                     return true;
             }

             else
                 return Value;
         }
        public static SqlParameter GetSQLParam(string strParamName,
                            SqlDbType strType,
                            int nLen,
                            object strParamValue,
                            ParameterDirection Direction)
        {
            try
            {
                SqlParameter oAddParameter;
                oAddParameter = new SqlParameter(strParamName, strType, nLen);
                oAddParameter.Direction = Direction;
                oAddParameter.Value = strParamValue;
                return oAddParameter;
            }
            catch (Exception errError)
            {
                throw errError;
            }
        }

        public static  Boolean RecordExists(ParamDictionary<string, QueryParameter> Params, string TableName, string UniqueKeys,DbConnContainer ConnContainer)
        {
           string _TableName,WhereCondition="",SqlUniqueKey;//,_UniqueKeys ;
           _TableName = TableName != null ? TableName : Params.FormName;
           string[] _UniqueKeys = UniqueKeys != null ? UniqueKeys.Split(new char[] { ',' })
                                            : Params.UniqueKeys.Split(new char[] { ',' });
            DbParameter[] dbParams;
            DataTable dtColumns=null;
            Dictionary<string,string> ColumnsInfo=
             new Dictionary<string, string>(StringComparer.InvariantCultureIgnoreCase);
            if (StaticCache.HasItem("TableColsInfo", _TableName))
            {
                dtColumns = (DataTable)StaticCache.GetCachedItem("TableColsInfo", _TableName);
            }
            else

            {
                switch (ConnContainer.Provider)
                {
                    case "System.Data.SqlClient":
                        dbParams = new SqlParameter[] { GetSQLParam("@table_name", SqlDbType.NVarChar, 786, _TableName, ParameterDirection.Input) };
                        dtColumns = GetDataTableProc("sp_columns", dbParams, ConnContainer).Tables[0];
                        break;
                }
                StaticCache.SetCachedItem("TableColsInfo", _TableName, dtColumns);
            }
            foreach (string UniqueKey in _UniqueKeys)
            {
                DataRow[] drs= dtColumns.Select("COLUMN_NAME = '" + UniqueKey + "'");
                if(drs.Length > 0){
                    ColumnsInfo.Add(UniqueKey, drs[0]["TYPE_NAME"].ToString());
                }
            }
                       
            foreach (string UniqueKey in _UniqueKeys)
            {
                if (Params[UniqueKey].ParameterValue != "@EV" && Params[UniqueKey].ParameterValue != "@EA")
                {
                    if (ColumnsInfo.ContainsKey(UniqueKey))
                    {
                        if (WhereCondition != "") { WhereCondition += " and "; }
                        if ("ncharnvarcharsamlldatetime".Contains(ColumnsInfo[UniqueKey]))
                        {
                            WhereCondition += string.Format(" {0} = '{1}' ", UniqueKey, Params[UniqueKey].ParameterValue);
                        }
                        else
                        {
                            WhereCondition += string.Format(" {0} = {1} ", UniqueKey, Params[UniqueKey].ParameterValue);
                        }
                    }
                }
            }
            if (Params.ContainsKey("primarykey") && Params.ContainsKey("primarykeyvalue"))
            { 
                string PRMKey,recid;
                PRMKey = Params["primarykey"].ParameterValue;
                recid=Params["primarykeyvalue"].ParameterValue.Trim();

                DataRow[] drs = dtColumns.Select("COLUMN_NAME = '" + PRMKey + "'");
                if (drs.Length > 0)
                {
                    if (!ColumnsInfo.ContainsKey(PRMKey))
                    {
                        ColumnsInfo.Add(PRMKey, drs[0]["TYPE_NAME"].ToString());
                    }
                }

                if (recid != "") {
                    if (WhereCondition != "") { WhereCondition += " and "; }
                    if ("ncharnvarcharsamlldatetime".Contains(ColumnsInfo[PRMKey]))
                    {
                        WhereCondition += string.Format(" {0} <> '{1}' ", PRMKey, recid);
                    }
                    else
                    {
                        WhereCondition += string.Format(" {0} <> {1} ", PRMKey, recid);
                    }

                }
            }
            SqlUniqueKey = string.Format(@"select count(*) NoOfRecs from {0} where {1}", _TableName, WhereCondition);
            object Result = ExecutScaler(SqlUniqueKey, ConnContainer);
            if (Convert.ToInt32(Result) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static Boolean RecordExists(ParamDictionary<string, QueryParameter> Params, string TableName, string UniqueKeys)
        {
            using (var conn = GetConnection())
            {
                return RecordExists(Params, TableName, UniqueKeys, conn);
            }
        }
        //public static Boolean RecordExists(ParamDictionary<string, QueryParameter> Params, DbConnection Conn)
        //{
        //    string TableName = null,;

        //   return RecordExists(Params, null,null, Conn);
        //}

        public static object ExecutScaler(string SQLText)
        {

            using (var conn = GetConnection())
            {
                return ExecutScaler(SQLText, conn);
            }
        }
        static object ExecutScaler(string SQLText, DbConnContainer ConnContainer)
        {
            try
            {
                switch (ConnContainer.Provider)
                {
                    case "System.Data.SqlClient":
                        SqlConnection conn = (SqlConnection)ConnContainer;
                        SqlCommand SQLCMD = new SqlCommand(SQLText, conn);
                        return SQLCMD.ExecuteScalar();
                        break;
                    default:
                        return null;
                        break;
                }
            }
            catch (Exception ex)
            {
                Log.Info(ex.Message);
                throw ex;
            }
        }
    }
}
