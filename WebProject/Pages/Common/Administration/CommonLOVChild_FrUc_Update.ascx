<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonLOVChild_FrUc_Update.ascx.cs" Inherits="WebProject.Pages.Common.Administration.CommonLOVChild_FrUc_Update" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
                    <table class="w-form-table" style=" width:100% " cellspacing="2" >
                      <tr>
                            <td style="width:40%">
                                <span class="FormLabel">Name</span>  
                             
                            </td>
                            <td style="width:30%;">
                               
                             <span class="FormLabel">Code</span></td>
                            <td  style="width:30%">
                                <span class="FormLabel">Sub Child</span>  
                             
                            </td>
                        </tr>
                      <tr>
                            <td >
                            <input type="text" groupid="UpdateCommonLOVChild" argumentid="Name" style="width: 150px ;display:"
                            class="PWCTextBox required" requirederr="&amp;nbsp;*" alt="" />
                            <input type="text" groupid="UpdateCommonLOVChild" argumentid="ChildId" style="width: 150px ;display:none"
                            class="PWCTextBox required" requirederr="&amp;nbsp;*" alt="" /></td>
                            <td >
                            <input type="text" groupid="UpdateCommonLOVChild" argumentid="Code" style="width: 150px ;display:"
                            class="PWCTextBox" requirederr="&amp;nbsp;*" alt="" /></td>
                            <td  >
                            <input type="text" argumentid="SubChildName" groupid="UpdateCommonLOVChild" 
                            conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_Common_LOV_Child',ACParams:{multiple:false,width:250},QueryId:'SubChildList', minChars: 1,ArgToSet:[{Index:2,Name:'SubParentTypeId'}]}"
                             class="PWCTextBox AutoComplete">
                                                        <input type="text" groupid="UpdateCommonLOVChild" argumentid="SubParentTypeId" style="width: 150px ;display:none;"
                            class="PWCTextBox " requirederr="&amp;nbsp;*" alt="" />
                            </td>
                        </tr>
                         <tr>
                            <td >
                             <span class="FormLabel">Description</span>  
                             
                            </td>
                            <td style="" colspan="2">
                         <textarea class="PWCTextBox"  groupid="UpdateCommonLOVChild" argumentid="Description"  style="width:375px;display:"" 
                                class="PWCTextBox" cols="20" rows="3" ></textarea></td>
                        </tr>
                                                <tr>
                            <td colspan="3" style="text-align:center;" class="w-form-button-panel">
                          
                            <div class="bgdiv">
                          <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_INS_UPD_FX_Common_LOV_Child'}">
                              <input type="button" value="  Cancel  " conf="{ActionId:'HideForm'}" class="ButtonStyle WidgetAction">
                          </div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </table>


    
</div>