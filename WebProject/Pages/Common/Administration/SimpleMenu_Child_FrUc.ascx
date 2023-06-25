<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleMenu_Child_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.SimpleMenu_Child_FrUc" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                        <tr>
                            <td style="width:25%; white-space:nowrap;" class="ftitle">Menu Name:</td>
                            <td style="width:75%">
                            <input type="text" groupid="SimpleMenuChild" argumentid="MenuName" style="width: 225px;"
                            class="text required" alt="" />
                              <div style="display: none">
                            <span groupid="SimpleMenuChild" argumentid="MenuId"></span>
                             <span groupid="SimpleMenuChild" argumentid="ParentMenuId"></span>
                        </div>
                            </td>
                        </tr>

                                                <tr>
                    <td class="ftitle">
                        <nobr>Show Widget:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="SimpleMenuChild" argumentid="ShowWidget" style="width: 225px;"
                            class="text required" alt="" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Role*:</nobr>
                    </td>
                    <td class="ftitle">

                                  <select class="dropdownlist required" style="width: 230px;"
                                    groupid="SimpleMenuChild" argumentid="RoleId" storeinfo="{Command:'FX_SEL_SimpleMenu_Role_LOV',TextCol:'Name',ValCol:'RoleId',Params:[{Name:'MenuId'}]}">
                                    <option value="" selected="selected">Select Role</option>
                                </select>  
                    </td>
                </tr>

                                        <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="SimpleMenuChild" argumentid="IsDisabled"><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="SimpleMenuChild" argumentid="IsDisabled"><label>Yes</label>
                    </td>
                </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_SimpleMenu_Child'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>