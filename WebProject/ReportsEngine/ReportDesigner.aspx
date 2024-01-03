<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ReportDesigner.aspx.cs" Inherits="WebProject.ReportsEngine.ReportDesigner" %>

<!-- SmartNavigation="true" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript">
    
    function  UpdateColID(ddl)
    {
//    debugger;
        txtbox=  document.forms[0].txtNewGridColID 
        txtbox.value=ddl.options[ddl.selectedIndex].text;
    }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="float: left">
            <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False" DataSourceID="sdsReport" OnSelectedIndexChanged="gvReport_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ReportID" HeaderText="ReportID" SortExpression="ReportID" />
                    <asp:CommandField SelectText="Edit Report" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            &nbsp;
            <asp:Button ID="btnNewReport" runat="server" Text="New Report" OnClick="btnNewReport_Click" />
            <asp:Label ID="lblNewReportID" runat="server" Text="Report ID"></asp:Label>
            <asp:TextBox ID="txtNewReportID" runat="server"></asp:TextBox></div>
        <asp:Panel ID="pnlNew" runat="server" Width="100%">
            &nbsp;<asp:Panel ID="pnlReport" runat="server" Width="100%">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Grid ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtGridID" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Chart ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtChartID" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Search Panel ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtSearchPanelID" runat="server"></asp:TextBox></td>
                        <td>
                            </td>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Heading"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtHeading" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Group Heading"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtGroupHeading" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label21" runat="server" Text="Short Detail"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtShortDetail" runat="server"></asp:TextBox></td>
                        <td >
                            <asp:Label ID="Label7" runat="server" Text="Long Detail"></asp:Label></td>
                            <td >
                                <asp:TextBox ID="txtLongDetail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Report Depth"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="txtReportDepth" runat="server" Width="490px"></asp:TextBox></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Button ID="btnUpdateReport" runat="server" Text="Save Report" OnClick="btnUpdateReport_Click" /></asp:Panel>
    
    </div>
        <asp:SqlDataSource ID="sdsReport" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT DISTINCT ReportID FROM RPTChartEngineReport" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsSearchPanel" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT RPTChartEngineSearchField.FieldID, RPTChartEngineSearchField.SearchPanelID FROM RPTChartEngineSearchPanel INNER JOIN RPTChartEngineSearchField ON RPTChartEngineSearchPanel.SearchPanelID = RPTChartEngineSearchField.SearchPanelID WHERE (RPTChartEngineSearchField.SearchPanelID = @SearchPaneID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearchPanelID" Name="SearchPaneID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
        <asp:GridView ID="gvField" runat="server" AutoGenerateColumns="False" DataKeyNames="FieldID,SearchPanelID"
            DataSourceID="sdsSearchPanel" OnRowCommand="gvField_RowCommand">
            <Columns>
                <asp:BoundField DataField="FieldID" HeaderText="FieldID" ReadOnly="True" SortExpression="FieldID" />
                <asp:BoundField DataField="SearchPanelID" HeaderText="SearchPanelID" ReadOnly="True"
                    SortExpression="SearchPanelID" />
                <asp:ButtonField CommandName="EditField" Text="Edit Field" />
            </Columns>
        </asp:GridView>
            <asp:Label ID="Label35" runat="server" Text="New Field ID"></asp:Label><asp:TextBox ID="txtNewFieldID" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnNewFieldTextBox" runat="server" Text="New Textbox" OnClick="btnNewFieldTextBox_Click" />
            <asp:Button ID="btnNewLookUpCombo" runat="server" Text="New Lookup " OnClick="btnNewLookUpCombo_Click" Height="28px" />
            <asp:Button ID="btnNewCaseCade" runat="server" Text="New Casecade " OnClick="btnNewCaseCade_Click" />
            <asp:Button ID="btnNewLOV" runat="server" Text="New LOV" OnClick="btnNewLOV_Click" />
            <asp:Button ID="btnDate" runat="server" Text="New Date Picker" OnClick="btnDate_Click" /></div>
        <asp:Panel ID="pnlField" runat="server" Width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label36" runat="server" Text="UI Control Type"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldUIControlType" runat="server"></asp:TextBox></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="Field ID"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldID" runat="server"></asp:TextBox><asp:Label ID="lblfldFieldID" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label33" runat="server" Text="Search Panel ID"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblfldSearchPanelID" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Caption"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCaption" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Caption Col"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCaptionContainerCol" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Caption Row"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCaptionContainerRow" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Caption Css"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCaptionCssClass" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Caption Visible"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCaptionVisible" runat="server"></asp:TextBox></td>
                    <td>
                        </td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Control Col"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldContainerCol" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="Control Row"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldContainerRow" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="DB Col Name"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldDBColName" runat="server"></asp:TextBox></td>
                    <td>
                        </td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Value"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldValue" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="When Empty Value"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldWhenEmptyValue" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="Empty Value"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldEmptyValue" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="CSS Class"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCssClass" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="Enabled"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldEnabled" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="Read Only"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldReadOnly" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="Visible"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldVisible" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="Is Required"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldIsRequired" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="Chart Group ID"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldChartGroupID" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="Is Cross Page"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldIsCrossPage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label27" runat="server" Text="Parent Combo"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCasecadParentID" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label28" runat="server">Child Combo</asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldCasecadChildID" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label29" runat="server">Lookup Query</asp:Label></td>
                    <td colspan="3">
                        <asp:TextBox ID="txtfldLookupQuery" runat="server" Columns="50" Rows="7" 
                            TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label30" runat="server">Value Type</asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldValueType" runat="server"></asp:TextBox></td>
                    <td>
                        Query Parameter</td>
                    <td>
                        <asp:TextBox ID="txtfldQueryParameter" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label31" runat="server">List Values</asp:Label></td>
                    <td colspan="3">
                        <asp:TextBox ID="txtfldListValues" runat="server" Columns="50" Rows="7" 
                            TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label32" runat="server">Skin</asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtfldSkin" runat="server"></asp:TextBox></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSaveField" runat="server" Text="Save Field" OnClick="btnSaveField_Click" />&nbsp;
        </asp:Panel>
        <asp:Panel ID="pnlGridHolder" runat="server" Width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label37" runat="server" Text="Grid ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgrdGridID" runat="server"></asp:TextBox></td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" Text="Command Type"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgrdhSQLCommandType" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="SQLCommand"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgrdhSQLCommand" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:TextBox ID="txtgrdhDataConnectionString" runat="server" Width="688px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            <asp:Button ID="btnSaveGridHolder" runat="server" Text="Save Grid" OnClick="btnSaveGridHolder_Click" /></asp:Panel>
        <asp:Panel ID="pnlNewGridColumn" runat="server" Width="100%">
        <asp:SqlDataSource ID="sdsGridColumns" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT     *&#13;&#10;FROM         RPTChartEngineGridTemplateColumns&#13;&#10;WHERE     (GridID = @GridID)&#13;&#10;order by orderid" UpdateCommand="UPDATE RPTChartEngineGridTemplateColumns SET ColumnID = @ColumnID, Visible = @Visible, OrderID = @OrderID WHERE (GridID = @GridID) AND (ColumnID = @ColumnID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtGridID" DefaultValue="grdITProjectDetails" Name="GridID"
                    PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ColumnID" />
                <asp:Parameter Name="Visible" />
                <asp:Parameter Name="OrderID" />
                <asp:Parameter Name="GridID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvGridColumns" runat="server" DataSourceID="sdsGridColumns" 
                OnSelectedIndexChanged="gvGridColumns_SelectedIndexChanged" 
                AutoGenerateColumns="False" OnDataBound="gvGridColumns_DataBound" 
                onrowupdating="gvGridColumns_RowUpdating">
            <Columns>
                <asp:BoundField DataField="GridID" HeaderText="GridID" SortExpression="GridID" />
                <asp:BoundField DataField="ColumnID" HeaderText="ColumnID" SortExpression="ColumnID" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                <asp:CheckBoxField DataField="Visible" HeaderText="Visible" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
            <asp:Panel ID="pnlGridColumn"
                runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label41" runat="server" Text="Column ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtNewGridColID" runat="server"></asp:TextBox><asp:DropDownList ID="ddlFields" runat="server">
                            </asp:DropDownList><asp:Button ID="btnFetchFields" runat="server" OnClick="btnFetchFields_Click" Text="Fetch Fields" /></td>
                        <td>
                            <asp:Label ID="Label42" runat="server" Text="Order ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtNewGridOrderID" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnSaveGridColumn" runat="server" Text="Save Column" Width="106px" OnClick="btnSaveGridColumn_Click" /></asp:Panel>
            <asp:Panel ID="pnlGridColumnTemplate" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label45" runat="server" Text="Column ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtggctColumnID" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label38" runat="server" Text="Grid ID"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtggctGridID" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label46" runat="server" Text="Column Type"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgctColumnType" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label49" runat="server" Text="Column Heading"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgctColumnHeading" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label43" runat="server" Text="Text Binding Column"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgctTextBindingColumn" runat="server"></asp:TextBox></td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label44" runat="server" Text="Link Binding Column"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtgctLinkBindingColumn" runat="server"></asp:TextBox></td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">
                            <asp:Label ID="Label47" runat="server" Text="Child Query"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="txtgctChildQuery" runat="server" Columns="80" Rows="7" 
                                TextMode="MultiLine"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnSaveColumnTemplate" runat="server" Text="Save Column Template" OnClick="btnSaveColumnTemplate_Click" /></asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
