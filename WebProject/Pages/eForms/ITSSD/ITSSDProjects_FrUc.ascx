<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDProjects_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.ITSSDProjects_FrUc" %>

 <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
          
                     <tr>
                            <td class="ftitle">
                                <nobr>Code:</nobr>
                            </td>
                            <td width="100%"> 

                               <div style="display:none"><span groupid="ITSSDProjects" argumentid="RecId"></span></div>
                                    <div><span groupid="ITSSDProjects" argumentid="RecCode" style="font-weight:bold">New Code will be generated on saving</span></div>
                            </td> 
                        </tr>


                         
                                                   <tr>
                            <td class="ftitle">  
                                <nobr>Category*:</nobr>
                            </td>
                            <td>
                             <div style="width:296px; float:left">
                            <select class="dropdownlist required" style="width: 155px;" groupid="ITSSDProjects" argumentid="Category">
                            <option value="" selected="selected">Select Category</option>
                            <option value="0">Project</option>
							<option value="1">Change Request</option>
                            </select>
                            </div><div style="float:left"><nobr class="ftitle" style="padding-right:10px;font-style:italic; color:red">Reference No:</nobr>
                            <input type="text" style="text-align: center; font-weight:bold; color:Red; width: 150px;" maxlength="50" class="text alphanumericspacedot"
                            groupid="ITSSDProjects" argumentid="ReferenceNo" /></div>
                            </td>
                        </tr>

                        
                              <tr>
                            <td class="ftitle">
                                <nobr>Entity*:</nobr>
                            </td>
                            <td>
                    <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="ITSSDProjects" argumentid="Entity" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'28'}]}">
                            <option value="" selected="selected">Select Entity</option>
                    </select>
                            </td>
                        </tr>

                                           <tr>
                            <td class="ftitle" style="padding-right:40px">
                                <nobr>Service Type*:</nobr>
                            </td>
                            <td>
                            <div style="width:177px; float:left">
                      <select loadon="FirstVisible" class="dropdownlist required"   requirederr="&amp;nbsp;*"  style="width: 155px;"
                            groupid="ITSSDProjects" argumentid="ServiceType" childcombo="ProjectName" 
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'29'}]}" 
                           name="ServiceType">
                            <option value="" selected="selected">Select Service</option>
                    </select>
                     </div><div style="float:left"><nobr class="ftitle" style="padding-right:10px;font-style:italic; color:red">Project Name*:</nobr>
                      <select class="dropdownlist required" style="width: 265px;"
                            groupid="ITSSDProjects" argumentid="ProjectName" 
                                        storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'30'},{SPParamName:'SubParentTypeId',Name:'ServiceType'}]}" 
                                        name="ProjectName">
                            <option value="" selected="selected">Select Project</option>
                        </select>
                     </div>
                            </td>
                        </tr>


                              <tr>
                            <td class="ftitle">
                                <nobr>Title*:</nobr>
                            </td>
                            <td>
                           <input type="text" style="width: 550px;" maxlength="255" class="text required alphanumericspacedot"
                            groupid="ITSSDProjects" argumentid="ProjectTitle" />
                            </td>
                        </tr>

                           <tr>
                            <td class="ftitle" valign="top">
                                <nobr>Description*:</nobr>
                            </td>
                            <td>
                               <textarea class="textarea required"  rows="6" wrap="1" style="width: 550px;" argumentid="ProjectDescription" groupid="ITSSDProjects" ></textarea>
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
                                          <select class="dropdownlist required" style="width: 115px;" groupid="ITSSDProjects" argumentid="Priority">
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
                                    groupid="ITSSDProjects"  argumentid="Estimates" />

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
                            groupid="ITSSDProjects" argumentid="PlannedStartDate" />
                                                    <input type="text" style="width: 110px;" maxlength="10" class="text date"
                            groupid="ITSSDProjects" argumentid="PlannedEndDate" />

                            <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="64">
                             <span class="smalltext" style="padding-left:10px;padding-right:27px;"><b><i>Given By:</i></b></span>
                    
                            <input type="text" style="width: 195px;" maxlength="50" class="text alphanumericspacedot"
                            groupid="ITSSDProjects" argumentid="GivenBy" />

                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Actual:</nobr>
                    </td>
                    <td>

                                                                    <input type="text" style="width: 110px;" maxlength="10" class="text date"
                            groupid="ITSSDProjects" argumentid="ActualStartDate" />
                                                    <input type="text" style="width: 110px;" maxlength="10" class="text date"
                            groupid="ITSSDProjects" argumentid="ActualEndDate" />
   
                             <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="64">
                             <span class="smalltext" style="padding-left:10px;padding-right:10px;"><b><i>Assigned To:</i></b></span>
                    
                            <select class="dropdownlist" style="width: 200px;" groupid="ITSSDProjects" argumentid="AssignedTo">
                            <option value="" selected="selected">Select Project Manager</option>
                            <option value="aahmedmirza">Asif Mirza</option>
                            <option value="gsrinivasan">Gopinath Srinivasan</option>
                             <option value="safzal">Sameer Afzal</option>
                              <option value="skumarvenkat">Suresh Kumar Venkat</option>
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

                                       <select loadon="FirstVisible" class="dropdownlist required"  requirederr="&amp;nbsp;*" style="width: 155px;"
                            groupid="ITSSDProjects" argumentid="State" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'31'}]}">
                            <option value="" selected="selected">Select State</option>
                    </select>

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
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_ITSSD_Projects',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>

                                 <tr class="OnLoadHide">
                            <td class="ftitle" colspan="2" style="padding-right:20px; text-align:right">
                                <nobr>Created By</nobr>&nbsp;&nbsp;<span class="ftitle" style="font-style:italic; color:Red " groupid="ITSSDProjects" argumentid="CreatedBy"></span>&nbsp;&nbsp;On&nbsp;&nbsp;<span class="ftitle" groupid="ITSSDProjects" style="font-style:italic; color:Red " argumentid="DateCreated"></span></td>
                        </tr>
                    </table>
