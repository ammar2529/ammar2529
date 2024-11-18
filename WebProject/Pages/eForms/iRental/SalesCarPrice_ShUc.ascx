<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesCarPrice_ShUc" %>

<table class="w-form-table" cellspacing="0" style="width: 100%">
    <tr>
        <%-- <td style=" text-align: left;" class="ftitle">
            <span>Car For</span>
        </td>--%>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Brand</span>

        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Model</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Year</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Type</span></td>
        <td style="text-align: left;" class="ftitle">
            <%--  <span style="white-space:nowrap">Car Location</span>--%>

        </td>
       <%-- <td></td>--%>

        <%--  <td style=" text-align: left;" class="ftitle">
            <span>Status</span></td>--%>
    </tr>
    <tr>
        <%-- <td style=" text-align: left;">

            <select class="dropdownlist" style="width:120px" argumentid="CarFor"  groupid="schCarForSalesDetails" name="D1">
                        <option value="" >Select Car For</option>
                        <option value="Rental">Sale</option>
                        
                    </select></td>--%>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>
        </td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 120px;" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                <option value="" selected="selected">Select Model</option>
            </select></td>
        <td style="text-align: left;">
            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;" groupid="schCarForSalesDetails" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select>
        </td>
        <td style="text-align: left;">
            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;" groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                <option value="" selected="selected">Select Type</option>
            </select>

        </td>
      <%--  <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"  groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>
        </td>--%>

         <td style="text-align: center; padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
    <!-- View Button -->
    <a href="javascript:void(0);" class="search ViewButton">
        <img alt="View" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0">
    </a>

    <!-- Clear Button -->
    <a href="javascript:void(0);" class="reset clearCheck ClearButton">
        <img alt="Clear" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" style="height: 22px">
    </a>
</td>
    </tr>


  
</table>
