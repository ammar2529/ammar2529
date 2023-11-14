<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <%-- <td style=" text-align: left;" class="ftitle">
                    <span>Car For</span>
                </td>--%>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Brand</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Model</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Year</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Type</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Location</span></td>
        <td style="text-align: left;" class="ftitle">
            <span>Status</span></td>
        <td style="text-align: left;" class="ftitle">
            </td>

    </tr>
    <tr>
        <%--    <td style=" text-align: left;">

                        <select class="dropdownlist" style="width:120px"  argumentid="CarFor" 
                         groupid="schCarForSalesDetails" name="D1">
                            <option value="Rental">For Sale</option>
                       
                    </select>

                </td>--%>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>
        </td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                <option value="" selected="selected">Select Model</option>
            </select></td>
        <td style="text-align: left;">
            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select>
        </td>
        <td style="text-align: left;">
            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                <option value="" selected="selected">Select Type</option>
            </select>

        </td>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                <option value="" selected="selected">Select Location</option>
            </select>
        </td>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'9'}]}">
                <option value="" selected="selected">Select Status</option>
            </select>
        </td>
           <td style="text-align: left;">

            </td>
    </tr>
    <tr>

        <td colspan="7">&nbsp;
        </td>

    </tr>

    <tr>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">Chassis No.</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car No.</span></td>

        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Type</span></td>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Expiry (Days)</span>--%>

        </td>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Full Insurance</span>--%>
        </td>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Expiry (Days)</span>--%>

        </td>
        <td style="text-align: left;">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="CarNumber"  groupid="schCarForSalesDetails" /></td>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo"  groupid="schCarForSalesDetails" /></td>
        <td style=" text-align: left;">

            <select class="dropdownlist" style="width:120px" argumentid="CarType"  groupid="schCarForSalesDetails" name="D1">
                        <option value="" >Select Car Type</option>
                        <option value="N">New Car</option>
                         <option value="U">Used Car</option>
                        
                    </select>

        </td>
        <td style="text-align: left;">
            <%--<input type="text" style="width: 115px;" class="text number" argumentid="NormalInsuranceExpiryDays"  groupid="schCarForSalesDetails"/>--%>

        </td>
        <td style="text-align: left;">
            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                <option value="" selected="selected">Select Insurance</option>
            </select>--%>

        </td>
        <td style="text-align: left;">
<%--            <input type="text" style="width: 115px;" class="text number" argumentid="FullInsuranceExpiryDays"  groupid="schCarForSalesDetails">--%>

        </td>
        <td style="text-align: left; padding-bottom: 0px">
            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
    </tr>
</table>
