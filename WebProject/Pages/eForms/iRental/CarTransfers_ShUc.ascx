<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarTransfers_ShUc" %>

 <table class="w-form-table" cellspacing="2" style="width:100%">
            
            <tr>
                <td style=" text-align: left;" class="ftitle">
                <span style="white-space:nowrap">Car No.</span></td>
                <td style=" text-align: left;" class="ftitle">

                <span style="white-space:nowrap">Out Location</span></td>
                <td style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">In Location</span></td>
                <td style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Driver</span></td>
                <td style=" text-align: left;">

                    &nbsp;</td>
            </tr>
            <tr>
                <td style=" text-align: left;">

                 <input type="text" style="width: 125px;" class="text" argumentid="CarNumber" groupid="schCarTransfers"></td>
                <td style=" text-align: left;">

                  <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schCarTransfers" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>
                    
                    
                    </td>
                <td style=" text-align: left;">
                         <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schCarTransfers" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>
                 
                 </td>
                <td style=" text-align: left;">
                       
                                                <select loadon="FirstVisible" class="dropdownlist" style="width: 175px;"
                            groupid="schCarTransfers" argumentid="DriverId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'27'}]}">
                            <option value="" selected="selected">Select Driver</option>
                    </select>
                       
                       </td>
                <td style="text-align: left;padding-bottom:0px">
                                <a href="javascript:void(0);"  class="search ViewButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
<a href="javascript:void(0);"  class="reset ClearButton"><img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
            </tr>
            </table>