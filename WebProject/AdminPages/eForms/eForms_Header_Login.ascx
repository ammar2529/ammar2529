<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header_Login.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header_Login" %>

<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
   <%--     <td style="padding: 1px 5px 2px 5px;">
                <a showwidget="frmHome" href='javascript:void(0);'>
                    <img height="25" width="25" alt="" src="App_Themes/eForms_Theme/Images/Home.png"
                        border="0" /></a>
            </td>--%>
            <td>
                <img height="20" width="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td class="text-align-positive" style="color: #ffffff; padding: 5px 10px 5px 10px;">
                <b><a style="text-decoration: none; color: #ffffff;" showwidget="frmHome" href="javascript:void(0);">
                    Home</a></b>
            </td>
            <td width="100%">
            </td>
            <td nowrap="nowrap">
                <div class="tmp_rtxtb text-align-positive" style="color: #ffffff;">
                    User ID:</div>
            </td>
            <td>
                <img alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td>
                <div style="width: 105px; text-align: left">
                    <input type="text" style="width: 90px;" class="text required" tabindex="1" blurvalidate="false"
                        requirederr=' *' argumentid="UserName" groupid="UserLogin" value="" />
                </div>
            </td>
            <td>
                <img height="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
            </td>
            <td>
                <div class="tmp_rtxtb text-align-positive" style="color: #ffffff;">
                    Password:</div>
            </td>
            <td>
                <img alt="" src="App_Themes/eForms_Theme/Images/spacer.gif">
            </td>
            <td>
                <div style="width: 110px; text-align: left">
                    <input type="Password" value="" style="width: 90px" class="text required" tabindex="2" argumentid="UserPassword"
                        groupid="UserLogin" blurvalidate="false" requirederr=' *' />
                </div>
            </td>
            <td>
                <img height="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
            </td>
            <td style="padding-right: 10px; padding-top:2px">
                <asp:Button ID="LoginButton" OnClientClick="return false;" Style="cursor: pointer;
                    background-color: #73ABCB" TabIndex="3" conf="{ActorId:'Authentication',ActionId:'AuthenticateUser',Action:'login'}"
                    CssClass="LoginButton ActionButton" runat="server" Width="38px" Height="23px" />
            </td>
        </tr>
    </tbody>
</table>