<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inbox.ascx.cs" Inherits="WebProject.Pages.Common.Inbox" %>



<div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">
                    <span class="h4 fw-bold ink-bar">Home</span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="row mb-3">
                    <div class="col-12">
                        <ul class="nav nav-tabs nav-pills-Home simple-tab" role="tablist">
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

                <!-- Tab Content (remains unchanged) -->
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

<!-- Add this CSS to your stylesheet -->
<style>


</style>


