<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Logout.ascx.cs" Inherits="WebProject.AsyncWidgets.Widgets.Logout" %>
<asp:Panel ID="WPNL" Visible="false" IsAsync="true" runat="server" style="display:none" >
</asp:Panel>
<asp:Panel ID="AsyncPNL" Visible="true" runat="server" CssClass="AsyncPNL" >
       <table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 20px;
        padding-right: 20px; padding-bottom: 10px; padding-top: 5px;">
                <tr>
                <td>
                 <br />
                    <b lang="{type:'innerText',ar:'تم الخروج من الصفحة بنجاح',en:'You have successfully Logged Out'}">You have successfully Logged Out</b>
                         <br />
                    <br />
<%--                    <span lang="{ResFile:'Site_Profile',ResId:'Need_Assistance'}">If you have any questions or need assistance, please contact us at: </span><a href="mailto:support@Q8OnlineCars.com">support@Q8OnlineCars.com</a>
                    <br />
                    <br />--%>
                     <%--<span lang="{ResFile:'Site_Profile',ResId:'Thank_You_Choosing'}">Thank you for choosing Q8OnlineCars.com. We are committed to providing you with the services and support to help you succeed online.</span>--%>
                    <span>Thank you for choosing Q8CricInfo.com. We are committed to providing you with the services and support to help you succeed online.</span>
                    <br />
                    <br />
                    <%--<b><span lang="{ResFile:'Site_Profile',ResId:'Best_Wishes'}">Best Wishes,</span></b> <br />
                    <span lang="{type:'innerText',ar:'Q8OnlineCars.com',en:'The Q8OnlineCars.com Team'}">The Q8OnlineCars.com Team</span>--%>
                    <b><span>Best Wishes,</span></b> <br />
                    <span>The Q8CricInfo.com Team</span>
                    <br />
                    <br />
                </td>
            </tr>
    </table>
</asp:Panel>