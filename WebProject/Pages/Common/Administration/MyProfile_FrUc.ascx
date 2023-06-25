<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyProfile_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.MyProfile_FrUc" %>

<div style="text-align: center; margin: 0; background: #EEEEFF; padding: 10px;">
    <center>
        <table cellspacing="2" style="width: 100%" class="w-form-table">
            <tbody>
                <tr>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td class="ftitle">
                        <div style="display: none">
                            <span groupid="MyProfile" argumentid="UserId"></span>
                        </div>
                        <span class="ftitle" groupid="MyProfile" argumentid="Name" style="color:Red"></span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%; white-space: nowrap;" class="ftitle">
                        Organization:
                    </td>
                    <td style="width: 75%">
                         <span class="ftitle" groupid="MyProfile" argumentid="Organization"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Department:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="MyProfile" argumentid="Department"></span>
                    </td>
                </tr>
                         <tr>
                    <td class="ftitle">
                        <nobr>Email:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="MyProfile" argumentid="Email"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                        <span class="smalltext" style="color:Red"><b><i>Please contact helpdesk or systems administrator to change above details if incorrect...</i></b></span>
                    </td>
                </tr>
                                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td class="ftitle" style="padding-right:15px">
                        <nobr>Home - Payroll Information:</nobr>
                    </td>
                    <td class="ftitle">
                        <input type="radio" checked="checked" default="default" value="0" name="ShowEmpInfo"
                            groupid="MyProfile" argumentid="ShowEmpInfo"><label>Hide</label>
                        <input type="radio" value="1" name="ShowEmpInfo" groupid="MyProfile" argumentid="ShowEmpInfo"><label>Show</label>
                    </td>
                </tr>
                                <tr>
                    <td class="ftitle" style="padding-right:15px">
                        <nobr>Email Notification:</nobr>
                    </td>
                    <td class="ftitle">
                        <input type="radio" checked="checked" default="default" value="1" name="EmailNotification"
                            groupid="MyProfile" argumentid="EmailNotification"><label>Enable</label>
                        <input type="radio" value="0" name="EmailNotification" groupid="MyProfile" argumentid="EmailNotification"><label>Disable</label>
                    </td>
                </tr>
                                  <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" colspan="2" class="w-form-button-panel">
                        <div class="bgdiv">
                            <input type="button" value="  Update  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:false,Command:'FX_UPD_Users_MyProfile'}"/>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</div>
