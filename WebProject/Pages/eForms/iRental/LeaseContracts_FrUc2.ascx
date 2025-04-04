<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaseContracts_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.LeaseContracts_FrUc2" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<script src="../../../Scripts/eForms/iRental/ConLeaseContracts.js"></script>

<div class="container LeaseFormContainer">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs SimpleTab align-items-center" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" tabid="LeaseContractDetails" href="#LeaseContractDetails">Contract Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" tabid="LeasePaymentDetails" href="#LeasePaymentDetails">Payment Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" tabid="LeaseOtherCharges" href="#LeaseOtherCharges">Other Charges</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" tabid="LeaseContractComments" href="#LeaseContractComments">Comments</a>
        </li>

        <!-- Close Icon -->
        <li class="ms-auto" style="padding-right: 10px;">
            <i
                class="fa-regular fa-rectangle-xmark CloseForm"
                tabid="CloseBtn"
                title="Close Form"
                style="font-size: 20px; color: black; cursor: pointer; transition: all 0.3s ease;"
                onmouseover="this.style.color='red';"
                onmouseout="this.style.color='black';"></i>
        </li>
    </ul>




    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane container active" tabid="ContractDetails" id="LeaseContractDetails">


            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info alert-dismissible fade show mt-3 position-relative" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
       
                </div>
            </div>


            <div style="display: none">
                <span groupid="LeaseContractsForm" argumentid="RecId"></span><span groupid="LeaseContractsForm"
                    argumentid="StateId"></span>
            </div>
            <!-- Contract Number and Status -->
            <div class="row mb-3 justify-content-center OnNewHide">
                <!-- Contract No. -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-3 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext text-danger fw-bold" id="RecCode" groupid="LeaseContractsForm" argumentid="RecCode" value="New contract no. will be generated on saving" readonly>
                        <label for="RecCode">Contract No.</label>
                    </div>
                </div>

                <!-- Contract Status -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="StateName" groupid="LeaseContractsForm" argumentid="StateName" value="" readonly>
                        <label for="StateName">Contract Status</label>
                    </div>
                </div>
            </div>


            <!-- Contract Mileage Type and Location -->
            <%--         <div class="row mb-3 justify-content-center">

                <div class="col-12 col-sm-6 col-lg-2 text-start ">
                    <label for="floatingLimited">
                        <small><b>Contract Mileage Type*:</b></small>
                    </label>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 text-start mb-3 mb-md-0">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input CommonDisable" type="radio" id="MileageLimited" name="ContractTypeOL" value="Limited" checked groupid="LeaseContractsForm" argumentid="ContractTypeOL">
                        <label class="form-check-label" for="MileageLimited">Limited</label>
                    </div>
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input CommonDisable" type="radio" id="MileageOpen" name="ContractTypeOL" value="Open" groupid="LeaseContractsForm" argumentid="ContractTypeOL">
                        <label class="form-check-label" for="MileageOpen">Open</label>
                    </div>
                </div>


                <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required CommonDisable" id="OutLocation" groupid="LeaseContractsForm" argumentid="OutLocationId" loadon="FirstVisible"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected>Select Location</option>
                        </select>
                        <label for="OutLocation">Contract Out Location*</label>
                    </div>
                </div>

            </div>--%>

            <%--            <div class="row my-3 ">
                <div class="col-12 col-sm-none col-lg-4 ">
                </div>--%>

            <div class="row mb-2 ">
                <!-- Car Number -->
                <div class="col-12 col-sm-none col-md-none col-lg-2">
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required CommonDisable" id="OutLocationId" loadon="FirstVisible" groupid="LeaseContractsForm" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select>
                        <label for="OutLocationId">OutLocationId</label>
                    </div>
                </div>
            </div>

            <!-- Car Number and Customer Code -->
            <div class="row mb-2 justify-content-center">
                <!-- Car Number -->
                <div class="col-12 col-sm-none col-md-none col-lg-2">
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required CommonDisable text-danger fw-bold" id="CarNumber" maxlength="10" groupid="LeaseContractsForm" argumentid="CarNumber" placeholder="Car Number">
                        <label for="CarNumber">Car Number*</label>
                    </div>
                </div>

                <!-- Customer Code -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required CommonDisable text-danger fw-bold" id="CustomerCode" maxlength="10" groupid="LeaseContractsForm" argumentid="CustomerRecCode" placeholder="Customer Code">
                        <label for="CustomerCode">Customer Code*</label>
                    </div>
                    <div class="position-absolute top-0 end-0 me-2 w-ui-icon w-ui-panel-icon-closed contDetailsIcon" style="height: 20px; cursor: pointer;">&nbsp;</div>
                </div>
                <div class="col-12 col-sm-none col-md-none col-lg-2 text-start">
                    <span>
                        <i class="contDetailsIconMDLease  fa-solid fa-circle-plus"></i>
                    </span>
                </div>
            </div>


            <!-- Additional Rows -->
            <div class="row mb-2 justify-content-center">
                <!-- Chassis Number -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="ChassisNumber" groupid="LeaseContractsForm" argumentid="ChassisNo" placeholder="Chassis Number" readonly>
                        <label for="ChassisNumber">Chassis Number</label>
                    </div>
                </div>

                <!-- Name -->

                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext text-center" id="CustomerName" groupid="LeaseContractsForm" argumentid="CustomerName" placeholder="Name" readonly>
                        <label for="CustomerName">Name</label>
                    </div>
                </div>
            </div>
            <div class="row mb-2 justify-content-center">
                <!-- Brand -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Brand" groupid="LeaseContractsForm" argumentid="Brand" placeholder="Brand" readonly>
                        <label for="Brand">Brand</label>
                    </div>
                </div>

                <!-- Type -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CustomerType" groupid="LeaseContractsForm" argumentid="CustomerType" placeholder="Type" readonly>
                        <label for="CustomerType">Type</label>
                    </div>
                </div>
            </div>

            <div class="row mb-3 justify-content-center">
                <!-- Model -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Model" groupid="LeaseContractsForm" argumentid="Model" placeholder="Model" readonly>
                        <label for="Model">Model</label>
                    </div>
                </div>

                <!-- Nationality -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Nationality" groupid="LeaseContractsForm" argumentid="Nationality" placeholder="Nationality" readonly>
                        <label for="Nationality">Nationality</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Year -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CarYear" groupid="LeaseContractsForm" argumentid="CarYear" placeholder="Year" readonly>
                        <label for="CarYear">Year</label>
                    </div>
                </div>

                <!-- Gender -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Gender" groupid="LeaseContractsForm" argumentid="Gender" placeholder="Gender" readonly>
                        <label for="Gender">Gender</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Color -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Color" groupid="LeaseContractsForm" argumentid="Color" placeholder="Color" readonly>
                        <label for="Color">Color</label>
                    </div>
                </div>

                <!-- Passport No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="PassportNo" groupid="LeaseContractsForm" argumentid="PassportNo" placeholder="Passport No." readonly>
                        <label for="PassportNo">Passport No.</label>
                    </div>
                </div>
                <%--                    <div class="col-12 col-sm-6 col-lg-2">
                        <div class="form-floating mt-3">
                            <input type="text" class="form-control-plaintext" id="PassportExpiry" groupid="LeaseContractsForm" argumentid="PassportExpiry" placeholder="Passport Expiry" readonly>
                            <label for="PassportExpiry"></label>
                        </div>
                    </div>--%>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Type -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="Type" groupid="LeaseContractsForm" argumentid="Type" placeholder="Type" readonly>
                        <label for="Type">Type</label>
                    </div>
                </div>

                <!-- National ID No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="NationalIDNo" groupid="LeaseContractsForm" argumentid="NationalIDNo" placeholder="National ID No." readonly>
                        <label for="NationalIDNo">National ID No.</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="NationalIDExpiryDate" groupid="LeaseContractsForm" argumentid="NationalIDExpiryDate" placeholder="ID Expiry Date" readonly>
                        <label for="NationalIDExpiryDate">ID Expiry Date</label>
                    </div>--%>
                </div>
            </div>


            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Insurance -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="InsuranceExpiry" groupid="LeaseContractsForm" argumentid="InsuranceExpiry" placeholder="Insurance Expiry" readonly>
                        <label for="InsuranceExpiry">Insurance</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="FullInsuranceExpiry" groupid="LeaseContractsForm" argumentid="FullInsuranceExpiry" placeholder="Full Insurance Expiry" readonly>
                        <label for="FullInsuranceExpiry">Full Insurance Expiry</label>
                    </div>--%>
                </div>

                <!-- Driving License No. -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="DrivingLicenseNo" groupid="LeaseContractsForm" argumentid="DrivingLicenseNo" placeholder="Driving License No." readonly>
                        <label for="DrivingLicenseNo">Driving License No.</label>
                    </div>
                </div>
                <%--                <div class="col-12 col-sm-6 col-lg-2">
                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="DrivingLicenseExpiry" groupid="LeaseContractsForm" argumentid="DrivingLicenseExpiry" placeholder="License Expiry" readonly>
                        <label for="DrivingLicenseExpiry">License Expiry</label>
                    </div>
                </div>--%>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Previous Mileage (KM) -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="CarPreviousKM" groupid="LeaseContractsForm" argumentid="CarPreviousKM" placeholder="Previous Mileage" readonly>
                        <label for="CarPreviousKM">Previous Mileage (KM)</label>
                    </div>
                </div>

                <!-- Work & Res. Telephone -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="WorkTelephone" groupid="LeaseContractsForm" argumentid="WorkTelephone" placeholder="Work Telephone" readonly>
                        <label for="WorkTelephone">>Work & Res. Telephone</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="ResidenceTelephone" groupid="LeaseContractsForm" argumentid="ResidenceTelephone" placeholder="Residence Telephone" readonly>
                        <label for="ResidenceTelephone">Residence Telephone</label>
                    </div>--%>
                </div>
            </div>

            <div class="row mb-3 justify-content-center OnLoadHideCarCust">
                <!-- Car Out Mileage -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number CommonDisable" id="ContractKMOut" maxlength="10" groupid="LeaseContractsForm" argumentid="ContractKMOut" placeholder="Car Out Mileage*">
                        <label for="ContractKMOut">Car Out Mileage*</label>
                    </div>
                </div>

                <!-- Mobile Telephone -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext" id="MobileTelephone1" groupid="LeaseContractsForm" argumentid="MobileTelephone1" placeholder="Mobile Telephone 1" readonly>
                        <label for="MobileTelephone1">Mobile Telephone 1</label>
                    </div>
                    <%--                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-plaintext" id="MobileTelephone2" groupid="LeaseContractsForm" argumentid="MobileTelephone2" placeholder="Mobile Telephone 2" readonly>
                        <label for="MobileTelephone2">Mobile Telephone 2</label>
                    </div>--%>
                </div>
            </div>

            <div class="row mb-3  align-items-center">
                <!-- Spacer -->
                <div class="col-12 col-sm-none col-lg-2"></div>

                <!-- Contract Start Date -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="date" class="form-control text required date CommonDisable" id="ContractStartDate" groupid="LeaseContractsForm" argumentid="ContractStartDate" maxlength="10" placeholder="Contract Start Date*" requirederr="*">
                        <label for="ContractStartDate">Contract Start Date*</label>
                    </div>
                </div>

                <!-- Start Day -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractStartDay" groupid="LeaseContractsForm" argumentid="ContractStartDay" maxlength="10" placeholder="Start Day" readonly>
                        <label for="ContractStartDay">Start Day</label>
                    </div>
                </div>

                <!-- Start Time -->
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control text AlwaysDisable" id="ContractStartTime" groupid="LeaseContractsForm" argumentid="ContractStartTime" maxlength="10" placeholder="Start Time" readonly>
                        <label for="ContractStartTime">Start Time</label>
                    </div>
                </div>

                <%--                <!-- Rate Type -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required CommonDisable" id="CarRateType" groupid="LeaseContractsForm" argumentid="CarRateType" storeinfo="{Command:'SEL_iRental_Contracts_RateTypes',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'Brand',SPParamName:'Brand'},{Name:'Model',SPParamName:'Model'},{Name:'CarYear',SPParamName:'CarYear'}],ItemExtraAttrs:['CarRate','CarAllowedKM','CarExtraKMRate']}">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select>
                        <label for="CarRateType">Rate Type*</label>
                    </div>
                </div>--%>

                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>


            <div class="row mb-3 justify-content-center align-items-center">
                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>

                <!-- Contract Expiry Date -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="date" class="form-control  required date DisableOnClose" id="LeaseFirstPaymentDate" groupid="LeaseContractsForm" argumentid="LeaseFirstPaymentDate" maxlength="10" placeholder="First Payment Date*" requirederr="*">
                        <label for="LeaseFirstPaymentDate">First Payment Date*</label>
                    </div>
                </div>


                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="date" class="form-control  required date DisableOnClose" id="LeaseLastPaymentDate" groupid="LeaseContractsForm" argumentid="LeaseLastPaymentDate" maxlength="10" placeholder="Last Payment Date*" requirederr="*">
                        <label for="LeaseLastPaymentDate">Last Payment Date*</label>
                    </div>
                </div>

                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>

            <div class="row mb-3 justify-content-center align-items-center">
                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>


                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" alphconf="{allow:'.'}" class="form-control text required number CommonDisable " id="LeaseTotalAmount" groupid="LeaseContractsForm" argumentid="LeaseTotalAmount" maxlength="10" placeholder="Total Amount (KD)*">
                        <label for="LeaseTotalAmount" class="MileageType">Total Amount (KD)*</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" alphconf="{allow:'.'}" class="form-control text required number  CommonDisable" id="LeaseAdvancePaid" groupid="LeaseContractsForm" argumentid="LeaseAdvancePaid" maxlength="10" placeholder="Advance Payment (KD)*">
                        <label for="LeaseAdvancePaid" class="MileageType">Advance Payment (KD)*</label>
                    </div>
                </div>
                <!-- Spacer -->
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>



            <div class="row  mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number  CommonDisable" id="LeaseInstallments" groupid="LeaseContractsForm" argumentid="LeaseInstallments" maxlength="10" placeholder="Installments*">
                        <label for="LeaseAdvancePaid" class="LeaseInstallments">Installments*</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number  CommonDisable" id="LeaseMonthlyPayment" groupid="LeaseContractsForm" argumentid="LeaseMonthlyPayment" maxlength="10" placeholder="Monthly Payment (KD)*">
                        <label for="LeaseAdvancePaid" class="LeaseMonthlyPayment">Monthly Payment (KD)*</label>
                    </div>
                </div>
                <%--                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractPeriodCharges" groupid="LeaseContractsForm"></span>
                        <label for="ContractPeriodCharges">Rental Charges</label>
                    </div>
                </div>--%>
            </div>

            <div class="row  mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number  CommonDisable" id="LeaseLastPayment" groupid="LeaseContractsForm" argumentid="LeaseLastPayment" maxlength="10" placeholder="Last Payment (KD)*">
                        <label for="LeaseLastPayment" class="LeaseMonthlyPayment">Last Payment (KD)*</label>
                    </div>
                </div>
                <%--                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractPeriodCharges" groupid="LeaseContractsForm"></span>
                        <label for="ContractPeriodCharges">Rental Charges</label>
                    </div>
                </div>--%>
            </div>

            <div class="row  mb-2 justify-content-center OnLoadHide">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="InstallmentsTillDate" groupid="LeaseContractsForm" argumentid="InstallmentsTillDate"></span>
                        <label for="InstallmentsTillDate">Amount - Till Date</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="AmountTillDate" groupid="LeaseContractsForm" argumentid="AmountTillDate"></span>
                        <label for="AmountTillDate">Amount - Till Date</label>
                    </div>
                </div>
            </div>

            <div class="row  mb-2 justify-content-center OnLoadHide">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="InstallmentsDue" groupid="LeaseContractsForm" argumentid="InstallmentsDue"></span>
                        <label for="InstallmentsDue">Installments - Due</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="AmountDue" groupid="LeaseContractsForm" argumentid="AmountDue"></span>
                        <label for="AmountDue">Amount - Due</label>
                    </div>
                </div>
            </div>

            <!-- Row 3: Discount and Other Charges -->
            <div class="row OnLoadHide mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number AlwaysDisable SuperUserEdit" id="ContractDiscount" style="text-align: center;" maxlength="10"
                            groupid="LeaseContractsForm" argumentid="ContractDiscount" alphconf="{allow:'.'}" placeholder="Discount">
                        <label for="ContractDiscount">Discount</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <span class="form-control text ftitle" id="ContractOtherCharges" groupid="LeaseContractsForm" argumentid="ContractOtherCharges"></span>
                        <label for="ContractOtherCharges">Other Charges</label>
                    </div>
                </div>
            </div>

            <div class="row OnLoadHide mb-2 justify-content-center">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" style="text-align: center;" maxlength="10" class=" form-control text number DisableOnClose dependent"
                            groupid="LeaseContractsForm" requirederr=' *' deperr='Contract KM In should be greater than Contract KM Out...'
                            blurvalidate="false" argumentid="ContractKMIn" id="ContractKMIn" placeholder="Car In Mileage" operator=">" depchildid="ContractKMOut" />
                        <label for="ContractKMIn">Car In Mileage*</label>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="form-floating">
                        <select loadon="FirstVisible" class="form-select dropdownlist AlwaysDisable SuperUserEdit" id="InLocationId" groupid="LeaseContractsForm"
                            argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="InLocationId">Select Location</label>
                    </div>
                </div>

            </div>

            <div class="row OnLoadHide mb-3 justify-content-center">
                <!-- Amount Received -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4 mb-3 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext ftitle text-success fw-bold" id="TotalPaidByCustomer"
                            groupid="LeaseContractsForm" argumentid="TotalPaidByCustomer" value="" readonly>
                        <label for="TotalPaidByCustomer" style="color: Green; font-size: 12px;">Amount Received (KD)</label>
                    </div>
                </div>

                <!-- Amount Due -->
                <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext ftitle text-danger" id="TotalAmountDue"
                            groupid="LeaseContractsForm" argumentid="TotalAmountDue" value="" readonly>
                        <label for="TotalAmountDue" style="color: Red; font-size: 12px;">Total Amount Due</label>
                    </div>
                </div>
            </div>

            <!-- Open Contract Buttons -->
            <div class="row mt-3 justify-content-center">
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-primary btn-lg w-100 DataAction ButtonStyle btn_1"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCContractOpen'},HideOnSuccess:false,Requery:true}">
                        Open Contract - Car Out
           
                    </button>
                </div>
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-primary btn-lg w-100 DataAction ButtonStyle btn_2"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCContractOpenCarIn'},HideOnSuccess:false,Requery:true}">
                        Open Contract - Car In
           
                    </button>
                </div>
            </div>

            <!-- Close Contract Buttons -->
            <div class="row mt-3 justify-content-center">
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-warning w-100 DataAction ButtonStyle btn_3"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}">
                        Close Contract - Pending Payment
           
                    </button>
                </div>
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-success w-100 DataAction ButtonStyle btn_4"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:false, Requery:true}">
                        Close Contract - Payment Cleared
           
                    </button>
                </div>
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_5"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:false, Requery:true}">
                        Cancel Contract
           
                    </button>
                </div>
            </div>

            <!-- Legal Buttons -->
            <div class="row mt-3 justify-content-center">
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_6"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarOut'}, HideOnSuccess:false, Requery:true}">
                        To Legal - Contract Open - Car Out
           
                    </button>
                </div>
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_7"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarIn'}, HideOnSuccess:false, Requery:true}">
                        To Legal - Contract Open - Car In
           
                    </button>
                </div>
                <div class="col-md-4 mb-2">
                    <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle btn_8"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts', Params:{NewStateId:'RRCWithLegalContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}">
                        To Legal - Contract Closed
           
                    </button>
                </div>
            </div>

            <!-- Footer Buttons -->
            <div class="row mt-3 mb-3 justify-content-center">
                <div class="col-lg-2 col-sm-12 mb-2 Button_Edit">
                    <button type="button" class="btn btn-outline-secondary w-100 ButtonStyle Button_Edit">
                        Edit
           
                    </button>
                </div>
                <div class="col-lg-2 col-sm-12 mb-2 btn_11">
                    <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle btn_11"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts',HideOnSuccess:true, Requery:false, GroupId:'LeaseContractsForm'}">
                        Save
           
                    </button>
                </div>
                <div class="col-lg-2 col-sm-12 mb-2 btn_10">
                    <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle btn_10"
                        conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts',HideOnSuccess:false, Requery:false, GroupId:'LeaseContractsForm'}">
                        Save
           
                    </button>
                </div>
                <div class="col-lg-2 col-sm-12 mb-2 printBtn">
                    <button type="button" class="btn btn-secondary w-100 ButtonStyle printBtn">
                        Print
           
                    </button>
                </div>
                <div class="col-lg-2 col-sm-12 mb-2 common-button">
                    <button type="button" class="btn btn-secondary w-100 ButtonStyle LeaseStatement common-button">
                        Statement
           
                    </button>
                </div>
                <div class="col-lg-2 col-sm-12 mb-2">
                    <button type="button" class="btn btn-secondary w-100 CloseForm ButtonStyle">
                        Close
           
                    </button>
                </div>
            </div>

            <%--            <!-- Buttons Section -->
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
            </div>--%>
        </div>

        <div class="tab-pane container fade" tabid="LeasePaymentDetails" id="LeasePaymentDetails" >

            <AW:DataGrid ID="grdLeasePaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_iRental_Lease_Contracts_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Lease_Contracts_Payments\',KeysCol:\'RecId\'}}}">
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
                                NewFormId: 'frmLeasePaymentDetails',
                                EditFormId: 'frmLeasePaymentDetails',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function () {
                            t.on('beforeSearchGetForm', function (P) {
                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                            t.on('beforeRowDelete', function (P) {
                                var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
                                pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
                                P.cf['ParentRecId'] = pVal;
                            });
                            t.on('rowsRendered', function () {

                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                var strMainStateId = frm.GetArgVal('StateId');

                                $('[colid="PaymentType"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });

                                $('[colid="StateId"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "deleted") {
                                        ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'Normal', 'color': '#333333', 'text-decoration': 'line-through' });
                                        $('.chkRowSelect', ptr).attr('disabled', 'disabled');
                                        $('td:nth-child(3)', ptr).css('cursor', '').unbind();
                                        $('td:nth-child(4)', ptr).css('cursor', '').unbind();

                                        var cur = {
                                            'background-image': 'url(' + ROOT_PATH + 'AsyncWidgets/Widgets/resources/images/RowEditForm_Disabled.png)',
                                            'background-repeat': 'no-repeat',
                                            'background-position': 'center center'
                                        };
                                        $('td:nth-child(3)', ptr).css(cur);

                                        cur = {
                                            'background-image': 'url(' + ROOT_PATH + 'App_Themes/eForms_Theme/Images/Print_Disabled.png)',
                                            'background-repeat': 'no-repeat',
                                            'background-position': 'center center'
                                        };

                                        $('td:nth-child(4)', ptr).css(cur);
                                    }
                                });



                                //If Main State ID = RRCContractClosed or RRCContractCancelled
                                if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled') {
                                    $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
                                    $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
                                    $('[itemno] td:nth-child(4)', t.Repeater).css('cursor', '').unbind();
                                    $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
                                }
                                else if (AsyncWidgets.user.conf.Roles.indexOf('iRen_Contracts_Lawyer') > -1) {
                                    $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
                                    $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
                                    $('[itemno] td:nth-child(4)', t.Repeater).css('cursor', '').unbind();
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
                            t.on('rowsRendered', function () {
                                $('.PrintReport', t.el).click(function () { //
                                    var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintReceiptVoucherFrPg.aspx?FormId=" + $(this).text() + "&ContractType=LST"; // +'&amp;FormId=' + pm.SelectedKey;
                                    console.log(strlink);
                                    var width = 920;
                                    var height = 600;
                                    var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
                                    var top = parseInt((screen.availHeight / 2) - (height / 2));
                                    window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
                                    return false;
                                });
                            });
                            t.on('onItemColGenerated', function (cf) {
                                if (cf.colId == 'PrintId') {

                                    var cur = {
                                        'background-image': 'url(' + ROOT_PATH + 'App_Themes/eForms_Theme/Images/print.png)',
                                        'background-repeat': 'no-repeat',
                                        'background-position': 'center center',
                                        'cursor': 'hand'
                                    };
                                    var c = cf.itemCol, vl = $('.ColValue', c);
                                    vl.hide().parent().css(cur).addClass('PrintReport');

                                    //vl.html('&lt;a class="EmpReportByEmpId" href="#" click="void(0);"  style="" key="{PrintId}" style="text-decoration: none" > Print &lt;/a>');
                                    //vl.html('&lt;a class="EmpReportByEmpId" href="#" click="void(0);"  style="" key="{PrintId}" style="text-decoration: none" >Print &lt;/a>');

                                }
                            });

                        }
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="4">
                    <AW:Container ID="conLeasePaymentDetails_Audit" Hidden="true" runat="server">
                        <Childern>
                            <div style="padding: 15px">
                                <AW:DataGrid ID="grdLeasePaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                                    Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false"
                                    RelativeKeys="RecId" PageSize="30" DataSource="SEL_iRental_Lease_Contracts_Payments_Audit"
                                    ContainerMargin="2px" ShowGridHead="false" GridTemplate="jQueryUI" GridHeadText="Payment Details"
                                    GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}">
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
                    </AW:Container>
                     </pre>
                </RowDetail>
            </AW:DataGrid>


            <AW:Form ID="frmLeasePaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true"
                runat="server" AsyncForm="~/Pages/eForms/iRental/LeaseContracts_PD_FrUc.ascx">
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
                <%-- <Scripts>
                    <script>
                        var fn = function () {

                          
                        }
                    </script>
                </Scripts>--%>
            </AW:Form>

        </div>

        <div class="tab-pane container fade" tabid="LeaseOtherCharges" id="LeaseOtherCharges" >

            <AW:DataGrid ID="grdLeaseOtherCharges" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_Lease_Contracts_OtherCharges" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Other Charges" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Lease_Contracts_OtherCharges\',KeysCol:\'RecId\'}}}">
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
                                NewFormId: 'frmLeaseOtherCharges',
                                EditFormId: 'frmLeaseOtherCharges',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function () {
                            t.on('beforeSearchGetForm', function (P) {
                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                            t.on('beforeRowDelete', function (P) {
                                var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
                                pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
                                P.cf['ParentRecId'] = pVal;
                            });
                            t.on('rowsRendered', function () {

                                var frm = AsyncWidgets.get('frmLeaseContracts');
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
                    <AW:Container ID="conLeaseOtherCharges_Audit" Hidden="true" runat="server">
                        <Childern>
                            <div style="padding: 15px">
                                <AW:DataGrid ID="grdLeaseOtherCharges_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                                    Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false"
                                    RelativeKeys="RecId" PageSize="30" DataSource="SEL_iRental_Lease_Contracts_OtherCharges_Audit"
                                    ContainerMargin="2px" ShowGridHead="false" GridTemplate="jQueryUI" GridHeadText="Payment Details"
                                    GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}">
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
                    </AW:Container>
                     </pre>
                </RowDetail>
            </AW:DataGrid>
            <AW:Form ID="frmLeaseOtherCharges" Hidden="true" LoadOnInit="false" ShowOnLoad="true"
                runat="server" AsyncForm="~/Pages/eForms/iRental/LeaseContracts_OC_FrUc.ascx">
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
                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>


        </div>


        <div class="tab-pane container fade" tabid="LeaseContractComments" id="LeaseContractComments" >


            <AW:DataGrid ID="grdLeaseContractComments" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_Lease_Contracts_Comments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Comments" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Lease_Contracts_Comments\',KeysCol:\'RecId\'}}}">
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
                                NewFormId: 'frmLeaseComments',
                                EditFormId: 'frmLeaseComments',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function () {
                            t.on('beforeSearchGetForm', function (P) {
                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                        }
                    </script>
                </Scripts>
            </AW:DataGrid>
            <AW:Form ID="frmLeaseComments" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/eForms/iRental/LeaseContracts_CS_FrUc.ascx">
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
                                debugger
                                var frm = AsyncWidgets.get('frmLeaseContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>


        </div>



    </div>
</div>

