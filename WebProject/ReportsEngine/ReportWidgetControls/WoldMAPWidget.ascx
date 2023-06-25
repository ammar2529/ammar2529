<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WoldMAPWidget.ascx.cs" Inherits="WebProject.ReportsEngine.ReportWidgetControls.WoldMAPWidget" %>

<asp:Literal ID="ltlWidgetStartHTML" runat="server">
</asp:Literal>

<asp:Literal ID="ltlGridHeadingDiv" runat="server">
</asp:Literal>    
<div id="WorldContinentsMap" class="WorldContinentsMap" style="float:left;" runat="server">
FusionMaps.
</div>
<div id="Spacer"  runat="server"></div>
<div id="CountriesContainer" >
    <div id="Continent_NA" style="float:left;display:none" runat="server">na</div>
    <div id="Continent_CA" style="float:left;display:none" runat="server">ca</div>
    <div id="Continent_SA" style="float:left;display:none" runat="server">sa</div>
    <div id="Continent_EU" style="float:left;display:none"  runat="server">eu</div>
    <div id="Continent_AF" style="float:left;display:none" runat="server">af</div>
    <div id="Continent_ME" style="float:left;display:none" runat="server">me</div>
    <div id="Continent_AS" style="float:left;display:none" runat="server">as</div>
    <div id="Continent_OC" style="float:left;display:none" runat="server">oc</div>
    <div style="Clear:both"></div>
    <asp:Literal ID="ltlButtonsPanel" runat="server">
    </asp:Literal>
</div>
<script type="text/javascript" language="javascript">
    if(typeof ContinentClicked != undefined )
    {
        ShowContinent = function(WorldMapId, ContinentMapId) {
           // debugger;
            var objs = $('[TargetMapId]').not('[TargetMapId="' + WorldMapId + '"]');
            objs.css({ 'display': 'none' });
            $('[TargetMapId="' + ContinentMapId + '"]').css({ 'display': '' });
        }
    }
</script>
<asp:Literal ID="ltlWidgetEndHTML" runat="server">
</asp:Literal>