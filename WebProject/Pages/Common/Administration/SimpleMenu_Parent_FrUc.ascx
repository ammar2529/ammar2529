<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleMenu_Parent_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.SimpleMenu_Parent_FrUc" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                        <tr>
                            <td style="width:25%; white-space:nowrap;" class="ftitle">Menu Name:</td>
                            <td style="width:75%">
                            <input type="text" groupid="SimpleMenuParent" argumentid="MenuName" style="width: 225px;"
                            class="text required" alt="" />
                              <div style="display: none">
                            <span groupid="SimpleMenuParent" argumentid="MenuId"></span>
                        </div>
                            </td>
                        </tr>

                                        <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="SimpleMenuParent" argumentid="IsDisabled"><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="SimpleMenuParent" argumentid="IsDisabled"><label>Yes</label>
                    </td>
                </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_SimpleMenu_Parent'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>