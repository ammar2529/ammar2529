<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Roles_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.Roles_FrUc" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                                                                          <tr>
                    <td class="ftitle">
                        <nobr>Process Name*:</nobr>
                    </td>
                    <td class="ftitle">

                                  <select class="dropdownlist required"  loadoninit="true" style="width: 230px;"
                                    groupid="Roles" argumentid="MenuId" storeinfo="{StoreId:'VW_SEL_MenuName',TextCol:'MenuName',ValCol:'MenuId'}">
                                    <option value="" selected="selected">Select Process</option>
                                </select>  
                    </td>
                </tr>
                        <tr>  
                            <td style="width:25%; white-space:nowrap;" class="ftitle">Role Name*:</td>
                            <td style="width:75%">
                            <input type="text" groupid="Roles" argumentid="Name" style="width: 225px;"
                            class="text required" alt="" />
                              <div style="display: none">
                            <span groupid="Roles" argumentid="RecId"></span>
                             <span groupid="Roles" argumentid="CategoryId"></span>
                        </div>
                            </td>
                        </tr>
                          <tr>
                    <td class="ftitle">
                        <nobr>Role ID*:</nobr>
                    </td>
                    <td class="ftitle">

                               <input type="text" groupid="Roles" argumentid="RoleId" style="width: 225px;"
                            class="text required validateunique" storeid="FX_Roles" uniquenotfound="{en:' Role ID is valid...',color:'green'}"  uniquefound="{en:' Duplicate Role ID...',color:'red'}" alt="" />
                    </td>
                </tr>

                
          

                                        <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="Roles" argumentid="IsDisabled"><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="Roles" argumentid="IsDisabled"><label>Yes</label>
                    </td>
                </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_Roles'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>