<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" TagPrefix="AW" TagName="CustomerDetails_FrUc" %>
<script src="../../../Scripts/eForms/iRental/grdSalesContractComments.js"></script>



<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
<script src="../../../JQuery/Common.js"></script>

<div class="">

    <div class="card">
        <div class="card-body">
            <div class="row mb-2">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class="  ink-bar">Sales Contracts</span>
                        <i class="fa-regular fa-rectangle-xmark CloseForm"
                            tabid="CloseBtn" title="Close Form"
                            style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                            onmouseover="this.style.color='red';"
                            onmouseout="this.style.color='black';"></i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="row ">
                        <div class="col-sm-12">
                            <div class="Sales">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs SimpleTab align-items-center" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-bs-toggle="tab" tabid="SalesContractDetails" href="#SalesContractDetails">Contract Details</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="tab" tabid="SalesOtherCharges" href="#SalesOtherCharges">Additional Amount</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link SalesPaymentDetails" data-bs-toggle="tab" tabid="SalesPaymentDetails" href="#SalesPaymentDetails">Payment Details</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="tab" tabid="SalesContractComments" href="#SalesContractComments">Comments</a>
                                    </li>

                                    <!-- Close Icon -->
                                    <%--        <li class="ms-auto" style="padding-right: 10px;">
            <i class="fa-regular fa-rectangle-xmark CloseForm" tabid="CloseBtn" title="Close Form" style="font-size: 20px; color: black; cursor: pointer; transition: all 0.3s ease;" onmouseover="this.style.color='red';" onmouseout="this.style.color='black';"></i>
        </li>--%>
                                </ul>




                                <!-- Tab panes -->
                                <div class="tab-content">

                                    <div class="tab-pane container active" tabid="SalesContractDetails" id="SalesContractDetails">
                                        <div class="row justify-content-center">
                                            <%--        <div class="col-lg-12 col-md-10 col-sm-12 p-4 bg-light shadow rounded mt-3">--%>
                                            <div class="row my-3 justify-content-center">
                                                <div class="alert alert-info alert-dismissible fade show mt-3 position-relative" role="alert">
                                                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory

                                   
                                                </div>
                                            </div>
                                            <div style="display: none">
                                                <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />
                                                <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly" />

                                                <span groupid="SalesContractsForm" argumentid="RecId1"></span>
                                                <span groupid="SalesContractsForm" argumentid="StateId"></span>
                                                <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountInWordsSalesContract" groupid="SalesContractsForm" />
                                                <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountInWordsGrandSalesContract" groupid="SalesContractsForm" />
                                                <%--                            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountDueInWordsSalesContract"  groupid="SalesContractsForm"/>--%>
                                                <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountDueInWordsSalesContract" groupid="SalesContractsForm" />
                                            </div>


                                            <div class="row mb-3 justify-content-center OnNewHide">
                                                <!-- Contract No. -->
                                                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-3 mb-md-0">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext text-danger fw-bold" id="ContractNo" groupid="SalesContractsForm" argumentid="RecCode" value="New contract no. will be generated on saving" readonly>
                                                        <label for="ContractNo">Sales Contract No.</label>
                                                    </div>
                                                </div>

                                                <!-- Contract Status -->
                                                <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext" id="ContractStatus" groupid="SalesContractsForm" argumentid="StateName" value="" readonly>
                                                        <label for="ContractStatus">Contract Status</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">

                                                <div class="col-12 col-sm-6 col-lg-2 text-start ">
                                                    <label for="floatingLimited">
                                                        <small><b>Payment Method*:</b></small>
                                                    </label>
                                                </div>
                                                <div class="col-12 col-sm-6 col-lg-2 text-start mb-3 mb-md-0">
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass   cash " type="radio" id="Cash" checked="checked" default="default" value="Cash" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod">
                                                        <label class="form-check-label" for="Cash">Cash</label>
                                                    </div>
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass  finance" type="radio" id="Finance" value="Finance" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod">
                                                        <label class="form-check-label" for="Finance">Finance</label>
                                                    </div>
                                                </div>


                                                <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
                                                    <div class="form-floating">
                                                        <select class="form-select dropdownlist required financeCompany CommonDisableClass " id="FinanceCompany" loadon="FirstVisible" groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}"
                                                            requirederr='*'>
                                                            <option value="" selected>Select Finance Company</option>
                                                        </select>
                                                        <label for="FinanceCompany" class="financeCompany">Finance Company*</label>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-3 ">
                                                <div class="col-12 col-sm-none col-lg-2 text-start "></div>
                                                <div class="col-12 col-sm-6 col-lg-1 text-start ">
                                                    <label for="floatingType">
                                                        <small><b>Car Reservation*:</b></small>
                                                    </label>
                                                </div>
                                                <div class="col-12 col-sm-6 col-lg-3 text-end mb-3 mb-md-0">
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass   Arrive  " type="radio" id="Arrive" checked="checked" default="default" value="CarArrived" name="CarReservationMode" groupid="SalesContractsForm" argumentid="CarReservationMode">
                                                        <label class="form-check-label" for="Arrive">Car Arrived</label>
                                                    </div>
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass  NotArrive" type="radio" id="NotArrive" value="CarNotArrive" name="CarReservationMode" groupid="SalesContractsForm" argumentid="CarReservationMode">
                                                        <label class="form-check-label" for="NotArrive">Car Not Arrive</label>
                                                    </div>
                                                </div>


                                                <div class="col-12 col-sm-12 col-lg-2">
                                                    <div class="form-floating LPONumberDateField">
                                                        <input type="text" class="form-control text PriceC CommonDisableClass mb-3" id="LPONumber" groupid="SalesContractsForm" argumentid="LPONumber">
                                                        <label for="LPONumber" class="lpoNumber">LPO Number</label>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-12 col-lg-2">
                                                    <div class="form-floating LPONumberDateField">
                                                        <input type="date" class="form-control   date CommonDisableClass s" id="LPODate" groupid="SalesContractsForm" argumentid="LPODate">
                                                        <label for="LPODate" class="lpoDate">LPO Date</label>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="row mb-3 ">
                                                <div class="col-12 col-sm-none col-lg-2 text-start "></div>
                                                <div class="col-12 col-sm-6 col-lg-1 text-start ">
                                                    <label for="floatingType">
                                                        <small><b>Car Type*:</b></small>
                                                    </label>
                                                </div>
                                                <div class="col-12 col-sm-6 col-lg-3 text-end mb-3 mb-md-0">
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass ElemDisabled  " type="radio" id="NewCar" default="default" value="N" name="CarType" groupid="SalesContractsForm" argumentid="CarType">
                                                        <label class="form-check-label" for="NewCar">New Car</label>
                                                    </div>
                                                    <div class="form-check form-check-inline ">
                                                        <input class="form-check-input CommonDisableClass ElemDisabled " type="radio" id="UsedCar" value="U" name="CarType" groupid="SalesContractsForm" argumentid="CarType">
                                                        <label class="form-check-label" for="UsedCar">Used Car</label>
                                                    </div>
                                                </div>


                                                <div class="col-12 col-sm-12 col-lg-4">
                                                    <div class="form-floating LPONumberDateField">
                                                        <input type="text" class="form-control text number PriceC  CommonDisableClass" id="LPOAmount" groupid="SalesContractsForm" argumentid="LPOAmount">
                                                        <label for="LPOAmount" class="lpoNumber">LPO Amount</label>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row mb-2 justify-content-center">
                                                <!-- Car Number -->
                                                <div class="col-12 col-sm-none col-md-none col-lg-2">
                                                </div>
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control text  LOVPopup text  CommonDisableClass   text-danger fw-bold" id="ChassisNo" groupid="SalesContractsForm" lovpopupid="carPopup" argumentid="ChassisNo" placeholder="ChassisNo">
                                                        <label for="ChassisNo" class="ChassisNo">ChassisNo.*</label>
                                                    </div>
                                                </div>

                                                <!-- Customer Code -->

                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control text required LOVPopup  text  CommonDisableClass text-danger fw-bold" id="CustomerCode" groupid="SalesContractsForm" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr=' *Required' placeholder="Customer Code*">
                                                        <label for="CustomerCode">Customer Code*</label>
                                                    </div>
                                                    <div class="position-absolute top-0 end-0 me-2 w-ui-icon w-ui-panel-icon-closed contDetailsIcon" style="height: 20px; cursor: pointer;">&nbsp;</div>
                                                </div>
                                                <div class="col-12 col-sm-none col-md-none col-lg-2 text-start">
                                                    <%--                    <span>
                        <i class="contDetailsIconMD  fa-solid fa-circle-plus"></i>
                    </span>--%>
                                                </div>
                                            </div>


                                            <div class="row mb-2 justify-content-center">
                                                <!-- Chassis Number -->

                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold CommonSP" id="CarNo" groupid="SalesContractsForm" argumentid="CarNumber" placeholder="Car No." readonly>
                                                        <label for="CarNo" class="CommonSP">Car No.</label>
                                                    </div>
                                                </div>

                                                <!-- Name -->

                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="CustomerName" groupid="SalesContractsForm" argumentid="CustomerName" placeholder="Name" readonly>
                                                        <label for="CustomerName">Name</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2 justify-content-center">
                                                <!-- Brand -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <div class="form-floating CommonSP">
                                                            <input type="text" class="form-control-plaintext  fw-bold CommonSP" id="SLBrand" groupid="SalesContractsForm" argumentid="Brand" readonly>
                                                            <label for="SLBrand">Brand</label>
                                                        </div>
                                                        <select class="form-control dropdownlist required CommonDD CommonDisableClass" id="SLBrandId" groupid="SalesContractsForm" argumentid="SalesBrandId" placeholder="Brand" loadon="FirstVisible" childcombo="SalesModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                                                            <option value="" selected="selected">Select Brand</option>
                                                            <%--SalesModelId--%>
                                                        </select>
                                                        <label for="SLBrandId" class="CommonDD">Brand</label>
                                                    </div>
                                                </div>

                                                <!-- Nationality -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold" id="Nationality" groupid="SalesContractsForm" argumentid="Nationality" placeholder="Nationality" readonly />
                                                        <label for="Nationality">Nationality</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 justify-content-center">
                                                <!-- Model -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <div class="form-floating CommonSP">
                                                            <input type="text" class="form-control-plaintext  fw-bold CommonSP" id="Model" groupid="SalesContractsForm" argumentid="Model" readonly>
                                                            <label for="Model">Model</label>
                                                        </div>
                                                        <select class="form-control dropdownlist required CommonDD CommonDisableClass" id="ModelId" groupid="SalesContractsForm" argumentid="SalesModelId" placeholder="Model" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'SalesBrandId'}]}">
                                                            <option value="" selected="selected">Select Model</option>
                                                        </select>
                                                        <label for="ModelId" class="CommonDD">Model</label>
                                                    </div>
                                                </div>

                                                <!-- National ID No. -->
                                                <div class="col-12 col-sm-6 col-lg-2">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold" id="NationalIDNo" groupid="SalesContractsForm" argumentid="NationalIDNo" placeholder="National ID No." readonly />
                                                        <label for="NationalIDNo">National ID No.</label>
                                                    </div>
                                                </div>

                                                <!-- National ID Expiry Date -->
                                                <div class="col-12 col-sm-none col-lg-2">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold" id="NationalIDExpiryDate" groupid="SalesContractsForm" argumentid="NationalIDExpiryDate" placeholder="Expiry Date" readonly />
                                                        <label for="NationalIDExpiryDate">Expiry Date</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row mb-2 justify-content-center">
                                                <!-- Year -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <div class="form-floating CommonSP">
                                                            <input type="text" class="form-control-plaintext  fw-bold CommonSP" id="Year" groupid="SalesContractsForm" argumentid="CarYear" readonly>
                                                            <label for="Year">Year</label>
                                                        </div>
                                                        <select class="form-control dropdownlist required CommonDD CommonDisableClass" id="YearId" groupid="SalesContractsForm" argumentid="SalesYearId" placeholder="Year" loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                                                            <option value="" selected="selected">Select Year</option>
                                                        </select>
                                                        <label for="YearId" class="CommonDD">Year</label>
                                                    </div>
                                                </div>

                                                <!-- Gender -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold" id="Gender" groupid="SalesContractsForm" argumentid="Gender" placeholder="Gender" readonly />
                                                        <label for="Gender">Gender</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 justify-content-center">
                                                <!-- Color -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <div class="form-floating CommonSP">
                                                            <input type="text" class="form-control-plaintext  fw-bold CommonSP" id="Color" groupid="SalesContractsForm" argumentid="Color" readonly>
                                                            <label for="Color">Color</label>
                                                        </div>
                                                        <select class="form-control dropdownlist required CommonDD CommonDisableClass" id="ColorId" groupid="SalesContractsForm" argumentid="SalesColorId" placeholder="Color" loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                                                            <option value="" selected="selected">Select Color</option>
                                                        </select>
                                                        <label for="ColorId" class="CommonDD">Color</label>
                                                    </div>
                                                </div>

                                                <!-- Mobile Telephone -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control-plaintext fw-bold" id="MobileTelephone1" groupid="SalesContractsForm" argumentid="MobileTelephone1" placeholder="Mobile Telephone" readonly />
                                                        <label for="MobileTelephone1">Mobile Telephone</label>
                                                    </div>
                                                    <%--       <div class="col-12 col-sm-6 col-lg-2">
            <div class="form-floating mt-2">
                <input
                    type="text"
                    class="form-control-plaintext"
                    id="MobileTelephone2"
                    groupid="SalesContractsForm"
                    argumentid="MobileTelephone2"
                    placeholder="Secondary Mobile Telephone"
                    readonly />
                <label for="MobileTelephone2">Mobile Telephone 2</label>
            </div>
        </div>--%>
                                                </div>
                                            </div>


                                            <div class="row mb-2 justify-content-center">
                                                <!-- Interior Color -->
                                                <div class="col-12 col-sm-12 col-lg-4">
                                                    <div class="form-floating">
                                                        <div class="form-floating CommonSP">
                                                            <input type="text" class="form-control-plaintext  fw-bold CommonSP" id="InteriorColor" groupid="SalesContractsForm" argumentid="InteriorColor" readonly>
                                                            <label for="InteriorColor">Interior Color</label>
                                                        </div>
                                                        <select class="form-control dropdownlist a CommonDD CommonDisableClass" id="InteriorColorId" groupid="SalesContractsForm" argumentid="SalesInteriorColorId" placeholder="Interior Color"
                                                            loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'45'}]}">
                                                            <option value="" selected="selected">Select Interior Color</option>
                                                        </select>
                                                        <label for="InteriorColorId" class="CommonDD">Interior Color</label>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-none col-lg-4"></div>
                                            </div>

                                            <div class="row mb-2 justify-content-center">
                                                <!-- Type -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <select class="form-control dropdownlist required CommonDD CommonDisableClass" id="TypeId" groupid="SalesContractsForm" argumentid="SalesTypeId" placeholder="Type" loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                                                            <option value="" selected="selected">Select Type</option>
                                                        </select>
                                                        <label for="TypeId" class="CommonDD">Type</label>
                                                    </div>
                                                </div>

                                                <!-- Car Owner National ID No. -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="CarOwnerNationalIDNo" groupid="SalesContractsForm" argumentid="CarOwnerNationalIdNumber" placeholder="Enter 12 Digits" maxlength="12" style="text-align: center; font-size: 11px;" />
                                                        <label for="CarOwnerNationalIDNo">Car Owner National ID No.</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2 justify-content-center">
                                                <!-- Car Owner Name -->
                                                <div class="col-12 col-sm-none col-lg-4"></div>
                                                <div class="col-12 col-sm-12 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="CarOwnerName" groupid="SalesContractsForm" argumentid="CarOwnerName" placeholder="Car Owner Name" maxlength="199" style="text-align: center; font-size: 11px; font-weight: bold;" />
                                                        <label for="CarOwnerName">Car Owner Name</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--             <div class="border hideOnCarNotArrived ">
                                    <div class="row mb-3 justify-content-center hideOnCarNotArrived mt-3">
                                        <!-- Full Insurance -->
                                        <div class="col-12 col-sm-6 col-lg-4">
                                            <div class="form-floating">
                                                <select class="form-control dropdownlist CommonEdit" id="FullInsurance" groupid="SalesContractsForm" argumentid="FullInsuranceCompanyId2" placeholder="Select Insurance" loadon="FirstVisible" style="display: block;" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                                                    <option value="" selected="selected">Select Insurance</option>
                                                </select>
                                                <label for="FullInsurance">Full Insurance</label>
                                            </div>
                                        </div>

                                        <!-- Expiry Date -->
                                        <div class="col-12 col-sm-6 col-lg-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control date FullInsuranceExpiry CommonEdit" id="FullInsuranceExpiry" groupid="SalesContractsForm" argumentid="FullInsuranceExpiry2" placeholder="Expiry Date" maxlength="10" style="display: block;" />
                                                <label for="FullInsuranceExpiry">Expiry Date</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-3 justify-content-center hideOnCarNotArrived mt-3">

                                        <!-- Policy No -->
                                        <div class="col-12 col-sm-6 col-lg-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control CommonEdit" id="PolicyNo" groupid="SalesContractsForm" argumentid="FullInsurancePolicyNo2" placeholder="Policy No." maxlength="10" style="display: block;" />
                                                <label for="PolicyNo">Policy No.</label>
                                            </div>
                                        </div>

                                        <%--                    <div class="col-12 col-sm-6 col-lg-4">
                            <button class="btn btn-secondary Edit_Insrance common-disable-button" style="cursor: pointer;">Edit</button>
                            <button class="btn btn-primary Update_Insurance common-disable-button" style="display: none; cursor: pointer;"
                                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{Action:'UpdateInsurance'},HideOnSuccess:false, Requery:true,GroupId:'SalesContractsForm'}">
                                Save
                            </button>
                            <button class="btn btn-danger Clear_Insrance common-disable-button" style="display: none; cursor: pointer;">Close</button>
                        </div>--%>
                                            <%--  </div>--%>



                                            <%--</div>--%>


                                            <div class="row mb-2 justify-content-center">
                                                <!-- Reservation Date -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="date" class="form-control date CommonDisableClass" id="ReservationDate" groupid="SalesContractsForm" argumentid="ContractStartDate" placeholder="Reservation Date" maxlength="10" />
                                                        <label for="ReservationDate">Reservation Date</label>
                                                    </div>
                                                </div>

                                                <!-- Reservation End Date -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="date" class="form-control date DisableOnClose CommonDisableClass" id="ReservationEndDate" groupid="SalesContractsForm" argumentid="ReservationDate" placeholder="Reservation End Date" maxlength="10" />
                                                        <label for="ReservationEndDate">Reservation End Date</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 justify-content-center">
                                                <!-- Contract Date -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="date" class="form-control date CommonDisableClass" id="ContractDate" groupid="SalesContractsForm" argumentid="ContractDate" placeholder="Contract Date" maxlength="10" />
                                                        <label for="ContractDate">Contract Date</label>
                                                    </div>
                                                </div>

                                                <!-- Delivery Date -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="date" class="form-control date DisableOnClose CommonDisableClass" id="DeliveryDate" groupid="SalesContractsForm" argumentid="DeliveryDate" placeholder="Delivery Date" maxlength="10" />
                                                        <label for="DeliveryDate">Delivery Date</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- Engine Warranty - KM -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control number CommonDisableClass" id="EngineWarranty" groupid="SalesContractsForm" argumentid="EngineWarranty" placeholder="Engine Warranty - KM" maxlength="100" style="text-align: center;" />
                                                        <label for="EngineWarranty">Engine Warranty - KM</label>
                                                    </div>
                                                </div>
                                                <!-- Engine Warranty - Years -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <select loadon="FirstVisible" class="form-control dropdownlist CommonDisableClass" id="EngineYearsWarranty" groupid="SalesContractsForm" argumentid="EnginYearsWarranty" placeholder="Select Years" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                                                            <option value="" selected="selected">Select Years</option>
                                                        </select>
                                                        <label for="EngineYearsWarranty">Years</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- Gear Warranty - KM -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control number CommonDisableClass" id="GearWarranty" groupid="SalesContractsForm" argumentid="GearWarranty" placeholder="Gear Warranty - KM" maxlength="10" style="text-align: center;" />
                                                        <label for="GearWarranty">Gear Warranty - KM</label>
                                                    </div>
                                                </div>
                                                <!-- Gear Warranty - Years -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <select loadon="FirstVisible" class="form-control dropdownlist CommonDisableClass" id="GearYearsWarranty" groupid="SalesContractsForm" argumentid="GearYearsWarranty" placeholder="Select Years" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                                                            <option value="" selected="selected">Select Years</option>
                                                        </select>
                                                        <label for="GearYearsWarranty">Years</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- Car Warranty - KM -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control number CommonDisableClass" id="CarWarranty" groupid="SalesContractsForm" argumentid="CarWarranty" placeholder="Car Warranty - KM" maxlength="10" style="text-align: center;" />
                                                        <label for="CarWarranty">Car Warranty - KM</label>
                                                    </div>
                                                </div>
                                                <!-- Car Warranty - Years -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <select loadon="FirstVisible" class="form-control dropdownlist CommonDisableClass" id="CarYearsWarranty" groupid="SalesContractsForm" argumentid="CarYearsWarranty" placeholder="Select Years" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                                                            <option value="" selected="selected">Select Years</option>
                                                        </select>
                                                        <label for="CarYearsWarranty">Years</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- Free Service - KM -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control number CommonDisableClass" id="FreeServiceKM" groupid="SalesContractsForm" argumentid="FreeServiceKM" placeholder="Free Service - KM" maxlength="10" style="text-align: center;" />
                                                        <label for="FreeServiceKM">Free Service - KM</label>
                                                    </div>
                                                </div>
                                                <!-- Service Book No. -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control CommonDisableClass" id="ServiceBookNo" groupid="SalesContractsForm" argumentid="ServiceBookNo" placeholder="Service Book No." maxlength="10" style="text-align: center;" />
                                                        <label for="ServiceBookNo">Service Book No.</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- 48 Hrs Car Replacement -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <label class="form-label">48 Hrs Car Replacement:</label>
                                                    <div class="form-check">
                                                        <input class="form-check-input CommonDisableClass" type="radio" name="CarReplacement" id="CarReplacementNo" value="No" checked groupid="SalesContractsForm" argumentid="CarReplacement" />
                                                        <label class="form-check-label" for="CarReplacementNo">No</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input CommonDisableClass" type="radio" name="CarReplacement" id="CarReplacementYes" value="Yes" groupid="SalesContractsForm" argumentid="CarReplacement" />
                                                        <label class="form-check-label" for="CarReplacementYes">Yes</label>
                                                    </div>
                                                </div>
                                                <!-- Road Service Card No. -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control CommonDisableClass" id="RoadServiceNo" groupid="SalesContractsForm" argumentid="RoadServiceNo" placeholder="Road Service Card No." maxlength="10" style="text-align: center;" />
                                                        <label for="RoadServiceNo">Road Service Card No.</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <!-- Row 1: Car Price and Salesman -->
                                            <div class="row mb-3 justify-content-center">
                                                <!-- Car Price -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control text-center number CommonDisableClass PriceC" id="CarPrice" groupid="SalesContractsForm" argumentid="Price" placeholder="Car Price" maxlength="10" />
                                                        <label for="CarPrice">Car Price</label>
                                                    </div>
                                                </div>
                                                <!-- Salesman -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="form-floating">
                                                        <select class="form-control dropdownlist CommonDisableClass" id="Salesman" groupid="SalesContractsForm" argumentid="Salesman" placeholder="Select Salesman" loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                                                            <option value="" selected>Select Salesman</option>
                                                        </select>
                                                        <label for="Salesman">Salesman</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3 justify-content-center">
                                                <!-- Left Column: Three Rows -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <!-- Row 1: Additional Amount -->
                                                    <div class="form-floating mb-3">
                                                        <input
                                                            type="text"
                                                            class="form-control text-center number AlwaysDisable"
                                                            id="AdditionalAmount"
                                                            groupid="SalesContractsForm"
                                                            argumentid="AdditionalAmount"
                                                            placeholder="Additional Amount"
                                                            maxlength="10"
                                                            disabled />
                                                        <label for="AdditionalAmount">Additional Amount</label>
                                                    </div>
                                                    <!-- Row 2: Discount -->
                                                    <div class="d-flex align-items-center mb-3">
                                                        <div class="form-floating me-2">
                                                            <input
                                                                type="text"
                                                                class="form-control text-center number CommonDisableClass"
                                                                id="Discount"
                                                                groupid="SalesContractsForm"
                                                                argumentid="Discount"
                                                                placeholder="Discount"
                                                                maxlength="10" />
                                                            <label for="Discount">Discount</label>
                                                        </div>
                                                        <div class="form-floating">
                                                            <select
                                                                class="form-control dropdownlist CommonDisableClass"
                                                                id="DiscountBy"
                                                                groupid="SalesContractsForm"
                                                                argumentid="DiscountGiver"
                                                                placeholder="Discount By"
                                                                storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'41'}]}">
                                                                <option value="" selected>Discount By</option>
                                                            </select>
                                                            <label for="DiscountBy">Discount By</label>
                                                        </div>
                                                    </div>
                                                    <!-- Row 3: Grand Total -->
                                                    <div class="form-floating">
                                                        <input
                                                            type="text"
                                                            class="form-control text-center number AlwaysDisable"
                                                            id="GrandTotal"
                                                            groupid="SalesContractsForm"
                                                            argumentid="TotalAmount"
                                                            placeholder="Grand Total"
                                                            maxlength="10" />
                                                        <label for="GrandTotal">Grand Total</label>
                                                    </div>
                                                </div>

                                                <!-- Right Column: Comments (Matches height of the left column) -->
                                                <div class="col-12 col-sm-6 col-lg-4 d-flex">
                                                    <div class="form-floating flex-grow-1">
                                                        <textarea
                                                            class="form-control h-100"
                                                            placeholder="Leave a comment here"
                                                            id="floatingTextarea"
                                                            groupid="SalesContractsForm"
                                                            argumentid="fComments"
                                                            style="resize: none;"></textarea>
                                                        <label for="floatingTextarea">Comments</label>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row mb-3 justify-content-center align-items-center">
                                                <!-- Amount Due -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="">
                                                        <label class="form-label text-danger" style="font-size: 12px;">Amount Due:</label>
                                                        <span class="d-block ftitle AmountDueC text-danger" groupid="SalesContractsForm" argumentid="AmountDue" style="font-size: 12px;"></span>
                                                    </div>
                                                </div>

                                                <!-- Amount Received (KD) -->
                                                <div class="col-12 col-sm-6 col-lg-4">
                                                    <div class="">
                                                        <label class="form-label text-success" style="font-size: 12px;">Amount Received (KD):</label>
                                                        <span class="d-block ftitle PaymentAmountC text-success" groupid="SalesContractsForm" argumentid="PaymentAmount" style="font-size: 12px;"></span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="container mt-4">
                                                <!-- Combined Card -->
                                                <div class="card shadow">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <!-- Bill Section on the Left -->
                                                            <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2  border-end">
                                                                <h5 class="card-title text-center mb-4">Bill Section</h5>
                                                                <div class="d-flex flex-column align-items-center">
                                                                    <!-- Bill Amount with Button on the Right -->
                                                                    <div class="d-flex align-items-center mb-3" style="width: 100%;">
                                                                        <div class="form-floating flex-grow-1 me-2">
                                                                            <input
                                                                                type="text"
                                                                                id="BillAmount"
                                                                                class="form-control text-center number CommonDisableClass"
                                                                                groupid="SalesContractsForm"
                                                                                argumentid="BillAmount"
                                                                                placeholder="Enter Amount"
                                                                                maxlength="10" />
                                                                            <label for="BillAmount">Bill Amount</label>
                                                                        </div>

                                                                        <i class="fa-regular fa-circle-down CommonDisableClass btnGetCarPrice" title="Set Current Car Price"></i>
                                                                    </div>
                                                                    <!-- Bill Date Field -->
                                                                    <div class="form-floating mb-3" style="width: 100%;">
                                                                        <input
                                                                            type="date"
                                                                            id="BillDate"
                                                                            class="form-control text-center date CommonDisableClass"
                                                                            groupid="SalesContractsForm" argumentid="BillDate"
                                                                            placeholder="Enter Bill Date"
                                                                            maxlength="10" />
                                                                        <label for="BillDate">Bill Date</label>
                                                                    </div>
                                                                    <!-- Bill Button -->
                                                                    <button
                                                                        type="button"
                                                                        value="Bill"
                                                                        class="btn btn-primary BillsBtn common-button"
                                                                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'NoStateId'},HideOnSuccess:false,ShowActionMsg:false, Requery:true,GroupId:'SalesContractsForm'}"
                                                                        style="width: 100px;">
                                                                        Bill
                                                                    </button>
                                                                </div>
                                                            </div>

                                                            <!-- Buttons Section on the Right -->
                                                            <div class="col-md-12 col-sm-12 col-lg-10 col-xl-10 col-xxl-10">
                                                                <h5 class="card-title text-center mb-4">Actions</h5>
                                                                <div class="row justify-content-center">
                                                                    <!-- First Row Buttons -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl btnReserve">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-primary  w-100 DataAction  btnReserve "
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true,GroupId:'SalesContractsForm',Requery:false}">
                                                                            Reserve
                                                                        </button>
                                                                    </div>
                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl mb-2">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-success w-100 DataAction CloseContract ButtonStyle "
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:false,GroupId:'SalesContractsForm', Requery:true}">
                                                                            Close Contract - Payment Cleared
                                                                        </button>

                                                                    </div>
                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl mb-2">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-danger w-100 DataAction CancelContract ButtonStyle"
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:false,GroupId:'SalesContractsForm', Requery:true}">
                                                                            Cancel Contract
                                                                        </button>

                                                                    </div>
                                                                </div>
                                                                <!-- Second Row Buttons -->
                                                                <div class="row justify-content-center">
                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl mb-2">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-warning w-100 DataAction ButtonStyle PendingPaymentCarOut"
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCPendingPaymentCarOut'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">
                                                                            Pending Payment - Car Out
                                                                        </button>
                                                                    </div>
                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl mb-2">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-primary   w-100 DataAction ButtonStyle PendingPaymentCarIn"
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCPendingPaymentCarIn'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">
                                                                            Pending Payment - Car In
                                                                        </button>
                                                                    </div>

                                                                    <div class="col-md-12 col-sm-12 col-lg-4 col-xl-4 col-xxl-4 mb-2">
                                                                        <button
                                                                            type="button"
                                                                            ignorevalidate="DocType"
                                                                            class="btn btn-primary  w-100 DataAction ButtonStyle PaymentClearedCarNR"
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCPaymentClearedCarNR'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">
                                                                            Payment Cleared - Car NR
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <!-- Third Row Buttons -->
                                                                <div class="row justify-content-center mb-2">
                                                                    <!-- Edit Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2 w-100 mb-2  SalesButton_Edit">
                                                                        <button type="button" roles="iRen_Contracts_Admin" class="btn btn-primary ButtonStyle SalesButton_Edit">
                                                                            Edit
                                                                        </button>
                                                                    </div>

                                                                    <!-- Reserve Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" ignorevalidate="ReservationDate DocType" class="btn btn-primary ButtonStyle btnSave common-button DataAction w-100 mb-2 "
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'RRCCreatedState'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">
                                                                            Reserve
                                                                        </button>
                                                                    </div>

                                                                    <!-- Save Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" ignorevalidate="ReservationDate DocType" class="btn btn-primary ButtonStyle SaveBtn common-button DataAction w-100 mb-2"
                                                                            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'NoStateId'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">
                                                                            Save
                                                                        </button>
                                                                    </div>

                                                                    <!-- Quotation Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" class="btn btn-primary ButtonStyle QuotationBtn common-button w-100 mb-2">
                                                                            Quotation
                                                                        </button>
                                                                    </div>

                                                                    <!-- Contract Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" class="btn btn-primary ButtonStyle ContractPrintBtn common-button w-100 mb-2">
                                                                            Contract
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <%--  ///////////////////////////////////////////////////////////--%>
                                                                <div class="row justify-content-center">
                                                                    <!-- Statement Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" class="btn btn-primary ButtonStyle Statement common-button w-100 mb-2">
                                                                            Statement
                                                                        </button>
                                                                    </div>

                                                                    <!-- Delivery Note Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" class="btn btn-primary ButtonStyle DeliveryNote common-button w-100 mb-2 ">
                                                                            Delivery Note
                                                                        </button>
                                                                    </div>

                                                                    <!-- Close Button -->
                                                                    <div class="col-md-12 col-sm-12 col-lg-2 col-xl-2 col-xxl-2">
                                                                        <button type="button" class="btn btn-primary ButtonStyle CloseForm btnCancel common-button w-100 ">
                                                                            Close
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--</div>--%>

                                    <div class="tab-pane container fade" tabid="SalesPaymentDetails" id="SalesPaymentDetails">



                                        <%--         <div class="container mt-4 SalesPaymentPanel">
                <!-- Row 1: Contract No. -->
                <div class="row mb-3 align-items-center">
                    <div class="col-md-3 fw-bold">Contract No.:</div>
                    <div class="col-md-3">
                        <span groupid="SalesContractsForm" argumentid="RecCodePanel"></span>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                </div>

                <!-- Row 2: Car No. and Customer Name -->
                <div class="row mb-3 align-items-center">
                    <div class="col-md-3 fw-bold">Car No.:</div>
                    <div class="col-md-3">
                        <span groupid="SalesContractsForm" argumentid="CarNumberPanel"></span>
                    </div>
                    <div class="col-md-3 fw-bold">Customer Name:</div>
                    <div class="col-md-3">
                        <span groupid="SalesContractsForm" argumentid="CustomerNamePanel"></span>
                    </div>
                </div>

                <!-- Row 3: Amount Due and Amount Received -->
                <div class="row mb-3 align-items-center">
                    <div class="col-md-3 fw-bold text-danger">Amount Due:</div>
                    <div class="col-md-3 text-danger">
                        <span groupid="SalesContractsForm" argumentid="AmountDuePanel"></span>
                    </div>
                    <div class="col-md-3 fw-bold text-success">Amount Received:</div>
                    <div class="col-md-3 text-success">
                        <span groupid="SalesContractsForm" argumentid="PaymentAmountPanel"></span>
                    </div>
                </div>
            </div>--%>
                                        <div class="container SalesPaymentDetailsPannel mt-4">
                                            <!-- Card for Sales Payment Details -->
                                            <div class="card">
                                                <div class="card-header d-flex justify-content-between align-items-center">
                                                    <!-- Title -->
                                                    <h5 class="mb-0">Sales Payment Details Pannel</h5>
                                                    <!-- Toggle Icon -->
                                                    <i class="fas fa-minus  text-primary toggle-icon" style="cursor: pointer; font-size: 1.5rem;" data-bs-toggle="collapse" data-bs-target="#collapseSalesPayment" aria-expanded="false" aria-controls="collapseSalesPayment"></i>
                                                </div>

                                                <!-- Collapsible Content -->
                                                <div class="collapse show" id="collapseSalesPayment">
                                                    <div class="card-body">
                                                        <!-- Row 1: Contract No. -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Contract No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="RecCodePanel"></span>
                                                            </div>
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-3"></div>
                                                        </div>

                                                        <!-- Row 2: Car No. and Customer Name -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Car No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CarNumberPanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold">Customer Name:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CustomerNamePanel"></span>
                                                            </div>
                                                        </div>

                                                        <!-- Row 3: Amount Due and Amount Received -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold text-danger">Amount Due:</div>
                                                            <div class="col-md-3 text-danger">
                                                                <span groupid="SalesContractsForm" argumentid="AmountDuePanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold text-success">Amount Received:</div>
                                                            <div class="col-md-3 text-success">
                                                                <span groupid="SalesContractsForm" argumentid="PaymentAmountPanel"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


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
                                                            LocationReceiptId: { width: '130px', caption: 'ID' },
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
                                                    var fn = Sales.SalesContracts.grdSalesContractsPaymentDetails;
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
                GridTemplate="jQueryUI" GridHeadText="Sales Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
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
                                                            HeadText: 'Sales Payment Details'
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


                                    </div>

                                    <div class="tab-pane container fade" tabid="SalesOtherCharges" id="SalesOtherCharges">

                                        <div class="container SalesOtherChargesPannel mt-4">
                                            <!-- Card for Additional Charges -->
                                            <div class="card">
                                                <div class="card-header d-flex justify-content-between align-items-center">
                                                    <!-- Title -->
                                                    <h5 class="mb-0">Additional Charges</h5>
                                                    <!-- Toggle Icon -->
                                                    <i class="fas fa-minus text-primary toggle-icon" style="cursor: pointer; font-size: 1.5rem;" data-bs-toggle="collapse" data-bs-target="#collapseAdditionalCharges" aria-expanded="true" aria-controls="collapseAdditionalCharges"></i>
                                                </div>

                                                <!-- Collapsible Content (Default Open) -->
                                                <div class="collapse show" id="collapseAdditionalCharges">
                                                    <div class="card-body AdditionalChargesDiv">
                                                        <!-- Row 1: Contract No. -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Contract No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="RecCodePanel"></span>
                                                            </div>
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-3"></div>
                                                        </div>

                                                        <!-- Row 2: Car No. and Customer Name -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Car No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CarNumberPanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold">Customer Name:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CustomerNamePanel"></span>
                                                            </div>
                                                        </div>

                                                        <!-- Row 3: Amount Due and Amount Received -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold text-danger">Amount Due:</div>
                                                            <div class="col-md-3 text-danger">
                                                                <span groupid="SalesContractsForm" argumentid="AmountDuePanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold text-success">Amount Received:</div>
                                                            <div class="col-md-3 text-success">
                                                                <span groupid="SalesContractsForm" argumentid="PaymentAmountPanel"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <AW:DataGrid ID="grdSalesAdditionalAmount" LoadOnInit="true" ShowOnLoad="false" runat="server" Hidden="true" Columns="1"
                                            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                                            PageSize="10" DataSource="SEL_iRental_SalesContracts_AdditionalAmount" ContainerMargin="2px" GridTemplate="jQueryUI"
                                            GridHeadText="Additional Amount" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_AdditionalAmount\',KeysCol:\'RecId\'}}}">

                                            <GridConfig>
                                                <script>
                                                    cf = {
                                                        cols: {
                                                            Sequence: { width: '0px' },
                                                            RecId: { width: '70px', caption: 'ID' },
                                                            ParentRecId: { width: '0px' },
                                                            Description: { caption: 'Description', width: '380px' },
                                                            AdditionalAmount: { caption: 'Amount', width: '80px' },
                                                            DateCreated: { caption: 'Date Created', width: '130px' },
                                                            CreatedBy: { caption: 'Created By', width: '100px' },
                                                            StateId: { width: '0px' }
                                                        },
                                                        forms: {
                                                            NewFormId: 'frmSalesAdditionalAmount',
                                                            EditFormId: 'frmSalesAdditionalAmount',
                                                            Keys: 'RecId'
                                                        }
                                                    };
                                                </script>
                                            </GridConfig>
                                            <Scripts>
                                                <script>
                                                    var fn = function () {
                                                        // Event listener for the collapse element
                                                        $('#collapseAdditionalCharges').on('show.bs.collapse', function () {
                                                            $('.toggle-icon').removeClass('fa-plus').addClass('fa-minus');
                                                        });

                                                        $('#collapseAdditionalCharges').on('hide.bs.collapse', function () {
                                                            $('.toggle-icon').removeClass('fa-minus').addClass('fa-plus');
                                                        });
                                                        t.on('beforeSearchGetForm', function (P) {
                                                            var frm = AsyncWidgets.get('frmSalesContracts');
                                                            var RecId = P.ParentRecId = frm.GetArgVal('RecId');

                                                            var params = {
                                                                Command: 'SEL_iRental_SalesContracts',
                                                                RecId: `${RecId}`,


                                                            };

                                                            // Assuming ServerCall is a function to make an API call
                                                            ServerCall(params, function (res) {

                                                                //  var res = decJSON(res)


                                                                if (res.status === 'OK') {

                                                                    if (res.Response.Rows.length > 0) {
                                                                        var rows = res.Response.Rows;
                                                                        for (var i = 0; i < rows.length; i++) {
                                                                            var row = rows[i];
                                                                            var RecCode = row.RecCode;
                                                                            var CarNumber = row.CarNumber;
                                                                            var CustomerName = row.CustomerName;
                                                                            var AmountDue = row.AmountDue;
                                                                            var PaymentAmount = row.PaymentAmount;



                                                                        }


                                                                        var a = $('.container .SalesOtherChargesPannel')
                                                                        $('[argumentid="RecCodePanel"]', a).text(RecCode);
                                                                        $('[argumentid="CarNumberPanel"]', a).text(CarNumber);
                                                                        $('[argumentid="CustomerNamePanel"]', a).text(CustomerName);
                                                                        $('[argumentid="AmountDuePanel"]', a).text(AmountDue.toFixed(3));
                                                                        $('[argumentid="PaymentAmountPanel"]', a).text(PaymentAmount.toFixed(3));




                                                                    }

                                                                }




                                                            }, 'GetData');
                                                        });
                                                        t.on('beforeRowDelete', function (P) {
                                                            var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
                                                            pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
                                                            P.cf['ParentRecId'] = pVal;
                                                        });
                                                        t.on('rowsRendered', function () {

                                                            var frm = AsyncWidgets.get('frmSalesContracts');
                                                            var strMainStateId = frm.GetArgVal('StateId');

                                                            $('[colid="AdditionalAmount"]:not(".w-grid-head-cell")').each(function () {
                                                                var ptr = $(this).closest('tr');
                                                                $('[colid="AdditionalAmount"] div', ptr).text(parseFloat($('[colid="AdditionalAmount"] div', ptr).text()).fix(3));
                                                            });

                                                            $('[colid="StateId"]:not(".w-grid-head-cell")').each(function () {
                                                                var ptr = $(this).closest('tr');
                                                                if ($(this).text().toLowerCase() == "deleted") {
                                                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                                                    $('[colid="Charges"] div', ptr).css({ 'text-decoration': 'line-through' });
                                                                    $('.chkRowSelect', ptr).attr('disabled', 'disabled');
                                                                    $('td:nth-child(3)', ptr).css('cursor', '').unbind();

                                                                    var cur = {
                                                                        'background-image': 'url(' + ROOT_PATH + 'AsyncWidgets/Widgets/resources/images/RowEditForm_Disabled.png)',
                                                                        'background-repeat': 'no-repeat',
                                                                        'background-position': 'center center'
                                                                    };
                                                                    $('td:nth-child(3)', ptr).css(cur);
                                                                }
                                                            });

                                                            //If Main State ID = RRCContractClosed or RRCContractCancelled
                                                            if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled') {
                                                                $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
                                                                $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
                                                                $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
                                                            }
                                                            else {
                                                                $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).show();
                                                            }
                                                            //End If Main State ID = RRCContractClosed or RRCContractCancelled


                                                            var frm = AsyncWidgets.get('frmSalesContracts');


                                                            //var RecCode = $('[argumentid="RecCode"]', frm.el).text();
                                                            var RecId = $('[argumentid="RecId"]', frm.el).val();





                                                            var a = $('div.SalesAdditionalAmountPanelDiv')


                                                            if ($('table.SalesAdditonalAmountPanel', a).length > 0) {
                                                                $('table.SalesAdditonalAmountPanel', a).show();
                                                            }


                                                        });//end of rows renderd

                                                        t.on('onNoRecords', function () {
                                                            t.fireEvent('rowsRendered');
                                                        });




                                                        $('.ADCloseForm', t.el).on('click', function () {



                                                            var a = $('div.SalesAdditionalAmountPanelDiv')
                                                            if ($('table.SalesAdditonalAmountPanel', a).length > 0) {
                                                                $('table.SalesAdditonalAmountPanel', a).show();
                                                            }


                                                        });




                                                        $('[tabid="AdditionalAmount"]', t.el).on('click', function () {



                                                            var a = $('div.SalesAdditionalAmountPanelDiv')
                                                            if ($('table.SalesAdditonalAmountPanel', a).length > 0) {
                                                                $('table.SalesAdditonalAmountPanel', a).show();
                                                            }


                                                        });

                                                    }
                                                </script>
                                            </Scripts>
                                            <RowDetail>
                                                <pre class="" colindex="3">
                    <AW:container id="conSalesAdditionalAmount_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdSalesAdditionalAmount_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_SalesContracts_AdditionalAmount_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Amount Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '111px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description', width: '380px' },
                                AdditionalAmount: { caption: 'Amount', width: '80px' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '132px' }
                            }
                        };
                    </script>
                </GridConfig>
                                <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="AdditionalAmount"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    $('[colid="AdditionalAmount"] div', ptr).text(parseFloat($('[colid="AdditionalAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                    </script>
                </Scripts>
                </AW:DataGrid>
                </div>
                    </Childern>
                    </AW:container>
                     </pre>
                                            </RowDetail>
                                        </AW:DataGrid>

                                        <AW:Form ID="frmSalesAdditionalAmount" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                                            AsyncForm="~/Pages/eForms/iRental/SalesContracts_OC_FrUc.ascx">
                                            <WidgetConfig>
                                                <script>
                                                    cf = {

                                                        header: {
                                                            Style: {},
                                                            Visible: true,
                                                            Collapsed: false,
                                                            HeadText: 'Additional Amount'
                                                        }
                                                    }
                                                </script>
                                            </WidgetConfig>
                                            <Scripts>
                                                <script>
                                                    var fn = function () {

                                                        t.on('show', function (args) {
                                                            var frm = AsyncWidgets.get('frmSalesContracts');
                                                            $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));

                                                            var a = $('div.SalesAdditionalAmountPanelDiv')
                                                            if ($('table.SalesAdditonalAmountPanel', a).length > 0) {
                                                                $('table.SalesAdditonalAmountPanel', a).show();
                                                            }
                                                        });


                                                        t.on('onLoadedValues', function (p) {


                                                            if (p.res.status == "OK") {

                                                                if (p.res.Response.Rows) {

                                                                    var row = p.res.Response.Rows;

                                                                    for (var i = 0; i < row.length; i++) {
                                                                        var ResRow = row[i];

                                                                        var AdditionalAmount = ResRow.AdditionalAmount;


                                                                    }
                                                                }

                                                                $('[argumentid="AdditionalAmount"]', t.el).val(AdditionalAmount.toFixed(3));
                                                            }

                                                            //var frm = AsyncWidgets.get('frmAdditionalAmount');

                                                            //var AdditionalAmount = val('AdditionalAmount',frm.el)
                                                            var a = $('div.SalesAdditionalAmountPanelDiv')
                                                            if ($('table.SalesAdditonalAmountPanel', a).length > 0) {
                                                                $('table.SalesAdditonalAmountPanel', a).show();
                                                            }

                                                        });
                                                    }
                                                </script>
                                            </Scripts>
                                        </AW:Form>

                                    </div>


                                    <div class="tab-pane container fade" tabid="SalesContractComments" id="SalesContractComments">
                                        <div class="container SalesContractCommentsPanel mt-4">
                                            <!-- Card for Comments Panel -->
                                            <div class="card">
                                                <div class="card-header d-flex justify-content-between align-items-center">
                                                    <!-- Title -->
                                                    <h5 class="mb-0">Comments</h5>
                                                    <!-- Toggle Icon -->
                                                    <i class="fas fa-minus text-primary toggle-icon" style="cursor: pointer; font-size: 1.5rem;" data-bs-toggle="collapse" data-bs-target="#collapseCommentsPanel" aria-expanded="true" aria-controls="collapseCommentsPanel"></i>
                                                </div>

                                                <!-- Collapsible Content (Default Open) -->
                                                <div class="collapse show" id="collapseCommentsPanel">
                                                    <div class="card-body SalesCommentsPanelDiv">
                                                        <!-- Row 1: Contract No. -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Contract No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="RecCodePanel"></span>
                                                            </div>
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-3"></div>
                                                        </div>

                                                        <!-- Row 2: Car No. and Customer Name -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold">Car No.:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CarNumberPanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold">Customer Name:</div>
                                                            <div class="col-md-3">
                                                                <span groupid="SalesContractsForm" argumentid="CustomerNamePanel"></span>
                                                            </div>
                                                        </div>

                                                        <!-- Row 3: Amount Due and Amount Received -->
                                                        <div class="row mb-3 align-items-center">
                                                            <div class="col-md-3 fw-bold text-danger">Amount Due:</div>
                                                            <div class="col-md-3 text-danger">
                                                                <span groupid="SalesContractsForm" argumentid="AmountDuePanel"></span>
                                                            </div>
                                                            <div class="col-md-3 fw-bold text-success">Amount Received:</div>
                                                            <div class="col-md-3 text-success">
                                                                <span groupid="SalesContractsForm" argumentid="PaymentAmountPanel"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <AW:DataGrid ID="grdSalesContractComments" LoadOnInit="true" ShowOnLoad="false" runat="server"
                                            Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                                            PageSize="10" DataSource="SEL_iRental_SalesContracts_Comments" ContainerMargin="2px"
                                            GridTemplate="jQueryUI" GridHeadText="Comments" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_Comments\',KeysCol:\'RecId\'}}}">
                                            <GridConfig>
                                                <script>
                                                    cf = {
                                                        cols: {
                                                            Sequence: { width: '0px' },
                                                            RecId: { width: '0px' },
                                                            ParentRecId: { width: '0px' },
                                                            Comments: { caption: 'Comments' },
                                                            DateCreated: { caption: 'Date Created', width: '130px' },
                                                            CreatedBy: { caption: 'Created By', width: '150px' }
                                                        },
                                                        forms: {
                                                            NewFormId: 'frmSalesComments',
                                                            EditFormId: 'frmSalesComments',
                                                            Keys: 'RecId'
                                                        }
                                                    };
                                                </script>
                                            </GridConfig>
                                            <Scripts>
                                                <script>
                                                    var fn = function () {
                                                        // Event listener for the collapse element
                                                        $('#collapseCommentsPanel').on('show.bs.collapse', function () {
                                                            $('.toggle-icon').removeClass('fa-plus').addClass('fa-minus');
                                                        });

                                                        $('#collapseCommentsPanel').on('hide.bs.collapse', function () {
                                                            $('.toggle-icon').removeClass('fa-minus').addClass('fa-plus');
                                                        });
                                                        t.on('beforeSearchGetForm', function (P) {
                                                            var frm = AsyncWidgets.get('frmSalesContracts');
                                                            var RecId = P.ParentRecId = frm.GetArgVal('RecId');

                                                            var params = {
                                                                Command: 'SEL_iRental_SalesContracts',
                                                                RecId: `${RecId}`,


                                                            };

                                                            // Assuming ServerCall is a function to make an API call
                                                            ServerCall(params, function (res) {

                                                                //  var res = decJSON(res)


                                                                if (res.status === 'OK') {

                                                                    if (res.Response.Rows.length > 0) {
                                                                        var rows = res.Response.Rows;
                                                                        for (var i = 0; i < rows.length; i++) {
                                                                            var row = rows[i];
                                                                            var RecCode = row.RecCode;
                                                                            var CarNumber = row.CarNumber;
                                                                            var CustomerName = row.CustomerName;
                                                                            var AmountDue = row.AmountDue;
                                                                            var PaymentAmount = row.PaymentAmount;



                                                                        }


                                                                        var a = $('.container .SalesContractCommentsPanel')
                                                                        $('[argumentid="RecCodePanel"]', a).text(RecCode);
                                                                        $('[argumentid="CarNumberPanel"]', a).text(CarNumber);
                                                                        $('[argumentid="CustomerNamePanel"]', a).text(CustomerName);
                                                                        $('[argumentid="AmountDuePanel"]', a).text(AmountDue.toFixed(3));
                                                                        $('[argumentid="PaymentAmountPanel"]', a).text(PaymentAmount.toFixed(3));




                                                                    }

                                                                }




                                                            }, 'GetData');
                                                        });
                                                    }
                                                </script>
                                            </Scripts>
                                        </AW:DataGrid>
                                        <AW:Form ID="frmSalesComments" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                                            AsyncForm="~/Pages/eForms/iRental/SalesContracts_CS_FrUc.ascx">
                                            <WidgetConfig>
                                                <script>
                                                    cf = {

                                                        header: {
                                                            Style: {},
                                                            Visible: true,
                                                            Collapsed: false,
                                                            HeadText: 'Comments'
                                                        }
                                                    }
                                                </script>
                                            </WidgetConfig>
                                            <Scripts>
                                                <script>
                                                    var fn = function () {

                                                        t.on('show', function (args) {
                                                            var frm = AsyncWidgets.get('frmSalesContracts');

                                                            var b = $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));

                                                            var a = $('.container .SalesContractCommentsPanel')
                                                            if ($('table.SalesCommentsPanel', a).length > 0) {
                                                                $('table.SalesCommentsPanel', a).show();
                                                            }
                                                        });

                                                        t.on('onLoadedValues', function (p) {

                                                            var a = $('div.SalesCommentsPanelDiv')
                                                            if ($('table.SalesCommentsPanel', a).length > 0) {
                                                                $('table.SalesCommentsPanel', a).show();
                                                            }

                                                        });

                                                        $('.CSCloseForm', t.el).on('click', function () {


                                                            var a = $('div.SalesCommentsPanelDiv')
                                                            if ($('table.SalesCommentsPanel', a).length > 0) {
                                                                $('table.SalesCommentsPanel', a).show();
                                                            }


                                                        });

                                                        /*$()*/
                                                    }
                                                </script>
                                            </Scripts>
                                        </AW:Form>

                                    </div>

                                </div>



                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>






