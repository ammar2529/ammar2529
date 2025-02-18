using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebProject.AsyncWidgets
{
    public static class Extensions
    {
        public static List<Dictionary<string, object>> ToDictionaryList(this DataTable table)
        {
            return table.AsEnumerable().Select(row => table.Columns
                .Cast<DataColumn>()
                .ToDictionary(column => column.ColumnName, column => row[column])).ToList();
        }
    }
}

