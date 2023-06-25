<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDTasks_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.ITSSDTasks_ShUc" %>

 <table class="w-form-table" cellspacing="2" style="width:100%">
            <tr>
                <td width="23%" style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">Assigned To</span></td>
                
                <td width="23%" style=" text-align: left;" class="ftitle">
                <span style="white-space:nowrap">Category</span></td>
                <td width="18%" style=" text-align: left;" class="ftitle">
                    <span>Code</span>
                </td>
                <td width="18%" style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Task Title</span></td>
                <td width="18%" style=" text-align: left;" class="ftitle">
                    <span>Status</span></td>

            </tr>  
            <tr>
                <td style=" text-align: left;">
                                           
                    <select loadon="FirstVisible" class="dropdownlist" style="width: 170px;"
                            groupid="schITSSDTasks" argumentid="AssignedTo"
                            storeinfo="{Command:'SEL_ITSSD_Tasks_TM_LOV',TextCol:'Name',ValCol:'TeamUserId'}"
                           name="AssignedTo">
                            <option value="" selected="selected">Select Team Member</option>
                    </select>

                        </td>
                
                <td style=" text-align: left;">

                    <select loadon="FirstVisible" class="dropdownlist" style="width: 170px;"
                            groupid="schITSSDTasks" argumentid="Category"
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'32'}]}" 
                           name="Category">
                            <option value="" selected="selected">Select Category</option>
                    </select>
   
                 </td>
                 <td style=" text-align: left;"> 

                        <input type="text" class="text" 
                        argumentid="RecCode" groupid="schITSSDTasks"></td>
                <td style=" text-align: left;">
                          <input type="text" class="text" 
                        argumentid="TaskTitle" groupid="schITSSDTasks">
                         </td>
                <td style=" text-align: left;">
                 <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schITSSDTasks" argumentid="State"
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'33'}]}" 
                           name="State">
                            <option value="" selected="selected">Select State</option>
                    </select>
                    
                    </td>
                
            </tr>
            <tr>
                <td style=" text-align: left;" class="ftitle">
                    <span>From</span><img alt="" height="1px" width="63px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /><span>To Date</span>
                </td>
                <td style=" text-align: left;" class="smalltext" colspan="2">
                 <span><b><i>Quick Date Selector</i></b></span>
                </td>
                <td style=" text-align: left;" class="ftitle">
                      </td>
                <td style=" text-align: left;" class="ftitle">
                    </td>

            </tr>
            <tr>
                <td style=" text-align: left;"> 
                        <input type="text" style="width: 70px;"  maxlength="10" class="text date"
                            groupid="schITSSDTasks" argumentid="FromDate" />
                              <input type="text" style="width: 70px;"  maxlength="10" class="text date"
                            groupid="schITSSDTasks" argumentid="ToDate" />
                       </td>
                <td style=" text-align: left;" class="ftitle" colspan="2">
                    <input type="radio" value="0" name="SmartDate" groupid="schITSSDTasks" argumentid="SmartDate" /><label  class="smalltext"><b>Yesterday</b></label>
                    <input type="radio" value="1" name="SmartDate" groupid="schITSSDTasks" argumentid="SmartDate" /><label  class="smalltext"><b>Today</b></label>
                    <input type="radio" value="2" name="SmartDate" groupid="schITSSDTasks" argumentid="SmartDate" /><label  class="smalltext"><b>Week</b></label>
                    <input type="radio" value="3" name="SmartDate" groupid="schITSSDTasks" argumentid="SmartDate" /><label  class="smalltext"><b>Month</b></label>
                             </td>
                <td style=" text-align: left;">
                </td>

                               <td style="text-align: left;padding-bottom:0px"> 
                <a href="javascript:void(0);"  class="search ViewButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
<a href="javascript:void(0);"  class="reset ClearButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
            </tr>
            </table>
   