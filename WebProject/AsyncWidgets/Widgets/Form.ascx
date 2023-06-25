<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Form.ascx.cs" Inherits="WebProject.AsyncWidgets.Widgets.Form" %>
<asp:PlaceHolder ID="ContainerHolder" runat="server"></asp:PlaceHolder>
<asp:Panel ID="WPNL" Visible="false" IsAsync="true" runat="server"  >
</asp:Panel>
<asp:Panel ID="AsyncPNL" Visible="true" runat="server" CssClass="AsyncPNL" >
</asp:Panel>