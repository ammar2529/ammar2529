<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.ascx.cs" Inherits="WebProject.Pages.Common.ChangePassword" %>

<table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 20px;
        padding-right: 20px; padding-bottom: 10px; padding-top: 5px;" class="form">
        <tbody>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr>
                                <td class="">
                                    <h2>
                                        Change Password</h2>
                                </td>
                            </tr>
                        </tbody> 
                    </table>
                </td>
            </tr>
            <tr>  
                <td>
                    <img height="5" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                </td> 
            </tr>
            <tr>
                <td style="background-image: url(App_Themes/eForms_Theme/Images/i/hdiv.gif); background-repeat: repeat-x">
                    <img src="App_Themes/eForms_Theme/Images/hdiv.gif">
                </td>
            </tr>
            <tr id="trNote">
                <td style="padding-bottom:5px">
                     <nobr>Use the form below to change password, fields marked with an asterisk (*) are mandatory</nobr>
                    <br>
                    <br>
                </td>
            </tr>
            <tr id="trDetails">
                <td>
                    <!-- INNER CONTENT BEGIN -->
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ftitle">
                                <nobr>Password*:</nobr>
                            </td>
                            <td>
                                <img height="28" src="App_Themes/eForms_Theme/Images/spacer.gif" width="25">
                            </td>
                            <td width="100%">
                                <asp:TextBox ID="Password" runat="server" name="Password" groupid="ChangePassword"
                                    MaxLength="16" Width="110px" class="text required" argumentid="Password"
                                    InputFormate="NoofChars" minlen="4" TextMode="Password" confirmid='ConfirmPassword' ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Confirm Password*:</nobr>
                            </td>
                            <td>
                                <img height="28" src="App_Themes/eForms_Theme/Images/spacer.gif" width="25">
                            </td>
                            <td width="100%">
                                <input type="Password" name="ConfirmPassword" id="ConfirmPassword" textmode="Password"
                                     minlen="4" maxlength="16" style="width:110px" class="text required" confirmpassid='ConfirmPassword' argumentid="ConfirmPassword"  />
                            </td>
                        </tr>
                       
                        <tr> 
                            <td colspan="3">
                                <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td>
                                <a id="btnUpdate" class="DataAction button-update" conf="{ActorId:'Authentication',ActionId:'ChangePassword',Command:'FX_UPD_ChangePassword',ShowActionMsg:false}" href="javascript:void(0);">
                                      <img alt="" height="30px" width="78px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>  
                            </td>
                        </tr>
                    </table>
                    <!-- INNER CONTENT END -->
                </td>
            </tr>

        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" width="100%" border="0" style="display:none;padding-left: 20px;
        padding-right: 20px; padding-bottom: 10px; padding-top: 5px;"  class="OnSuccess">
                <tr  >
                <td>
                           <br />
                <b> <span>Password Changed Successfully</span></b>
                    <br />
                    <br />
                </td>
            </tr>
    </table>