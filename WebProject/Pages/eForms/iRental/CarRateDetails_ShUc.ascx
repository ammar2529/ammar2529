<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarRateDetails_ShUc" %>

   <table class="w-form-table" cellspacing="2" style="width:100%">
            <tr>
                <td style=" text-align: left;" class="ftitle">
                    <span>Rate Type</span>
                </td>
                <td style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">Brand</span></td>
                <td style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Model</span></td>
                <td style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Year</span></td>
                       <td style=" text-align: left;" class="ftitle">
                      <span style="white-space:nowrap">Is Disable</span></td>
                <td style=" text-align: left;" class="ftitle">
                 &nbsp;</td>
            </tr>
            <tr>
                <td style=" text-align: left;">
                    <select loadon="FirstVisible" class="dropdownlist" style="width: 125px;"
                            groupid="schCarRateDetails" argumentid="RateTypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'26'}]}">
                            <option value="" selected="selected">Select Rate Type</option>
                    </select></td>
                <td style=" text-align: left;">

                    <select loadon="FirstVisible" class="dropdownlist" style="width: 125px;"
                            groupid="schCarRateDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                            <option value="" selected="selected">Select Brand</option>
                    </select>
                        </td>
                <td style=" text-align: left;">
                       <select class="dropdownlist" style="width: 125px;"
                            groupid="schCarRateDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                            <option value="" selected="selected">Select Model</option>
                        </select></td>
                <td style=" text-align: left;">
                                    <select loadon="FirstVisible" class="dropdownlist" style="width: 125px;"
                            groupid="schCarRateDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                    </select>
                    </td>
                                        <td style=" text-align: left;">
                                                                <select class="dropdownlist" style="width:125px"  argumentid="IsDisable" 
                        groupid="schCarRateDetails">
                        <option value="" >Select Is Disable</option>
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>

</td>
                <td style="text-align: left;padding-bottom:0px">
                                <a href="javascript:void(0);"  class="search ViewButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
<a href="javascript:void(0);"  class="reset ClearButton"><img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
</td>
            </tr>
             </table>