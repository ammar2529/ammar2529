<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GRG_CarServiceDetails_Car_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GRG_CarServiceDetails_Car_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Chassis No.</span>--%>
            <span style="white-space: nowrap">Car No.</span>
        </td>
        <td style="text-align: left;" class="ftitle">
       <span style="white-space: nowrap">Chassis No.</span>

            <%--<span style="white-space: nowrap">Car No.</span>--%>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Brand</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Model</span></td>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle">
           
            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle"></td>
    </tr>
    <tr>
        <td style="text-align: left;">
                        <input type="text" style="width: 115px;" class="text" argumentid="CarNumber" groupid="schCarServiceDetailsCarSearch" />
<%--            <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo" groupid="schCarServiceDetailsCarSearch" />--%>

        </td>
        <td style="text-align: left;">

<%--            <input type="text" style="width: 115px;" class="text" argumentid="CarNumber" groupid="schCarServiceDetailsCarSearch" />--%>
                        <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo" groupid="schCarServiceDetailsCarSearch" />

        </td>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                groupid="schCarServiceDetailsCarSearch" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>
        </td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 120px;"
                groupid="schCarServiceDetailsCarSearch" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                <option value="" selected="selected">Select Model</option>
            </select></td>
        <td style="text-align: left;">
               
  

            <input type="text" style="width: 115px;" class="text"  argumentid="MobileTelephone1" groupid="schCarServiceDetailsCarSearch" />
        </td>
        <td style="text-align: left;">


            <input type="text" style="width: 115px;" class="text" argumentid="NationalIDNo" groupid="schCarServiceDetailsCarSearch" />

        </td>
        <td style="text-align: left; padding-bottom: 0px">

            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>

            <a href="javascript:void(0);" class="ClosePopup CloseLOVPopup">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/Close.gif" border="0" /></a>

        </td>
    </tr>
</table>