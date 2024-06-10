<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_ShUc" %>

<style type="text/css">
    .auto-style1 {
        width: 296px;
    }
    .auto-style2 {
        width: 40%;
    }
</style>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span>Contract No.</span>
        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Chassis No.</span></td>
        <td style="text-align: left;" class="auto-style2" width="20%">
            <span class="ftitle"  style="white-space: nowrap">Finance Company</span><%--            <span style="white-space: nowrap">Year</span>--%></td>

        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Salesman</span></td>
    </tr>
    <tr>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="RecCode" groupid="schSalesContractDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CarNumber" groupid="schSalesContractDetails" /></td>
        <td style="text-align: left;">
            <input type="text"  class="text" argumentid="ChassisNo" groupid="schSalesContractDetails" /></td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 300px;" loadon="FirstVisible"  groupid="schSalesContractDetails" argumentid="FinanceCompany" 
                storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}">
                <option value="" selected="selected">Select Finance Company</option>
            </select>
            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                groupid="schSalesContractDetails" argumentid="CarYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select>--%></td>

        <td style="text-align: left;">
            <select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 135px;" groupid="schSalesContractDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>
            </td>
    </tr>
    <tr>

        <td colspan="5">&nbsp;
        </td>

    </tr>

    <tr>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Contract Status</span>
        </td>
        <td style="text-align: left;">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="NationalIDNo" groupid="schSalesContractDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CustomerName" groupid="schSalesContractDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="MobileTelephone1" groupid="schSalesContractDetails" />
        </td>
        <td style="text-align: left;">

            <select class="dropdownlist" style="width: 300px;"
                groupid="schSalesContractDetails" argumentid="StateId" name="D4">
                <option value="" selected="selected">Select Status</option>
                <option value="">-----------------------------</option>
                <option value="RRCCreatedState">Created - Reservation</option>
                <option value="">-----------------------------</option>
                <%--<option value="RRCContractOpen">Contract Open - Car Out</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractCreated">Contract Created</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractOpenCarIn" style="color:red">Contract Open - Car In</option>
							<option value="RRCWithLegalContractOpenCarOut" style="color:red">With Legal - Contract Open - Car Out</option>
							<option value="RRCWithLegalContractOpenCarIn" style="color:red">With Legal - Contract Open - Car In</option>
							<option value="RRCWithLegalContractClosedPendingPayment" style="color:red">With Legal - Contract Closed - Pending Payment</option>
                            <option value="RRCContractClosedPendingPayment" style="color:red">Contract Closed - Pending Payment</option>
                            <option value="">-----------------------------</option>--%>
                <option value="RRCContractClosed" style="color: Green">Contract Closed - Payment Cleared</option>
                <option value="">-----------------------------</option>
                <option value="RRCContractCancelled">Contract Cancelled</option>
                <option value="">-----------------------------</option>
            </select></td>
        <td style="text-align: left; padding-bottom: 0px; white-space: nowrap">
            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                    border="0" /></a> <a href="javascript:void(0);" class="reset ClearButton">
                        <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                            border="0" /></a>
        </td>
    </tr>
</table>
