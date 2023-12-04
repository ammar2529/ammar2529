<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" TagPrefix="AW" TagName="CustomerDetails_FrUc" %>





<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
<style type="text/css">
    .auto-style1 {
        height: 2px;
    }

    .auto-style2 {
        width: 31%;
    }
</style>
<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">
    <tr>
        <td style="padding-top: 0px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="SalesContractDetails">
                    <div>Contract Details </div>
                </li>
                <li tabid="SalesPaymentDetails" style="border-right: 1px solid #8298B0;">
                    <div>Payment Details </div>
                </li>

            </ul>
        </td>
    </tr>
    <tr tabid="SalesContractDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>
                <tr>
                    <td colspan="4" class="auto-style1" style="display:none">
                        <%--<span class="ftitle" style="color: red;" groupid="SalesContractsForm" argumentid="RecCode"></span>--%>
                        <input type="hidden" groupid="SalesContractsForm" argumentid="RecCode" />
                    </td>
                </tr>
                <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Payment Method*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class=" cash" checked="checked" default="default" value="Cash" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod" /><label>Cash</label>
                        <input type="radio" class="CommonDisable finance" value="Finance" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod" /><label>Finance </label>
                        <%-- CommonDisable default="default" --%>
                    </td>
                    <td class="ftitle lb">
                        <nobr>Finance Company*:</nobr>
                    </td>
                    <td>

                        <%--   <select class="financeCompany " loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}">
                <option value="" selected="selected">Select Finance Company</option>
            </select>--%>
                        <select loadon="FirstVisible" no-enable-on-values-loaded="true" class="dropdownlist required financeCompany" style="width: 155px;" groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}">
                            <option value="" selected="selected">Select Finance Company</option>
                        </select>


                    </td>
                </tr>
                <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Car Type*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="CommonDisable" default="default" value="N" name="CarType" groupid="SalesContractsForm" argumentid="CarType" /><label>New Car</label>
                        <input type="radio" class="CommonDisable" value="U" name="CarType" groupid="SalesContractsForm" argumentid="CarType" /><label>Used Car</label>



                    </td>
                    <td></td>
                    <td></td>
                </tr>


                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Chassis Number:*</nobr>
                    </td>
                    <td class="auto-style2">
                        <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />

                        <div style="display: none">
                            <span groupid="SalesContractsForm" argumentid="RecId1"></span>
                            <span groupid="SalesContractsForm" argumentid="StateId"></span>


                        </div>
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                                groupid="SalesContractsForm" lovpopupid="carPopup" argumentid="ChassisNo" />
                        </div>
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                            groupid="SalesContractsForm" lovpopupid="customerPopup" argumentid="CustomerRecCode" />
                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>
                        <%--                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>--%>

                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Car Number:</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarNumber"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="SalesContractsForm" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="BrandId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CustomerType"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ModelId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Color"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Passport No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="PassportNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="PassportExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Type</nobr>
                    </td>
                    <td class="auto-style2">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TypeId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">

                    <td></td>
                    <td class="auto-style2"></td>

                    <td class="ftitle">
                        <nobr>Driving License No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td></td>
                    <td class="auto-style2"></td>
                    <td class="ftitle">
                        <nobr>Work & Res. Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="WorkTelephone"></span>
                        <nobr class="CommaWR">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ResidenceTelephone"></span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style2"></td>
                    <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td class="ftitle">Car Owner Name:</td>
                    <td>
                        <input type="text" style="text-align: center; width: 270px;" maxlength="10" class="text  CommonDisable"
                            groupid="SalesContractsForm" argumentid="CarOwnerName" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Reservation Date*:</nobr>
                    </td>
                    <td class="auto-style2">
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date CommonDisable" requirederr=' *' argumentid="ContractStartDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartTime" />

                    </td>

                    <td class="ftitle">
                        <nobr>Reservation End Date*:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date DisableOnClose" requirederr=' Reservation Date Required' argumentid="ReservationDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationWeekDays" />

                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationExpireTime" />--%>

                        <input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationDays" />

                    </td>


                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Contract Date:</nobr>
                    </td>
                    <td class="auto-style2">
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisable" requirederr=' *' argumentid="ContractDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractWeekDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractTime" />

                    </td>

                    <td class="ftitle">
                        <nobr>Delivery Date:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date DisableOnClose" requirederr='  ' argumentid="DeliveryDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="DeliveryWeekDays" />

                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="DeliveryTime" />--%>

                        <%--<input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationDays" />--%>

                    </td>


                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Engine Warranty:</nobr>
                    </td>
                    <td class="auto-style2">KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable"
                            groupid="SalesContractsForm" argumentid="EngineWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="EnginYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible"   style="width: 155px;" groupid="SalesContractsForm" argumentid="EnginYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'41'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Gear Warranty:</nobr>
                    </td>
                    <td class="auto-style2">KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable"
                            groupid="SalesContractsForm" argumentid="GearWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="GearYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible" class="dropdownlist  " style="width: 155px;" groupid="SalesContractsForm" argumentid="GearYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Car Warranty:</nobr>
                    </td>
                    <td class="auto-style2">KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable"
                            groupid="SalesContractsForm" argumentid="CarWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="CarYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible" class="dropdownlist  " style="width: 155px;" groupid="SalesContractsForm" argumentid="CarYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>


                    </td>
                </tr>

                <tr>
                    <td class="ftitle">48 Hrs Car Replacement:</td>
                    <td class="ftitle" width="32%">
                         <input type="radio" class="CommonDisable " checked="checked" default="default" value="No" name="CarReplacement" groupid="SalesContractsForm" argumentid="CarReplacement" /><label>No </label>
                        <input type="radio" class=" CommonDisable"  value="Yes" name="CarReplacement" groupid="SalesContractsForm" argumentid="CarReplacement" /><label>Yes</label>
                                               <%-- CommonDisable default="default" --%>
                    </td>
                    <td colspan="2"></td>
                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">

                        <nobr>Car Price:</nobr>
                    </td>
                    <td>
                        <%-- <span class="ftitle" groupid="SalesContractsForm" argumentid="Price" style="text-align: center;" requirederr=' Car Price  Required'></span>--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="Price" disabled="disabled" />--%>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" step="0.01" class="text number AlwaysDisable bgr"
                            groupid="SalesContractsForm" argumentid="Price" />
                    </td>
                    <td colspan="2" class="ftitle">

                        <nobr>Comments:</nobr>
                    </td>


                </tr>


                <tr>


                    <td class="ftitle">

                        <nobr>Additional Amount:</nobr>
                    </td>
                    <td class="auto-style2">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable"
                            groupid="SalesContractsForm" argumentid="AdditionalAmount" />

                    </td>

                    <td rowspan="3" colspan="2">

                        <textarea style="width: 100%" rows="5" wrap="hard" argumentid="fComments" groupid="SalesContractsForm" name="S1" cols="20"></textarea>

                    </td>

                </tr>


                <tr>

                    <td class="ftitle">

                        <nobr>Discount:</nobr>

                    </td>
                    <td class="auto-style2">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable"
                            groupid="SalesContractsForm" argumentid="Discount" />
                    </td>

                </tr>



                <tr>

                    <td class="ftitle">
                        <nobr>Grand Total:</nobr>
                    </td>
                    <td class="auto-style2">
                        <%-- <span class="ftitle" groupid="SalesContractsForm" argumentid="TotalAmount"></span>--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisable AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="TotalAmount" disabled="disabled" />--%>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number AlwaysDisable bgr"
                            groupid="SalesContractsForm" argumentid="TotalAmount" />
                    </td>

                </tr>



                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>




                <tr>
                    <td class="ftitle">
                        <nobr style="color: Green; font-size: 12px">Amount Received (KD):</nobr>
                    </td>
                    <td style="text-align: center;" class="auto-style2">
                        <span class="ftitle" style="color: Green; font-size: 12px" groupid="SalesContractsForm" argumentid="PaymentAmount"></span>
                    </td>
                    <td class="ftitle">

                        <nobr style="color: Red; font-size: 12px">Amount Due:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" style="color: Red; font-size: 12px" groupid="SalesContractsForm" argumentid="AmountDue"></span>
                    </td>
                </tr>


                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                      
                        <div class="file-upload-drop-area">
                            <select loadon="FirstVisible" class="dropdownlist required " style="width: 155px;"
                                groupid="SalesContractsForm" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}">
                                <option value="" selected="selected">Select Doc Type</option>
                            </select>


                            <input type="file" class="file-input" accept=".pdf,.jpg,.png,.txt,.docx" />
                            <span class="allowedFile" style="display:none;"></span>
                          

                            <button class="upload-button">Upload</button>

                        </div>




                        <%-- <div class="progress-bar"></div>
                            <div class="message"></div>--%>

                        <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly" />

                        <%-- Data Grid  --%>
                        <div style="width: 100%;">
                        <table cellspacing:"0" cellpadding:"0" border="0" style: 5%; style="width:100%;"  text-align: left" class="uploadedFileList">
                            <tbody>
                                <tr class="HeaderTR">
                                    <td class="Header w-grid-border">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header">
                                            <tbody>
                                                <tr class="w-grid-head-back">

                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-3" colindex="3" colid="FileName" style="padding-left: 0px; padding-right: 0px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Name</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Size</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileType" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Type</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedBy" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploaded By</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploade Date</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 45px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 35px;">
                                                            <span href="#" class="w-grid-head ColName sort"></span>
                                                        </div>
                                                    </td>


                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="ItemTR">
                                    <td class="Item w-grid-border">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; table-layout: fixed" itemno="10" class="w-grid-row-odd">
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="NoRecordsTR" style="display: none;">
                                    <td class="NoRecords w-grid-norecords-msg">
                                        <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                            </div>
                        <%--<%-- End Data Grid --%>
                   
                        
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" value="  Save  " ignorevalidate="ReservationDate DocType" class="DataAction ButtonStyle btn_11 btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true, Requery:false,GroupId:'SalesContractsForm'}" />
                            <input type="button" value="  Reserve  " ignorevalidate="DocType" class="DataAction ButtonStyle btn_11 btnReserve common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:false,GroupId:'SalesContractsForm',Requery:false,Params:{DBAction:'SCReserved'}}" />
                             <input type="button" value="  Quotation  " class="ButtonStyle QuotationBtn common-button" />

                            <input type="button" value="  Contract  " class="ButtonStyle PrintBtn common-button" />
<%--                            <input type="button" value="  Bills  " class="ButtonStyle BillsBtn common-button" />--%>
                            <input type="button" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr tabid="SalesPaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdSalesContractsPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_iRental_SalesContracts_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_Payments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px', caption: 'ID' },
                                LocationReceiptId: { width: '110px', caption: 'ID' },
                                PrintId: { width: '30px', caption: '' },
                                ParentRecId: { width: '0px' },
                                PaymentType: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' },
                                StateId: { width: '0px' }
                            },
                            forms: {
                                NewFormId: 'frmSalesContactsPaymentDetails',
                                EditFormId: 'frmSalesContactsPaymentDetails',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = Sales.SalesContracts.grdPaymentDetails;
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="4">
                    <AW:container id="conSalesPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdSalesPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_SalesContracts_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '182px' },
                                RecId: { width: '0px', caption: 'System ID' },
                                ParentRecId: { width: '0px' },
                                PaymentType_Audit: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Action By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                    <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                   </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
                </RowDetail>

            </AW:DataGrid>

            <AW:Form ID="frmSalesContactsPaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesContracts_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>

                        var fn = Sales.SalesContracts.frmSalesContactsPaymentDetails;

                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

</table>
