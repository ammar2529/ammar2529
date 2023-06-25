<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDTasks_Efforts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.ITSSDTasks_Efforts_FrUc" %>

  <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                                                           <td width="155px" class="ftitle" valign="top">
                                                           <nobr>Entity*</nobr>
                   </td>
                                      <td width="120px" class="ftitle" valign="top">
                                      <nobr>Effort Date*</nobr>
                   </td>
                   <td width="80px" class="ftitle" valign="top">
                              <nobr>Efforts Hrs*</nobr>
                            </td>
                                <td  class="ftitle" valign="middle">
                                        <input type="checkbox" name="Flag" groupid="TaskEfforts" argumentid="Flag" />
                                        <nobr class="ftitle">Mark Important</nobr>   
                            </td>
            </tr> 
                        <tr>
                                                      <td valign="top">
                            <div style="display:none"><span groupid="TaskEfforts" argumentid="RecId"></span></div>
                                    <div style="display:none"><span groupid="TaskEfforts" argumentid="ParentRecId"></span></div>

                                          <select loadon="FirstVisible" class="dropdownlist required" requirederr="&amp;nbsp;*" style="width: 135px;"
                            groupid="TaskEfforts" argumentid="Entity" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'28'}]}">
                            <option value="" selected="selected">Select Entity</option>
                    </select>
                            </td>
                        <td valign="top">
                        <input type="text" style="width: 80px;" requirederr="&amp;nbsp;*" maxlength="10" class="text date required"
                            groupid="TaskEfforts" argumentid="EffortDate" />
                        </td>
                        <td valign="top">
                        <input type="text" style="text-align:center;font-weight:bold; color:Red;width:60px;" requirederr="&amp;nbsp;*"  maxlength="10" class="text required number"
                                    groupid="TaskEfforts" alphconf="{allow:'.'}"  argumentid="EffortHrs" />
                        </td>
                                        <td  class="ftitle" valign="middle">
             <input type="checkbox" name="WorkHome" groupid="TaskEfforts" argumentid="WorkHome" />
                         <nobr class="ftitle">Work From Home</nobr>

                            </td>
                        </tr>

                                         
            <tr>
                            <td  class="ftitle" valign="top">
                            <nobr>Comments</nobr>
                            </td>
                              <td valign="top" colspan="3">
                               <textarea class="textarea"  rows="6" wrap="1" style="width: 450px;" argumentid="Comments" groupid="TaskEfforts" ></textarea>
                            </td>
                                 
                        </tr>

                        <tr>
                            <td colspan="4" style="text-align:right">
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'UPD_ITSSD_Tasks_Efforts'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
                            </td>
                        </tr>
                    </table>

