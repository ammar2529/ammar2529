<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.GarageCarServiceDetails_ShUc" %>
<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <%-- <td style=" text-align: left;" class="ftitle">
                    <span>Car For</span>
                </td>--%>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Service No.</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Engine No.</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Recived Date</span></td>
        <td style="text-align: left;" class="ftitle">
            Last Service Date</td>
        <%--<td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Location</span></td>--%>
        <td style="text-align: left;" class="ftitle">
            <span>Car Dilverd Date</span></td>
        <td style="text-align: left;" class="ftitle">
            </td>

    </tr>
    <tr>
        <%--    <td style=" text-align: left;">

                        <select class="dropdownlist" style="width:120px"  argumentid="CarFor" 
                         groupid="schCarServiceDetails" name="D1">
                            <option value="Rental">For Sale</option>
                       
                    </select>

                </td>--%>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="ServiceNo"  groupid="schCarServiceDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text" style="width: 115px;" class="text" argumentid="EngineNo"  groupid="schCarServiceDetails" /></td>
        <td style="text-align: left;">
            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarRecivedDate" />
        </td>
        <td style="text-align: left;">
            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="LastServiceDate" />

        </td>
       <%-- <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarServiceDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                <option value="" selected="selected">Select Location</option>
            </select>
        </td>--%>
        <td style="text-align: left;">

            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarDeliverdDate" />
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
            <%--<span style="white-space: nowrap">Car No.</span>--%></td>

        <td style="text-align: left;" class="ftitle">
            <%--<span style="white-space: nowrap">Car Type</span>--%></td>
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
                        <input type="hidden"  value="SearchChassisNo" groupid="schCarServiceDetails" argumentid="SearchChassisN" />
            <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo"  groupid="schCarServiceDetails" /></td>
        <td style="text-align: left;">

            <%--<input type="text" style="width: 115px;" class="text" argumentid="CarNumber"  groupid="schCarServiceDetails" />--%></td>
        <td style=" text-align: left;">

            <%--<select class="dropdownlist" style="width:120px" argumentid="CarType"  groupid="schCarServiceDetails" name="D1">
                        <option value="" >Select Car Type</option>
                        <option value="N">New Car</option>
                         <option value="U">Used Car</option>
                        
                    </select>--%>

        </td>
        <td style="text-align: left;">
            <%--<input type="text" style="width: 115px;" class="text number" argumentid="NormalInsuranceExpiryDays"  groupid="schCarServiceDetails"/>--%>

        </td>
        <td style="text-align: left;">
            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarServiceDetails" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                <option value="" selected="selected">Select Insurance</option>
            </select>--%>

        </td>
        <td style="text-align: left;">
<%--            <input type="text" style="width: 115px;" class="text number" argumentid="FullInsuranceExpiryDays"  groupid="schCarServiceDetails">--%>

        </td>
        <td style="text-align: left; padding-bottom: 0px">
            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" />
            </a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" />
            </a>
        </td>
    </tr>
</table>