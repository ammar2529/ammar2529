<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TabPanel.ascx.cs" Inherits="WebProject.AsyncWidgets.Widgets.TabPanel" %>
<asp:Panel ID="WPNL" Visible="false" IsAsync="true" runat="server" >
<asp:PlaceHolder ID="ContainerHolder" runat="server"></asp:PlaceHolder>
</asp:Panel>
<asp:Panel ID="AsyncPNL" Visible="true" runat="server" CssClass="AsyncPNL" >
</asp:Panel>