<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header_Menu.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header_Menu" %>

<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td width="100%" class="menuContainer" nowrap="nowrap" style="padding: 0px 5px 0px 0px;">
            </td>
            <td>
                <img height="20" width="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td class="text-align-positive" style="color: #ffffff; padding: 5px 5px 5px 10px;"
                nowrap="nowrap">
                <b>
                    <label id="lblLoggedUser" class="LoggedUser" runat="server">
                    </label>
                </b>
            </td>
            <td style="color: #ffffff; padding: 5px 5px 5px 5px; display:none" nowrap="nowrap">
                <b>|</b>
            </td>
            <td class="ProxyLogin" style="padding: 0px 0px 0px 0px;">
                    <img class="ShowProxyList" height="20" width="20" alt="" src="App_Themes/eForms_Theme/Images/ProxyIcon.png" border="0" />
            </td>
            <td style="color: #ffffff; padding: 5px 5px 5px 5px;" nowrap="nowrap">
                <b>|</b>
            </td>
            <td class="text-align-positive" style="color: #ffffff; padding: 5px 5px 5px 5px;"
                nowrap="nowrap">
                <b><a style="color: #ffffff; text-decoration: none" showwidget="frmChangePassword"
                    href="javascript:void(0);">Change Password</a></b>
            </td>
            <td style="color: #ffffff; padding: 5px 5px 5px 5px;" nowrap="nowrap">
                <b>|</b>
            </td>
            <td class="text-align-positive" style="color: #ffffff; padding: 5px 10px 5px 5px;"
                nowrap="nowrap">
                <b><a style="color: #ffffff;" href="javascript:void(0);" class="logout">
                    Sign Out</a></b>
            </td>
            <td>
                  <select class="dropdownlist cboProxy"  style="display:none"
                            groupid="grpProxy" argumentid="ProxyUsers" storeinfo="{Command:'FX_SEL_Users_Proxy',TextCol:'Name',ValCol:'ProxyUserId'}">
                            <option value="" selected="selected">Select Proxy User</option>
                  </select>

                <div class="ProxyList unselectable" style="position:absolute;">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    </table>
                </div>
             </td>
        </tr>
    </tbody>
</table>