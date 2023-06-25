<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDProjects_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.ITSSDProjects_ShUc" %>

 <table class="w-form-table" cellspacing="2" style="width:100%">
            <tr>
                <td style=" text-align: left;" class="ftitle">
                    <span>Code</span>
                </td>
                <td style=" text-align: left;" class="ftitle">
                <span style="white-space:nowrap">Category</span></td>
                <td style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">Entity</span></td>
                <td style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Service Type</span></td>
                <td style=" text-align: left;" class="ftitle">
                    <span>Status</span></td>
                <td style=" text-align: left;">  
                    </td>
            </tr>  
            <tr>
                <td style=" text-align: left;">

                        <input type="text" class="text" 
                        argumentid="RecCode" groupid="schITSSDProjects"></td>
                <td style=" text-align: left;">
                       <select class="dropdownlist" style="width: 135px;" groupid="schITSSDProjects" argumentid="Category">
                            <option value="" selected="selected">Select Category</option>
                            <option value="0">Project</option>
							<option value="1">Change Request</option>
                            </select>
                        
                        </td>
                <td style=" text-align: left;">
                                            <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schITSSDProjects" argumentid="Entity" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'28'}]}">
                            <option value="" selected="selected">Select Entity</option>
                    </select></td>
                <td style=" text-align: left;">
                      <select loadon="FirstVisible" class="dropdownlist"   style="width: 155px;"
                            groupid="schITSSDProjects" argumentid="ServiceType" 
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'29'}]}" 
                           name="ServiceType">
                            <option value="" selected="selected">Select Service</option>
                    </select>
                   
                   </td>
                <td style=" text-align: left;">
                         <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schITSSDProjects" argumentid="State" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'31'}]}">
                            <option value="" selected="selected">Select State</option>
                    </select></td>
                <td style="text-align: left;padding-bottom:0px"> 
                <a href="javascript:void(0);"  class="search ViewButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
<a href="javascript:void(0);"  class="reset ClearButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
            </tr>
            </table>
   