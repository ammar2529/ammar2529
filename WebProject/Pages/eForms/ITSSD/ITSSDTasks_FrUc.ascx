<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDTasks_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.ITSSDTasks_FrUc" %>

 <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
          
                     <tr>
                            <td class="ftitle">
                                <nobr>Task Code:</nobr> 
                            </td>
                            <td width="100%">

                               <div style="display:none"><span groupid="ITSSDTasks" argumentid="RecId"></span></div>
                                    <div><span groupid="ITSSDTasks" argumentid="RecCode" style="font-weight:bold">New Task ID will be generated on saving</span></div>
                            </td> 
                        </tr>
                         


                                                   <tr>
                            <td class="ftitle"> 
                                <nobr>Category*:</nobr> 
                            </td> 
                            <td>
                                     <select loadon="FirstVisible" class="dropdownlist required" style="width: 175px;"
                            groupid="ITSSDTasks" argumentid="Category" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'32'}]}">
                            <option value="" selected="selected">Select Category</option>
                    </select>

                            </td>
                        </tr>

                                                      <tr>
                            <td class="ftitle" style="font-style:italic; color:red">
                                <nobr>Project Code:</nobr>
                            </td>
                            <td>
                          <input type="text" style="text-align: center; font-weight:bold; color:Red; width: 170px;" maxlength="50" class="text AutoComplete"
                            groupid="ITSSDTasks" argumentid="ReferenceNo" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_AutoComplete',QueryId:'Projects_Tasks',ACParams:{minChars:2,mustMatch:true,autoFill:false,width:725}}"/>
                        
                         <span class="smalltext" style="padding-left:10px;padding-right:10px;"><b><i>Fill to link this task to a Project or Change Request...</i></b></span>
                        </td>
                        </tr>

                              <tr>
                            <td class="ftitle">
                                <nobr>Task Title*:</nobr>
                            </td>
                            <td>
                           <input type="text" style="width: 550px;" maxlength="255" class="text required alphanumericspacedot"
                            groupid="ITSSDTasks" argumentid="TaskTitle" />
                            </td>
                        </tr>

                           <tr>
                            <td class="ftitle" valign="top">
                                <nobr>Title Description*:</nobr>
                            </td>
                            <td>
                               <textarea class="textarea required"  rows="6" wrap="1" style="width: 550px;" argumentid="TaskDescription" groupid="ITSSDTasks" ></textarea>
                            </td>
                        </tr>

                                 <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                                                 <tr>
                            <td class="ftitle" valign="top">
                                <nobr>Priority*:</nobr>
                            </td>
                            <td>
                                          <select class="dropdownlist required" style="width: 115px;" groupid="ITSSDTasks" argumentid="Priority">
                            <option value="" selected="selected">Select Priority</option>
                            <option value="L">Low</option>
                            <option value="M">Medium</option>
							<option value="H">High</option>
                            </select>
                            </td>
                        </tr>
                        
                                                 <tr>
                            <td class="ftitle" valign="top">
                                <nobr>Estimates:</nobr>
                            </td>
                            <td>
                                                              <input type="text" style="text-align:center;font-weight:bold; color:Red;width:110px;"  maxlength="10" class="text number"
                                    groupid="ITSSDTasks"  argumentid="Estimates" />

                                     <span class="smalltext" style="padding-left:10px;padding-right:10px;"><b><i>Enter Estimates as Total Hours Required...</i></b></span>
                            </td>
                        </tr>

                               <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                    </td>
                    <td>
                         <nobr class="ftitle">Start Date</nobr>
                        <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="64">
                        <nobr class="ftitle">End Date</nobr>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Planned:</nobr>
                    </td>
                    <td>
                                  <input type="text" style="width: 110px;" maxlength="10" class="text date"
                            groupid="ITSSDTasks" argumentid="PlannedStartDate" />
                                                    <input type="text" style="width: 110px;" maxlength="10" class="text date"
                            groupid="ITSSDTasks" argumentid="PlannedEndDate" />

                            <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="64">
                             <span class="smalltext" style="padding-left:10px;padding-right:8px;"><b><i>Assigned By*:</i></b></span>
                    

                                <select loadon="FirstVisible" class="dropdownlist" style="width: 200px;"
                            groupid="ITSSDTasks" argumentid="AssignedBy"
                            storeinfo="{Command:'SEL_ITSSD_Tasks_TL_LOV',TextCol:'Name',ValCol:'TeamLeadId'}"
                           name="AssignedBy">
                            <option value="" selected="selected">Select Assigned By</option>
                              </select>



                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                       
                    </td>
                    <td>

                             <input type="checkbox" name="Monthly" groupid="ITSSDTasks" argumentid="Monthly" />
                             <nobr class="ftitle">Monthly Operational Task</nobr>
                            
                             <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="145">
                             <span class="smalltext" style="padding-left:10px;padding-right:10px;"><b><i>Assigned To*:</i></b></span>
                   

                    <select loadon="FirstVisible" class="dropdownlist" style="width: 200px;"
                            groupid="ITSSDTasks" argumentid="AssignedTo"
                            storeinfo="{Command:'SEL_ITSSD_Tasks_TM_LOV',TextCol:'Name',ValCol:'TeamUserId'}"
                           name="AssignedTo">
                            <option value="" selected="selected">Select Team Member</option>
                    </select>

                    </td>
                </tr>      

                               <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                              <tr>
                    <td class="ftitle">
                        <nobr>Status*:</nobr>
                    </td>
                    <td>

                     <div style="width:177px; float:left">
                                                 <select loadon="FirstVisible" class="dropdownlist required"  requirederr="&amp;nbsp;*" style="width: 155px;"
                            groupid="ITSSDTasks" argumentid="State" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'33'}]}">
                            <option value="" selected="selected">Select State</option>
                    </select>
                    </div><div style="float:left"><nobr class="smalltext" style="padding-right:10px;font-style:italic;"><b>Comments:</b></nobr>

                            <input type="text" style="width: 388px;" maxlength="255" class="text alphanumericspacedot"
                            groupid="ITSSDTasks" argumentid="Comments" />
                            </div>
                    </td>
                </tr>   
        
                                       
                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td>
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_ITSSD_Tasks',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>

                                 <tr class="OnLoadHide">
                            <td class="ftitle" colspan="2" style="padding-right:20px; text-align:right">
                                <nobr>Task Created By</nobr>&nbsp;&nbsp;<span class="ftitle" style="font-style:italic; color:Red " groupid="ITSSDTasks" argumentid="CreatedBy"></span>&nbsp;&nbsp;On&nbsp;&nbsp;<span class="ftitle" groupid="ITSSDTasks" style="font-style:italic; color:Red " argumentid="DateCreated"></span></td>
                        </tr>
                    </table>