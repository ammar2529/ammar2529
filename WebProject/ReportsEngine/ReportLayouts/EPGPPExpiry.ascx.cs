using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebProject.ReportsEngine.ReportLayouts
{
    public partial class EPGPPExpiry : System.Web.UI.UserControl, IReportLayout
    {
        IndexedDictionary<string, Table> _LayoutTables = null;
        IndexedDictionary<string, HtmlTable> _HTMLLayoutTables = null;
        void FindChildControls(Table tbl)
        {
            Table ChildTable = null;
            foreach (TableRow TblRow in tbl.Rows)
            {
                foreach (TableCell TblCell in TblRow.Cells)
                {
                    foreach (Control ctrl in TblCell.Controls)
                    {
                        if (ctrl is Table)
                        {
                            ChildTable = (Table)ctrl;
                            _LayoutTables.Add(ChildTable.ID, ChildTable);
                            FindChildControls(ChildTable);
                        }
                    }
                }
            }
        }
        #region IReportLayout Members

        public IndexedDictionary<string, Table> LayoutTables
        {
            get { return _LayoutTables; }
        }
        public IndexedDictionary<string, HtmlTable> HTMLLayoutTables
        {
            get { return _HTMLLayoutTables; }
        }

        IndexedDictionary<string, HtmlTable> IReportLayout.HTMLLayoutTables => throw new NotImplementedException();

        public void InitializeLayout()
        {
            if (_LayoutTables == null)
            {
                _LayoutTables = new IndexedDictionary<string, Table>();
                // _LayoutTables.Add(FirstTable);
                foreach (Control ctrl in this.Controls)
                {
                    if (ctrl is Table)
                    {
                        Table tbl = (Table)ctrl;
                        _LayoutTables.Add(tbl.ID, tbl);
                        FindChildControls(tbl);
                    }
                }
            }

        }
        public void InitializeHTMLLayout()
        {
            if (_HTMLLayoutTables == null)
            {
                _HTMLLayoutTables = new IndexedDictionary<string, HtmlTable>();
                // _LayoutTables.Add(FirstTable);
                foreach (Control ctrl in this.Controls)
                {
                    if (ctrl is HtmlTable)
                    {
                        HtmlTable tbl = (HtmlTable)ctrl;
                        _HTMLLayoutTables.Add(tbl.ID, tbl);
                        FindHTMLChildControls(tbl);
                    }
                }
            }
        }
        void FindHTMLChildControls(HtmlTable tbl)
        {
            HtmlTable ChildTable = null;
            foreach (HtmlTableRow TblRow in tbl.Rows)
            {
                foreach (HtmlTableCell TblCell in TblRow.Cells)
                {
                    foreach (Control ctrl in TblCell.Controls)
                    {
                        if (ctrl is HtmlTable)
                        {
                            ChildTable = (HtmlTable)ctrl;
                            _HTMLLayoutTables.Add(ChildTable.ID, ChildTable);
                            FindHTMLChildControls(ChildTable);
                        }
                        //else if (ctrl is ILayoutTableWidget)
                        //{
                        //    IndexedDictionary<string, HtmlTable> WidgetTables
                        //        =((ILayoutTableWidget)ctrl).ContainerTables;
                        //    foreach (KeyValuePair<string, HtmlTable> WidgetTable in WidgetTables)
                        //    {
                        //        _HTMLLayoutTables.Add(WidgetTable.Key, WidgetTable.Value);
                        //        FindHTMLChildControls(WidgetTable.Value);
                        //    }
                        //}
                    }
                }
            }
        }
        public void AddContainerControlToLayout(ILayoutTableWidget LayoutWidget)
        {

            IndexedDictionary<string, HtmlTable> WidgetTables
    = LayoutWidget.ContainerTables;
            foreach (KeyValuePair<string, HtmlTable> WidgetTable in WidgetTables)
            {
                _HTMLLayoutTables.Add(WidgetTable.Key, WidgetTable.Value);
                FindHTMLChildControls(WidgetTable.Value);
            }
        }
        public Control AddControlToHTMLLayout(Control ControlToPlace, string ContainerId, int RowNo, int ColNo)
        {
            HtmlTable ContainerControl = new HtmlTable();
            ContainerControl.ID = ContainerId;
            ContainerControl.Rows.Add(new HtmlTableRow());
            ContainerControl.Rows[0].Cells.Add(new HtmlTableCell());

            ContainerControl.Border = 0;
            ContainerControl.CellPadding = 0;
            ContainerControl.CellSpacing = 0;
            ContainerControl.Width = "100%";
            this.Controls.Add(ContainerControl);
            _HTMLLayoutTables.Add(ContainerId, ContainerControl);
            if (ColNo < 0 || RowNo < 0) //if container is not a table
            {
                ContainerControl.Controls.Add(ControlToPlace);
                //_ContainerTable.Visible = true;
            }
            else //if container is a table
            {
                CUtilityWeb.PlaceControlInTable(ControlToPlace, (HtmlTable)ContainerControl, RowNo, ColNo);
            }
            return ContainerControl;
        }
        #endregion
    }
}