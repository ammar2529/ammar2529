<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inbox.ascx.cs" Inherits="WebProject.Pages.Common.Inbox" %>


<div class="">
    <div class="card">
        <div class="card-body">
            <div class="row my-3">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class="h4 fw-bold ink-bar">Home</span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="">
                    </div>

                    <!-- Nav Tabs -->
                    <div class="row mb-3">
                        <div class="col-12">
                            <ul class="nav nav-tabs simple-tab" role="tablist">
                                <li class="nav-item" tabid="BasicInformation">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#BasicInformation">Basic Information</a>
                                </li>
                                <li class="nav-item" tabid="ContactInformation">
                                    <a class="nav-link" data-bs-toggle="tab" href="#ContactInformation">Contact Information</a>
                                </li>
                                <li class="nav-item" tabid="PayrollInformation">
                                    <a class="nav-link" data-bs-toggle="tab" href="#PayrollInformation">Payroll Information</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Tab Content -->
                    <div class="tab-content">
                        <!-- Basic Information Tab -->
                        <div id="BasicInformation" class="container tab-pane active">
                            <div class="row mb-3 emp-info-not-found" style="display: none;">
                                <div class="col-12">
                                    <div class="alert alert-danger" role="alert">
                                        Employee information not found ...
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="EmpId"
                                            groupid="EmployeeInfo" argumentid="EmpId" readonly placeholder="Employee Id">
                                        <label for="EmpId">Employee Id</label>
                                        <div style="display: none">
                                            <input type="text" value="BasicInformation" class="tabid" groupid="EmployeeInfo" argumentid="TabId">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="NameInEnglish"
                                            groupid="EmployeeInfo" argumentid="NameInEnglish" readonly placeholder="Name In English">
                                        <label for="NameInEnglish">Name In English</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="NameInArabic"
                                            groupid="EmployeeInfo" argumentid="NameInArabic" readonly placeholder="Name In Arabic" style="font-size: 16px;">
                                        <label for="NameInArabic">Name In Arabic</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="Gender"
                                            groupid="EmployeeInfo" argumentid="Gender" readonly placeholder="Gender">
                                        <label for="Gender">Gender</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="DateOfBirth"
                                            groupid="EmployeeInfo" argumentid="DateOfBirth" readonly placeholder="Date of Birth">
                                        <label for="DateOfBirth">Date of Birth</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="PassportNo"
                                            groupid="EmployeeInfo" argumentid="PassportNo" readonly placeholder="Passport No.">
                                        <label for="PassportNo">Passport No.</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="Religion"
                                            groupid="EmployeeInfo" argumentid="Religion" readonly placeholder="Religion">
                                        <label for="Religion">Religion</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="PassportExpiryDate"
                                            groupid="EmployeeInfo" argumentid="PassportExpiryDate" readonly placeholder="Passport Expiry Date">
                                        <label for="PassportExpiryDate">Passport Expiry Date</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="Nationality"
                                            groupid="EmployeeInfo" argumentid="Nationality" readonly placeholder="Nationality">
                                        <label for="Nationality">Nationality</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="CivilId"
                                            groupid="EmployeeInfo" argumentid="CivilId" readonly placeholder="Civil ID No.">
                                        <label for="CivilId">Civil ID No.</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="MaritalStatus"
                                            groupid="EmployeeInfo" argumentid="MaritalStatus" readonly placeholder="Marital Status">
                                        <label for="MaritalStatus">Marital Status</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="ResidencyExpiryDate"
                                            groupid="EmployeeInfo" argumentid="ResidencyExpiryDate" readonly placeholder="Civil ID Expiry Date">
                                        <label for="ResidencyExpiryDate">Civil ID Expiry Date</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 ">
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="EmpStatus"
                                            groupid="EmployeeInfo" argumentid="EmpStatus" readonly placeholder="Employee Status">
                                        <label for="EmpStatus">Employee Status</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Contact Information Tab -->
                        <div id="ContactInformation" class="container tab-pane fade">
                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="LandlineNumber"
                                            groupid="EmployeeInfo" argumentid="LandlineNumber" readonly placeholder="Landline Number">
                                        <label for="LandlineNumber">Landline Number</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="MobileNumber"
                                            groupid="EmployeeInfo" argumentid="MobileNumber" readonly placeholder="Mobile Number">
                                        <label for="MobileNumber">Mobile Number</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="OtherNumber"
                                            groupid="EmployeeInfo" argumentid="OtherNumber" readonly placeholder="Other Number">
                                        <label for="OtherNumber">Other Number</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold text-danger" id="EmergencyContactNumber"
                                            groupid="EmployeeInfo" argumentid="EmergencyContactNumber" readonly placeholder="Emergency Contact Number">
                                        <label for="EmergencyContactNumber">Emergency Contact Number</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="OfficialEmail"
                                            groupid="EmployeeInfo" argumentid="OfficialEmail" readonly placeholder="Official Email Address">
                                        <label for="OfficialEmail">Official Email Address</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="PersonalEmail"
                                            groupid="EmployeeInfo" argumentid="PersonalEmail" readonly placeholder="Personal Email Address">
                                        <label for="PersonalEmail">Personal Email Address</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="LocalAddress"
                                            groupid="EmployeeInfo" argumentid="LocalAddress" readonly placeholder="Employee Local Address">
                                        <label for="LocalAddress">Employee Local Address</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="AddressAtCountryOfOrigin"
                                            groupid="EmployeeInfo" argumentid="AddressAtCountryOfOrigin" readonly placeholder="Address at Country of Origin">
                                        <label for="AddressAtCountryOfOrigin">Address at Country of Origin</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Payroll Information Tab -->
                        <div id="PayrollInformation" class="container tab-pane fade">
                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="BasicSalary"
                                            groupid="EmployeeInfo" argumentid="BasicSalary" readonly placeholder="Basic Salary">
                                        <label for="BasicSalary">Basic Salary</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="PayAs"
                                            groupid="EmployeeInfo" argumentid="PayAs" readonly placeholder="Pay As">
                                        <label for="PayAs">Pay As</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="OverTimeAllowance"
                                            groupid="EmployeeInfo" argumentid="OverTimeAllowance" readonly placeholder="Overtime Allowance">
                                        <label for="OverTimeAllowance">Overtime Allowance</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="BankName"
                                            groupid="EmployeeInfo" argumentid="BankName" readonly placeholder="Bank Name">
                                        <label for="BankName">Bank Name</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="HousingAllowance"
                                            groupid="EmployeeInfo" argumentid="HousingAllowance" readonly placeholder="Housing Allowance">
                                        <label for="HousingAllowance">Housing Allowance</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="BankBranch"
                                            groupid="EmployeeInfo" argumentid="BankBranch" readonly placeholder="Bank Branch">
                                        <label for="BankBranch">Bank Branch</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="PositionAllowance"
                                            groupid="EmployeeInfo" argumentid="PositionAllowance" readonly placeholder="Position Allowance">
                                        <label for="PositionAllowance">Position Allowance</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="AccountNumber"
                                            groupid="EmployeeInfo" argumentid="AccountNumber" readonly placeholder="Bank Account Number">
                                        <label for="AccountNumber">Bank Account Number</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="TransportAllowance"
                                            groupid="EmployeeInfo" argumentid="TransportAllowance" readonly placeholder="Transport Allowance">
                                        <label for="TransportAllowance">Transport Allowance</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="SwiftCode"
                                            groupid="EmployeeInfo" argumentid="SwiftCode" readonly placeholder="Swift Code">
                                        <label for="SwiftCode">Swift Code</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="SalaryAdjustment"
                                            groupid="EmployeeInfo" argumentid="SalaryAdjustment" readonly placeholder="Salary Adjustment">
                                        <label for="SalaryAdjustment">Salary Adjustment</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="TicketDetails"
                                            groupid="EmployeeInfo" argumentid="TicketDetails" readonly placeholder="Ticket Details">
                                        <label for="TicketDetails">Ticket Details</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold text-danger" id="GrossSalary"
                                            groupid="EmployeeInfo" argumentid="GrossSalary" readonly placeholder="Gross Salary">
                                        <label for="GrossSalary">Gross Salary</label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control-plaintext text-center fw-bold" id="TicketAllowance"
                                            groupid="EmployeeInfo" argumentid="TicketAllowance" readonly placeholder="Ticket Allowance">
                                        <label for="TicketAllowance">Ticket Allowance</label>
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
</div>




<%--<div class="card">
    <div class="card-body">
        <div class="mt-1">
            <h2>Home</h2>
            <br>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs SimpleTab" role="tablist">
                <li class="nav-item" tabid="BasicInformation">
                    <div class="nav-link active" data-bs-toggle="tab">Basic Information</div>
                </li>
                <li class="nav-item" tabid="ContactInformation">
                    <div class="nav-link" data-bs-toggle="tab">Contact Information</div>
                </li>
                <li class="nav-item" tabid="PayrollInformation">
                    <div class="nav-link" data-bs-toggle="tab">Payroll Information</div>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="BasicInformation" class="container tab-pane active"><br>
                    <table class="FormTable table table-sm" style="width: 100%" cellspacing="1">
                        <tr class="EMPInfoNotFound" style="display: none;">
                            <td colspan="4" class="ftitle" style="color: red;">Employee information not found ...</td>
                        </tr>
                        <tr>
                            <td style="width: 25%">
                                <span class="ftitle">Employee Id</span>
                            </td>
                            <td style="width: 25%" colspan="3">
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="EmpId"></span>
                                <div style="display: none">
                                    <input type="text" value="BasicInformation" class="tabid" groupid="EmployeeInfo" argumentid="TabId" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="ftitle">Name In English</span></td>
                            <td colspan="3">
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="NameInEnglish"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Name In Arabic</span>
                            </td>
                            <td colspan="3">
                                <span class="ftitle" style="font-size: 16px" groupid="EmployeeInfo" argumentid="NameInArabic"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Gender</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="Gender"></span>
                            </td>
                            <td>
                                <span class="ftitle">Passport No.</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="PassportNo"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Date of Birth</span>
                            </td>
                            <td><span class="ftitle" groupid="EmployeeInfo" argumentid="DateOfBirth"></span></td>
                            <td>
                                <span class="ftitle">Passport Expiry Date</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="PassportExpiryDate"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Religion</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="Religion"></span>
                            </td>
                            <td style="width: 25%">
                                <span class="ftitle">Civil ID No.</span>
                            </td>
                            <td style="width: 25%">
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="CivilId"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Nationality</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="Nationality"></span>
                            </td>
                            <td>
                                <span class="ftitle">Civil ID Expiry Date</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="ResidencyExpiryDate"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Marital Status</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="MaritalStatus"></span>
                            </td>
                            <td>
                                <span class="ftitle">Employee Status</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="EmpStatus"></span>
                            </td>
                        </tr>
                    </table>
                </div>
                   <div id="ContactInformation" class="container tab-pane fade"><br>
                    <table class="FormTable" style="width: 100%" cellspacing="1">
                        <tr>
                            <td style="width: 25%">
                                <span class="ftitle">Landline Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="LandlineNumber"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Mobile Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="MobileNumber"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Other Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="OtherNumber"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Emergency Contact Number</span>
                            </td>
                            <td>
                                <span class="ftitle" style="color: red" groupid="EmployeeInfo" argumentid="EmergencyContactNumber"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Official Email Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="OfficialEmail"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Personal Email Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="PersonalEmail"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Employee Local Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="LocalAddress"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Address at Country of Origin</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="AddressAtCountryOfOrigin"></span>
                            </td>
                        </tr>
                    </table>
                </div>
<div id="PayrollInformation" class="container tab-pane fade"><br>
    <!-- Payroll Information content here -->
    <table class="FormTable" style="width: 100%" cellspacing="1">
        <tr>
            <td style="width: 25%">
                <span class="ftitle">Basic Salary</span>
            </td>
            <td style="width: 25%; text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="BasicSalary"></span>
            </td>
            <td style="width: 25%">
                <span class="ftitle">Pay As</span>
            </td>
            <td style="width: 25%">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="PayAs"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Overtime Allowance</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="OverTimeAllowance"></span>
            </td>
            <td>
                <span class="ftitle">Bank Name</span>
            </td>
            <td>
                <span class="ftitle" groupid="EmployeeInfo" argumentid="BankName"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Housing Allowance</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="HousingAllowance"></span>
            </td>
            <td>
                <span class="ftitle">Bank Branch</span>
            </td>
            <td>
                <span class="ftitle" groupid="EmployeeInfo" argumentid="BankBranch"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Position Allowance</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="PositionAllowance"></span>
            </td>
            <td>
                <span class="ftitle">Bank Account Number</span>
            </td>
            <td>
                <span class="ftitle" groupid="EmployeeInfo" argumentid="AccountNumber"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Transport Allowance</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="TransportAllowance"></span>
            </td>
            <td>
                <span class="ftitle">Swift Code</span>
            </td>
            <td>
                <span class="ftitle" groupid="EmployeeInfo" argumentid="SwiftCode"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Salary Adjustment</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="SalaryAdjustment"></span>
            </td>
            <td>
                <span class="ftitle">Ticket Details</span>
            </td>
            <td>
                <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketDetails"></span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="ftitle">Gross Salary</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" style="color: red; text-align: center" groupid="EmployeeInfo" argumentid="GrossSalary"></span>
            </td>
            <td>
                <span class="ftitle">Ticket Allowance</span>
            </td>
            <td style="text-align: center">
                <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketAllowance"></span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <span class="ftitle">&nbsp;</span>
            </td>
        </tr>
    </table>
</div>

            </div>
        </div>
    </div>
</div>--%>



<%--<style>
body {
    font-family: Arial, sans-serif;
}

p {
    font-size: 20px;
    padding: 20px;
    color: black;
}

.EmpInfo {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.FormTable {
    width: 100%;
    border-collapse: collapse;
}

.FormTable td {
    padding: 10px;
}

.fcontainer {
    background: #EEEEFF;
    padding: 10px;
    border: 1px solid #8298B0;
    width: 100%;
    box-sizing: border-box;
    margin-bottom: 20px;
}

.fcontainer table {
    width: 100%;
}

.fcontainer td {
    padding: 8px;
}

.SimpleTab {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-wrap: wrap;
}

.SimpleTab li {
    flex: 1;
    text-align: center;
    padding: 10px;
    border: 1px solid #8298B0;
    cursor: pointer;
}

.SimpleTab li.active {
    background-color: #8298B0;
    color: white;
}

@media only screen and (max-width: 768px) {
    .SimpleTab li {
        flex-basis: 100%;
    }

    .FormTable td {
        display: block;
        width: 100%;
    }

    .FormTable td:nth-child(odd) {
        background-color: #f9f9f9;
    }
}
</style>
<script>
    setTimeout(function () {
        const triggerTabList = document.querySelectorAll('#myTab button')
        debugger
        triggerTabList.forEach(triggerEl => {
            const tabTrigger = new bootstrap.Tab(triggerEl)

            triggerEl.addEventListener('click', event => {
                event.preventDefault()
                tabTrigger.show()
            })
        })
    }, 1000);
</script>--%>

<%--<div style="padding: 10px;">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="EmpInfo">
        <tr>
            <td style="padding-bottom: 1px;">
                <table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
                    <tr>
                        <td>
                            <ul class="SimpleTab" style="margin: 0px">
                                <li class="active" tabid="BasicInfomation">
                                    <div>Basic Information</div>
                                </li>
                                <li tabid="ContactInformation">
                                    <div>Contact Information</div>
                                </li>
                                <li tabid="ContractInformation">
                                    <div>Contract Information</div>
                                </li>
                                <li tabid="PayrollInfomation" style="border-right: 1px solid #8298B0;">
                                    <div>Payroll Information</div>
                                </li>
                            </ul>

                      <ul class="nav nav-tabs SimpleTab" id="myTab" role="tablist">
                      <li class="nav-item " role="presentation" >
                        <button class="nav-link active" id="home-tab" tabid="BasicInfomation" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Home</button>
                      </li>
                      <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" tabid="ContactInformation" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
                      </li>
                      <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" tabid="PayrollInfomation" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
                      </li>

                    </ul>
                        </td>
                    </tr>


                </table>
            </td>
        </tr>--%>
<%--        <tr tabid="BasicInfomation">
            <td style="background: #EEEEFF; padding: 10px; border: 1px solid #8298B0;">
                <table class="FormTable" style="width: 100%" cellspacing="1">
                    <tr class="EMPInfoNotFound" style="display: none;">
                        <td colspan="4" class="ftitle" style="color: red;">Employee information not found ...</td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                            <span class="ftitle">Employee Id</span> </td>
                        <td style="width: 25%" colspan="3">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="EmpId"></span>
                            <div style="display: none">
                                <input type="text" value="BasicInfomation" class="tabid" groupid="EmployeeInfo" argumentid="TabId" />
                            </div>
                        </td>


                    </tr>
                    <tr>
                        <td><span class="ftitle">Name In English</span></td>
                        <td colspan="3">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="NameInEnglish"></span>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Name In Arabic</span>

                        </td>
                        <td colspan="3">
                            <span class="ftitle" style="font-size: 16px" groupid="EmployeeInfo" argumentid="NameInArabic"></span>
                        </td>

                    </tr>
                    <tr>
                        <td>

                            <span class="ftitle">Gender</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="Gender"></span>
                        </td>
                        <td>
                            <span class="ftitle">Passport No.</span></td>
                        <td><span class="ftitle" groupid="EmployeeInfo" argumentid="PassportNo"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Date of Birth</span>

                        </td>
                        <td><span></span>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="DateOfBirth"></span>
                        </td>
                        <td>
                            <span class="ftitle">Passport Expiry Date</span></td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="PassportExpiryDate"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Religion</span></td>
                        <td><span class="ftitle" groupid="EmployeeInfo" argumentid="Religion"></span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle">Civil ID No.</span></td>
                        <td style="width: 25%">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="CivilId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Nationality</span></td>
                        <td><span class="ftitle" groupid="EmployeeInfo" argumentid="Nationality"></span>
                        </td>
                        <td>
                            <span class="ftitle">Civil ID Expiry Date</span></td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="ResidencyExpiryDate"></span>
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <span class="ftitle">Marital Status</span></td>
                        <td><span class="ftitle" groupid="EmployeeInfo" argumentid="MaritalStatus"></span>
                        </td>
                        <td>
                            <span class="ftitle">Employee Status</span></td>
                        <td><span class="ftitle" groupid="EmployeeInfo" argumentid="EmpStatus"></span></td>



                    </tr>


                </table>
            </td>
        </tr>--%>
<%--        <tr tabid="ContactInformation" style="display: none;">
            <td style="background: #EEEEFF; padding: 10px; border: 1px solid #8298B0;">
                <table class="FormTable" style="width: 100%" cellspacing="1">
                    <tr>
                        <td style="width: 25%">
                            <span class="ftitle">Landline Number</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="LandlineNumber"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Mobile Number</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="MobileNumber"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Other Number</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="OtherNumber"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Emergency Contact Number</span>
                        </td>
                        <td>
                            <span class="ftitle" style="color: red" groupid="EmployeeInfo" argumentid="EmergencyContactNumber"></span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span class="ftitle">Official Email Address</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="OfficialEmail"></span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span class="ftitle">Personal Email Address</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="PersonalEmail"></span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span class="ftitle">Employee Local Address</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="LocalAddress"></span>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span class="ftitle">Address at Country of Origin</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="AddressAtCountryOfOrigin"></span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>--%>
<%-- <tr tabid="ContractInformation" style="display: none;">
            <td style="background: #EEEEFF; padding: 10px; border: 1px solid #8298B0;">
                <table class="FormTable" style="width: 100%" cellspacing="1">
                    <tr>
                        <td style="width: 25%">
                            <span class="ftitle">Joining Date</span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="JoiningDate"></span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle">Last Working Date</span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="LastWorkingDate"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span class="ftitle">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Entity (Company Group)</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="Entity"></span>
                        </td>
                        <td>
                            <span class="ftitle">Visa Entity</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="VisaEntity"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Branch</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="Branch"></span>
                        </td>
                        <td>
                            <span class="ftitle">Department</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="Department"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Job Category</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="JobCategory"></span>
                        </td>
                        <td>
                            <span class="ftitle">Job Title</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="JobTitle"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span class="ftitle">&nbsp;</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">On Company's Residency?</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="CompaniesResidency"></span>
                        </td>
                        <td>
                            <span class="ftitle">Residency Type</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="ResidencyType"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span class="ftitle">&nbsp;</span>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>--%>
<%--   <tr tabid="PayrollInfomation" style="display: none">
            <td style="background: #EEEEFF; padding: 10px; border: 1px solid #8298B0;">
                <table class="FormTable" style="width: 100%" cellspacing="1">
                    <tr>
                        <td style="width: 25%">
                            <span class="ftitle">Basic Salary</span>
                        </td>
                        <td style="width: 25%; text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="BasicSalary"></span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle">Pay As</span>
                        </td>
                        <td style="width: 25%">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="PayAs"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Overtime Allowance</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="OverTimeAllowance"></span>
                        </td>
                        <td>
                            <span class="ftitle">Bank Name</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="BankName"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Housing Allowance</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="HousingAllowance"></span>
                        </td>
                        <td>
                            <span class="ftitle">Bank Branch</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="BankBranch"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Position Allowance</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="PositionAllowance"></span>
                        </td>
                        <td>
                            <span class="ftitle">Bank Account Number</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="AccountNumber"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Transport Allowance</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="TransportAllowance"></span>
                        </td>
                        <td>
                            <span class="ftitle">Swift Code</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="SwiftCode"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Salary Adjustment</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="SalaryAdjustment"></span>
                        </td>
                        <td>
                            <span class="ftitle">Ticket Details</span>
                        </td>
                        <td>
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketDetails"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ftitle">Gross Salary</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" style="color: red; text-align: center" groupid="EmployeeInfo" argumentid="GrossSalary"></span>
                        </td>
                        <td>
                            <span class="ftitle">Ticket Allowance</span>
                        </td>
                        <td style="text-align: center">
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketAllowance"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span class="ftitle">&nbsp;</span>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>--%>

<%--    </table>
</div>--%>
