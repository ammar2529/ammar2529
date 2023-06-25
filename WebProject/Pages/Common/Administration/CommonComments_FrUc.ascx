<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonComments_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.CommonComments_FrUc" %>

 <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                   <td width="75%" class="ftitle" valign="top">
                              <nobr>Comments</nobr>
                            </td>
                              <td width="25%" class="ftitle" valign="top">
                              <nobr></nobr>
                            </td> 
            </tr>
                        <tr>
                              <td valign="top">
                            <div style="display:none"><span groupid="CommonComments" argumentid="RecId"></span></div>
                                    <div style="display:none"><span groupid="CommonComments" argumentid="ModuleId"></span></div>
                                    <div style="display:none"><span groupid="CommonComments" argumentid="ModuleRecId"></span></div>
                              <textarea class="textarea" rows="6" wrap="1" cols="100" argumentid="Comments" groupid="CommonComments" ></textarea>
                            </td> 
                                        <td  class="ftitle" valign="top">

                                         <input type="checkbox" name="Flag" groupid="CommonComments" argumentid="Flag" />
                                        <nobr class="ftitle">Mark Important</nobr>    
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:right">
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_Common_Comments'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
                            </td>
                        </tr>
                    </table>
