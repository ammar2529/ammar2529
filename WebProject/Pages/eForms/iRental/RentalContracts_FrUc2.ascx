<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_FrUc2" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<script src="Scripts/eForms/iRental/frmiRentalPaymentsDetail.js"></script>

<%--<style>
    .Rental .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
        background-color: #cfcece;
    }
</style>--%>
<div class=" Rental">

        <div class="card">
        <div class="card-body">
            <div class="row mb-2">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Rental Contracts</span>
						                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; 
                               transition: color 0.3s ease; position: absolute; 
                               right: 10px;"
                        onmouseover="this.style.color='red';" 
                        onmouseout="this.style.color='black';">
                    </i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <ul class="nav nav-tabs SimpleTab align-items-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" tabid="RentalContractDetails" href="#RentalContractDetails">Contract Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" tabid="RentalPaymentDetails" href="#RentalPaymentDetails">Payment Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" tabid="RentalOtherCharges" href="#RentalOtherCharges">Other Charges</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" tabid="RentalContractComments" href="#RentalContractComments">Comments</a>
                        </li>


                    </ul>




    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane  active" tabid="RentalContractDetails" id="RentalContractDetails">
 
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info alert-dismissible fade show mt-3 position-relative" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory

                </div>
            </div>


            <div style="display: none">
                <span groupid="RentalContractsForm" argumentid="RecId"></span>
                <span groupid="RentalContractsForm" argumentid="StateId"></span>
            </div>
            <!-- Contract Number and Status -->
            <div class="row mb-3 justify-content-center">
                <!-- Contract No. -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-3 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext text-danger fw-bold" id="ContractNo" groupid="RentalContractsForm" argumentid="RecCode" value="New contract no. will be generated on saving" readonly>
                        <label for="ContractNo">Contract No.</label>
                    </div>
                </div>

                <!-- Contract Status -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="ContractStatus" groupid="RentalContractsForm" argumentid="StateName" value="" readonly>
                        <label for="ContractStatus">Contract Status</label>
                    </div>
                </div>
            </div>


            <!-- Contract Mileage Type and Location -->
            <div class="row mb-3 justify-content-center">

                <div class="col-12 col-sm-6 col-lg-2 text-start ">
                    <label for="floatingLimited">
                        <small><b>Contract Mileage Type*:</b></small>
                    </label>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 text-start mb-3 mb-md-0">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input CommonDisable" type="radio" id="MileageLimited" name="ContractTypeOL" value="Limited" checked groupid="RentalContractsForm" argumentid="ContractTypeOL">
                        <label class="form-check-label" for="MileageLimited">Limited</label>
                    </div>
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input CommonDisable" type="radio" id="MileageOpen" name="ContractTypeOL" value="Open" groupid="RentalContractsForm" argumentid="ContractTypeOL">
                        <label class="form-check-label" for="MileageOpen">Open</label>
                    </div>
                </div>


                <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required CommonDisable" id="OutLocation" groupid="RentalContractsForm" argumentid="OutLocationId" loadon="FirstVisible"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected>Select Location</option>
                        </select>
                        <label for="OutLocation">Contract Out Location*</label>
                    </div>
                </div>

            </div>

            <%--            <div class="row my-3 ">
                <div class="col-12 col-sm-none col-lg-4 ">
                </div>--%>

            <!-- Car Number and Customer Code -->
            <div class="row mb-2 justify-content-center">
                <!-- Car Number -->
                <div class="col-12 col-sm-none col-md-none col-lg-2">
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required CommonDisable text-danger fw-bold" id="CarNumber" maxlength="10" groupid="RentalContractsForm" argumentid="CarNumber" placeholder="Car Number">
                        <label for="CarNumber">Car Number*</label>
                    </div>
                </div>

                <!-- Customer Code -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required CommonDisable text-danger fw-bold" id="CustomerCode" maxlength="10" groupid="RentalContractsForm" argumentid="CustomerRecCode" placeholder="Customer Code">
                        <label for="CustomerCode">Customer Code*</label>
                    </div>
                    <div class="position-absolute top-0 end-0 me-2 w-ui-icon w-ui-panel-icon-closed contDetailsIcon" style="height: 20px; cursor: pointer;">&nbsp;</div>
                </div>
                <div class="col-12 col-sm-none col-md-none col-lg-2 text-start">
                    <span>
                        <i class="contDetailsIconMD  fa-solid fa-circle-plus"></i>
                    </span>
                </div>
            </div>


            <!-- Additional Rows -->
            <div class="row mb-2 justify-content-center">
                <!-- Chassis Number -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="ChassisNumber" groupid="RentalContractsForm" argumentid="ChassisNo" placeholder="Chassis Number" readonly>
                        <label for="ChassisNumber">Chassis Number</label>
                    </div>
                </div>

                <!-- Name -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext text-center" id="CustomerName" groupid="RentalContractsForm" argumentid="CustomerName" placeholder="Name" readonly>
                        <label for="CustomerName">Name</label>
                    </div>
                </div>
            </div>
            <div class="row mb-2 justify-content-center">
                <!-- Brand -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="RNBrand" groupid="RentalContractsForm" argumentid="Brand" placeholder="Brand" readonly>
                        <label for="RNBrand">Brand</label>
                    </div>
                </div>

                <!-- Type -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CustomerType" groupid="RentalContractsForm" argumentid="CustomerType" placeholder="Type" readonly>
                        <label for="CustomerType">Type</label>
                    </div>
                </div>
            </div>

            <div class="row mb-3 justify-content-center">
                <!-- Model -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Model" groupid="RentalContractsForm" argumentid="Model" placeholder="Model" readonly>
                        <label for="Model">Model</label>
                    </div>
                </div>

                <!-- Nationality -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Nationality" groupid="RentalContractsForm" argumentid="Nationality" placeholder="Nationality" readonly>
                        <label for="Nationality">Nationality</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Year -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CarYear" groupid="RentalContractsForm" argumentid="CarYear" placeholder="Year" readonly>
                        <label for="CarYear">Year</label>
                    </div>
                </div>

                <!-- Gender -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Gender" groupid="RentalContractsForm" argumentid="Gender" placeholder="Gender" readonly>
                        <label for="Gender">Gender</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Color -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Color" groupid="RentalContractsForm" argumentid="Color" placeholder="Color" readonly>
                        <label for="Color">Color</label>
                    </div>
                </div>

                <!-- Passport No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="PassportNo" groupid="RentalContractsForm" argumentid="PassportNo" placeholder="Passport No." readonly>
                        <label for="PassportNo">Passport No.</label>
                    </div>
                </div>
                <%--                    <div class="col-12 col-sm-6 col-lg-2">
                        <div class="form-floating mt-3">
                            <input type="text" class="form-control-plaintext" id="PassportExpiry" groupid="RentalContractsForm" argumentid="PassportExpiry" placeholder="Passport Expiry" readonly>
                            <label for="PassportExpiry"></label>
                        </div>
                    </div>--%>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Type -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Type" groupid="RentalContractsForm" argumentid="Type" placeholder="Type" readonly>
                        <label for="Type">Type</label>
                    </div>
                </div>

                <!-- National ID No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="NationalIDNo" groupid="RentalContractsForm" argumentid="NationalIDNo" placeholder="National ID No." readonly>
                        <label for="NationalIDNo">National ID No.</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="NationalIDExpiryDate" groupid="RentalContractsForm" argumentid="NationalIDExpiryDate" placeholder="ID Expiry Date" readonly>
                        <label for="NationalIDExpiryDate">ID Expiry Date</label>
                    </div>--%>
                </div>
            </div>


            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Insurance -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="InsuranceExpiry" groupid="RentalContractsForm" argumentid="InsuranceExpiry" placeholder="Insurance Expiry" readonly>
                        <label for="InsuranceExpiry">Insurance Expiry</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="FullInsuranceExpiry" groupid="RentalContractsForm" argumentid="FullInsuranceExpiry" placeholder="Full Insurance Expiry" readonly>
                        <label for="FullInsuranceExpiry">Full Insurance Expiry</label>
                    </div>--%>
                </div>

                <!-- Driving License No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="DrivingLicenseNo" groupid="RentalContractsForm" argumentid="DrivingLicenseNo" placeholder="Driving License No." readonly>
                        <label for="DrivingLicenseNo">Driving License No.</label>
                    </div>
                </div>
                <%--                <div class="col-12 col-sm-6 col-lg-2">
                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="DrivingLicenseExpiry" groupid="RentalContractsForm" argumentid="DrivingLicenseExpiry" placeholder="License Expiry" readonly>
                        <label for="DrivingLicenseExpiry">License Expiry</label>
                    </div>
                </div>--%>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Previous Mileage (KM) -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CarPreviousKM" groupid="RentalContractsForm" argumentid="CarPreviousKM" placeholder="Previous Mileage" readonly>
                        <label for="CarPreviousKM">Previous Mileage (KM)</label>
                    </div>
                </div>

                <!-- Work & Res. Telephone -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="WorkTelephone" groupid="RentalContractsForm" argumentid="WorkTelephone" placeholder="Work Telephone" readonly>
                        <label for="WorkTelephone">Work Telephone</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="ResidenceTelephone" groupid="RentalContractsForm" argumentid="ResidenceTelephone" placeholder="Residence Telephone" readonly>
                        <label for="ResidenceTelephone">Residence Telephone</label>
                    </div>--%>
                </div>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Car Out Mileage -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number CommonDisable" id="ContractKMOut" maxlength="10" groupid="RentalContractsForm" argumentid="ContractKMOut" placeholder="Car Out Mileage*">
                        <label for="ContractKMOut">Car Out Mileage*</label>
                    </div>
                </div>

                <!-- Mobile Telephone -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="MobileTelephone1" groupid="RentalContractsForm" argumentid="MobileTelephone1" placeholder="Mobile Telephone 1" readonly>
                        <label for="MobileTelephone1">Mobile Telephone 1</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="MobileTelephone2" groupid="RentalContractsForm" argumentid="MobileTelephone2" placeholder="Mobile Telephone 2" readonly>
                        <label for="MobileTelephone2">Mobile Telephone 2</label>
                    </div>--%>
                </div>
            </div>

            <div class="row mb-3  align-items-center">
                <!-- Spacer -->
                <div class="col-12 col-sm-none col-lg-1"></div>

                <!-- Contract Start Date -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="date" class="form-control text required date CommonDisable" id="ContractStartDate" groupid="RentalContractsForm" argumentid="ContractStartDate" maxlength="10" placeholder="Contract Start Date*" requirederr="*">
                        <label for="ContractStartDate">Contract Start Date*</label>
                    </div>
                </div>

                <!-- Start Day -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractStartDay" groupid="RentalContractsForm" argumentid="ContractStartDay" maxlength="10" placeholder="Start Day" readonly>
                        <label for="ContractStartDay">Start Day</label>
                    </div>
                </div>

                <!-- Start Time -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractStartTime" groupid="RentalContractsForm" argumentid="ContractStartTime" maxlength="10" placeholder="Start Time" readonly>
                        <label for="ContractStartTime">Start Time</label>
                    </div>
                </div>

                <!-- Rate Type -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required CommonDisable" id="CarRateType" groupid="RentalContractsForm" argumentid="CarRateType" storeinfo="{Command:'SEL_iRental_Contracts_RateTypes',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'Brand',SPParamName:'Brand'},{Name:'Model',SPParamName:'Model'},{Name:'CarYear',SPParamName:'CarYear'}],ItemExtraAttrs:['CarRate','CarAllowedKM','CarExtraKMRate']}">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select>
                        <label for="CarRateType">Rate Type*</label>
                    </div>
                </div>

                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>


            <div class="row mb-3 justify-content-center align-items-center">
                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>

                <!-- Contract Expiry Date -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="date" class="form-control text required date DisableOnClose" id="ContractExpiryDate" groupid="RentalContractsForm" argumentid="ContractExpiryDate" maxlength="10" placeholder="Contract Expiry Date*" requirederr="*">
                        <label for="ContractExpiryDate">Contract Expiry Date*</label>
                    </div>
                </div>

                <!-- Expiry Day -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractExpiryDay" groupid="RentalContractsForm" argumentid="ContractExpiryDay" maxlength="10" placeholder="Expiry Day" readonly>
                        <label for="ContractExpiryDay">Expiry Day</label>
                    </div>
                </div>

                <!-- Expiry Time -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractExpiryTime" groupid="RentalContractsForm" argumentid="ContractExpiryTime" maxlength="10" placeholder="Expiry Time" readonly>
                        <label for="ContractExpiryTime">Expiry Time</label>
                    </div>
                </div>

                <!-- Contract Days -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractDays" groupid="RentalContractsForm" argumentid="ContractDays" maxlength="10" placeholder="Contract Days" readonly>
                        <label for="ContractDays">Contract Days</label>
                    </div>
                </div>

                <!-- Daily Rental Rate -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number AlwaysDisable" id="CarRate" groupid="RentalContractsForm" argumentid="CarRate" maxlength="10" placeholder="Daily Rental Rate (KD)*" alphconf="{allow:'.'}">
                        <label for="CarRate">Daily Rental Rate (KD)*</label>
                    </div>
                </div>

                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>

            <div class="row mb-3 justify-content-center align-items-center">
                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>

                <!-- Contract End Date -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating OnLoadHide">
                        <input type="date" class="form-control text date  AlwaysDisable SuperUserEdit" id="ContractEndDate" groupid="RentalContractsForm" argumentid="ContractEndDate" maxlength="10" placeholder="Contract End Date">
                        <label class="OnLoadHide" for="ContractEndDate">Contract End Date</label>
                    </div>
                </div>

                <!-- End Day -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text OnLoadHide AlwaysDisable" id="ContractEndDay" groupid="RentalContractsForm" argumentid="ContractEndDay" maxlength="10" placeholder="End Day" readonly>
                        <label class="OnLoadHide" for="ContractEndDay">End Day</label>
                    </div>
                </div>

                <!-- End Time -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text OnLoadHide AlwaysDisable" id="ContractEndTime" groupid="RentalContractsForm" argumentid="ContractEndTime" maxlength="10" placeholder="End Time" readonly>
                        <label class="OnLoadHide" for="ContractEndTime">End Time</label>
                    </div>
                </div>

                <!-- Actual Contract Days -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text OnLoadHide AlwaysDisable" id="ActualContractDays" groupid="RentalContractsForm" argumentid="ActualContractDays" maxlength="10" placeholder="Actual Contract Days" readonly>
                        <label class="OnLoadHide" for="ActualContractDays">Actual Contract Days</label>
                    </div>
                </div>

                <!-- Daily Mileage (KM) Limit -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number MileageType AlwaysDisable" id="CarAllowedKM" groupid="RentalContractsForm" argumentid="CarAllowedKM" maxlength="10" placeholder="Daily Mileage (KM) Limit*">
                        <label for="CarAllowedKM" class="MileageType">Daily Mileage (KM) Limit*</label>
                    </div>
                </div>

                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>



            <!-- Row 1: Car In Mileage and Rental Charges -->
            <div class="row OnLoadHide mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number DisableOnClose dependent" id="ContractKMIn" style="text-align: center;" maxlength="10"
                            groupid="RentalContractsForm" requirederr="*" deperr="Contract KM In should be greater than Contract KM Out..."
                            blurvalidate="false" argumentid="ContractKMIn" operator=">" depchildid="ContractKMOut" placeholder="Car In Mileage">
                        <label for="ContractKMIn">Car In Mileage*</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractPeriodCharges" groupid="RentalContractsForm" argumentid="ContractPeriodCharges"></span>
                        <label for="ContractPeriodCharges">Rental Charges</label>
                    </div>
                </div>
            </div>

            <!-- Row 2: Extra Mileage and Extra Mileage Charges -->
            <div class="row OnLoadHide mb-2 justify-content-center MileageTypeCharges">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractExtraKM" groupid="RentalContractsForm" argumentid="ContractExtraKM"></span>
                        <label for="ContractExtraKM">Extra Mileage</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractExtraKMCharges" argumentid="ContractExtraKMCharges" groupid="RentalContractsForm"></span>
                        <label for="ContractExtraKMCharges">Extra Mileage Charges</label>
                    </div>
                </div>
            </div>

            <!-- Row 3: Discount and Other Charges -->
            <div class="row OnLoadHide mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number AlwaysDisable SuperUserEdit" id="ContractDiscount" style="text-align: center;" maxlength="10"
                            groupid="RentalContractsForm" argumentid="ContractDiscount" alphconf="{allow:'.'}" placeholder="Discount">
                        <label for="ContractDiscount">Discount</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractOtherCharges" argumentid="ContractOtherCharges" groupid="RentalContractsForm"></span>
                        <label for="ContractOtherCharges">Other Charges</label>
                    </div>
                </div>
            </div>

            <!-- Row 4: Contract In Location and Grand Total -->
            <div class="row OnLoadHide mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist AlwaysDisable SuperUserEdit" id="InLocationId" argumentid="InLocationId" groupid="RentalContractsForm"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="InLocationId">Contract In Location</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractTotalCharges" argumentid="ContractTotalCharges" groupid="RentalContractsForm"></span>
                        <label for="ContractTotalCharges">Grand Total</label>
                    </div>
                </div>
            </div>

            <div class="row OnLoadHide mb-3 justify-content-center">
                <!-- Amount Received -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-3 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext ftitle text-success fw-bold" id="TotalPaidByCustomer"
                            groupid="RentalContractsForm" argumentid="TotalPaidByCustomer" value="" readonly>
                        <label for="TotalPaidByCustomer" style="color: Green; font-size: 12px;">Amount Received (KD)</label>
                    </div>
                </div>

                <!-- Amount Due -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext ftitle text-danger" id="TotalAmountDue"
                            groupid="RentalContractsForm" argumentid="TotalAmountDue" value="" readonly>
                        <label for="TotalAmountDue" style="color: Red; font-size: 12px;">Amount Due</label>
                    </div>
                </div>
            </div>



            <!-- Buttons Section -->
            <div class="container text-center ">
                <div class="row mt-3 justify-content-center">
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-primary btn-lg w-100 DataAction ButtonStyle btn_1" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractOpen'},HideOnSuccess:false,Requery:true}">
                            Open Contract - Car Out
                        </button>
                    </div>
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-primary btn-lg w-100 DataAction ButtonStyle btn_2" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractOpenCarIn'},HideOnSuccess:false,Requery:true}">
                            Open Contract - Car In
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-warning w-100 DataAction ButtonStyle btn_3" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',Params:{NewStateId:'RRCContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}">
                            Close Contract - Pending Payment
                        </button>
                    </div>
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-success w-100 DataAction ButtonStyle btn_4" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:false, Requery:true}">
                            Close Contract - Payment Cleared
                        </button>
                    </div>
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_5" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:false, Requery:true}">
                            Cancel Contract
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_6" ignorevalidate="all" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarOut'}, HideOnSuccess:false, Requery:true}">
                            To Legal - Contract Open - Car Out
                        </button>
                    </div>
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_7" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarIn'}, HideOnSuccess:false,Requery:true}">
                            To Legal - Contract Open - Car In
                        </button>
                    </div>
                    <div class="col-md-4 mb-2 ">
                        <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_8" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}">
                            To Legal - Contract Closed
                        </button>
                    </div>
                </div>
                <div class="row mt-1 mb-3 justify-content-center">
                    <div class="col-lg-2 colo-sm-12 colo-md-12 Button_Edit">
                        <button type="button" class="btn btn-outline-secondary ButtonStyle Button_Edit w-100" roles="iRen_Contracts_Admin">
                            Edit
                        </button>
                    </div>
                    <div class="col-lg-2 colo-sm-12 colo-md-12 btn_11 ">
                        <button type="button" class="btn btn-primary DataAction ButtonStyle btn_11 w-100" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',HideOnSuccess:true, Requery:false, GroupId:'RentalContractsForm'}">
                            Save
                        </button>
                    </div>
                    <div class="col-lg-2 colo-sm-12 colo-md-12 btn_10">
                        <button type="button" class="btn btn-primary DataAction ButtonStyle btn_10 w-100" ignorevalidate="ContractKMIn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',HideOnSuccess:false, Requery:false, GroupId:'RentalContractsForm'}">
                            Save
                        </button>
                    </div>
                    <div class="col-lg-2 colo-sm-12 colo-md-12 btn_9 ">
                        <button type="button" class="btn btn-secondary ButtonStyle btn_9 w-100">
                            Print
                        </button>
                    </div>
                    <div class="col-lg-2 colo-sm-12 colo-md-12 PrintStatementRental">
                        <button type="button" class="btn btn-secondary ButtonStyle PrintStatementRental w-100">
                            Statement
                        </button>
                    </div>
                    <div class="col-lg-2 colo-sm-12 colo-md-12">
                        <button type="button" class="btn btn-secondary CloseForm ButtonStyle w-100">
                            Close
                        </button>
                    </div>
                </div>
                <div class="row text-start">
                    <div class="col-12">
                        <small class="text-muted fst-italic">Note: Contract can be closed only if amount due is KD 0.000/-</small>
                    </div>
                </div>
            </div>


        </div>
        <div class="tab-pane container fade" tabid="RentalPaymentDetails" id="RentalPaymentDetails">

                <AW:DataGrid ID="grdRentalPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                    Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                    PageSize="20" DataSource="SEL_iRental_Contracts_Payments" ContainerMargin="2px"
                    GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_Payments\',KeysCol:\'RecId\'}}}">
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
                                    NewFormId: 'frmRentalPaymentDetails',
                                    EditFormId: 'frmRentalPaymentDetails',
                                    Keys: 'RecId'
                                }
                            };
                        </script>
                    </GridConfig>
                    <RowDetail>
                        <pre class="" colindex="4">
                    <AW:container id="conRentalPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdRentalPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_Contracts_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
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
                    </script>
                </GridConfig>
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
                    </script>
                </Scripts>
                </AW:DataGrid>
                </div>
                    </Childern>
                    </AW:container>
                     </pre>
                    </RowDetail>

                </AW:DataGrid>


                <AW:Form ID="frmRentalPaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/RentalContracts_PD_FrUc2.ascx">
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
                            var fn = function () {

                                //On Change of Amount Update Amount in Words
                            }
                        </script>
                    </Scripts>
                </AW:Form>


            </div>

        <div class="tab-pane container fade" tabid="RentalOtherCharges"  id="RentalOtherCharges">
 
                <AW:DataGrid ID="grdRentalOtherCharges" LoadOnInit="true" ShowOnLoad="false" runat="server" Hidden="true" Columns="1"
                    EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                    PageSize="10" DataSource="SEL_iRental_Contracts_OtherCharges" ContainerMargin="2px" GridTemplate="jQueryUI"
                    GridHeadText="Other Charges" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_OtherCharges\',KeysCol:\'RecId\'}}}">

                    <GridConfig>
                        <script>
                            cf = {
                                cols: {
                                    Sequence: { width: '0px' },
                                    RecId: { width: '70px', caption: 'ID' },
                                    ParentRecId: { width: '0px' },
                                    Description: { caption: 'Description' },
                                    Charges: { caption: 'Amount', width: '90px' },
                                    DateCreated: { caption: 'Date Created', width: '130px' },
                                    CreatedBy: { caption: 'Created By', width: '150px' },
                                    StateId: { width: '0px' }
                                },
                                forms: {
                                    NewFormId: 'frmRentalOtherCharges',
                                    EditFormId: 'frmRentalOtherCharges',
                                    Keys: 'RecId'
                                }
                            };
                        </script>
                    </GridConfig>
                    <Scripts>
                        <script>
                            var fn = function () {
                                t.on('beforeSearchGetForm', function (P) {
                                    var frm = AsyncWidgets.get('frmRentalContracts');
                                    P.ParentRecId = frm.GetArgVal('RecId');
                                });
                                t.on('beforeRowDelete', function (P) {
                                    var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
                                    pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
                                    P.cf['ParentRecId'] = pVal;
                                });
                                t.on('rowsRendered', function () {

                                    var frm = AsyncWidgets.get('frmRentalContracts');
                                    var strMainStateId = frm.GetArgVal('StateId');

                                    $('[colid="Charges"]:not(".w-grid-head-cell")').each(function () {
                                        var ptr = $(this).closest('tr');
                                        $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
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
                                });

                                t.on('onNoRecords', function () {
                                    t.fireEvent('rowsRendered');
                                });
                            }
                        </script>
                    </Scripts>
                    <RowDetail>
                        <pre class="" colindex="3">
                    <AW:container id="conRentalOtherCharges_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdRentalOtherCharges_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_Contracts_OtherCharges_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '111px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description' },
                                Charges: { caption: 'Amount', width: '90px' },
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
                                $('[colid="Charges"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
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

                <AW:Form ID="frmRentalOtherCharges" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                    AsyncForm="~/Pages/eForms/iRental/RentalContracts_OC_FrUc2.ascx">
                    <WidgetConfig>
                        <script>
                            cf = {

                                header: {
                                    Style: {},
                                    Visible: true,
                                    Collapsed: false,
                                    HeadText: 'Other Charges'
                                }
                            }
                        </script>
                    </WidgetConfig>
                    <Scripts>
                        <script>
                            var fn = function () {

                                t.on('show', function (args) {
                                    var frm = AsyncWidgets.get('frmRentalContracts');
                                    $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                                });
                            }
                        </script>
                    </Scripts>
                </AW:Form>
            </div>

  
         <div class="tab-pane container fade" tabid="RentalContractComments" id="RentalContractComments">

                <AW:DataGrid ID="grdRentalContractComments" LoadOnInit="true" ShowOnLoad="false" runat="server"
                    Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                    PageSize="10" DataSource="SEL_iRental_Contracts_Comments" ContainerMargin="2px"
                    GridTemplate="jQueryUI" GridHeadText="Comments" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_Comments\',KeysCol:\'RecId\'}}}">
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
                                    NewFormId: 'frmRentalComments',
                                    EditFormId: 'frmRentalComments',
                                    Keys: 'RecId'
                                }
                            };
                        </script>
                    </GridConfig>
                    <Scripts>
                        <script>
                            var fn = function () {
                                t.on('beforeSearchGetForm', function (P) {
                                    var frm = AsyncWidgets.get('frmRentalContracts');
                                    P.ParentRecId = frm.GetArgVal('RecId');
                                });
                            }
                        </script>
                    </Scripts>
                </AW:DataGrid>

                <AW:Form ID="frmRentalComments" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                    AsyncForm="~/Pages/eForms/iRental/RentalContracts_CS_FrUc2.ascx">
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
                                    var frm = AsyncWidgets.get('frmRentalContracts');
                                    $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                                });
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
    <!-- Nav tabs -->

</div>
