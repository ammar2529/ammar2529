<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ASPGridWidget.ascx.cs" Inherits="WebProject.ReportsEngine.ReportWidgetControls.ASPGridWidget" %>

<asp:Literal ID="ltlWidgetDiv" runat="server">
</asp:Literal>
    <input id="txtSortBy" type="hidden" value=''  runat="server"  />
    <input id="txtPageIndex" type="hidden" value='0' runat="server" />
<asp:Literal ID="ltlGridHeadingDiv" runat="server">
</asp:Literal>    
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="true" AllowSorting="true"
CellPadding="1" CellSpacing="1" GridLines="None" Width="100%" Visible="true"
 onprerender="GridView1_PreRender" EnableViewState ="false" >
    <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
    <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
    <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
    <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
    <EmptyDataTemplate >

       <table  style="width:100%;text-align:center;vertical-align:middle;font-family:Verdana;font-size:8pt">
       <tr valign="middle" >
       <td style="text-align:center;vertical-align:middle">
        No data found matching to the criteria!
       </td>
       </tr>
       </table>

    </EmptyDataTemplate>
</asp:GridView>


<asp:Literal ID="ltlButtonsPanel" runat="server">
</asp:Literal>


<%--<asp:GridView ID="GridView1" runat="server">

    <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
</asp:GridView>--%>