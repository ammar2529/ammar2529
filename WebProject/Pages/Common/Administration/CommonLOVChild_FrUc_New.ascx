<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonLOVChild_FrUc_New.ascx.cs" Inherits="WebProject.Pages.Common.Administration.CommonLOVChild_FrUc_New" %>

<div style="background:#EEEEFF;">
   <table class="w-form-table" cellspacing="2" >
                      <tr>
                            <td style="width:33%">
                                <span class="FormLabel">Name</span>  
                             
                            </td>
                            <td style="width:33%;">
                               
                             <span class="FormLabel">Code</span></td>
                            <td  style="width:33%">
                                <span class="FormLabel">Sub Child</span>  
                             
                            </td>
                        </tr>
                      <tr>
                            <td >
                           <input type="text" groupid="NewCommonLOVChild" argumentid="Name" style="width: 150px ;display:"
                            class="PWCTextBox required" requirederr="&amp;nbsp;*" alt="" /></td>
                            <td >
                            <input type="text" groupid="NewCommonLOVChild" argumentid="Code" style="width: 150px ;display:"
                            class="PWCTextBox" requirederr="&amp;nbsp;*" alt="" /></td>
                            <td  >
                                                            <input type="text" argumentid="SubChildName" groupid="NewCommonLOVChild" 
                            conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_Common_LOV_Child',ACParams:{autoFill: false,multiple:false,width:250},QueryId:'SubChildList', minChars: 1,ArgToSet:[{Index:2,Name:'SubParentTypeId'}]}"
                             class="PWCTextBox AutoComplete">
                                                        <input type="text" groupid="NewCommonLOVChild" argumentid="SubParentTypeId" style="width: 150px ;display:none"
                            class="PWCTextBox " requirederr="&amp;nbsp;*" alt="" />
                             <input type="text" groupid="NewCommonLOVChild" argumentid="ParentTypeId" style="width: 150px ;display:none"
                            class="PWCTextBox " requirederr="&amp;nbsp;*" alt="" />
                            </td>
                        </tr>
                         <tr>
                            <td >
                             <span class="FormLabel">Description</span>  
                             
                            </td>
                            <td style="" colspan="2">
                         <textarea class="PWCTextBox"  groupid="NewCommonLOVChild" argumentid="Description"  style="width:375px; display:" 
                                class="PWCTextBox required" cols="20" rows="3"  requirederr="&amp;nbsp;*"   ></textarea></td>
                        </tr>
                                                <tr>
                            <td colspan="3" style="text-align:center;"  class="w-form-button-panel">
                          
                            <div class="bgdiv">
                          <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_INS_UPD_FX_Common_LOV_Child'}">
                              <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                          </div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </table>


    
</div>