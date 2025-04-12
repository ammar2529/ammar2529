<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.EmployeeDatabase_FrUc2" %>

<div class="">

    <!-- Nav tabs -->
<ul class="nav nav-tabs SimpleTab mt-3" id="myTab" role="tablist">
  <li class="nav-item" role="presentation" tabid="BasicInformation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Basic Information</button>
  </li>
  <li class="nav-item" role="presentation" tabid="ContactInformation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Contact Information</button>
  </li>
  <li class="nav-item" role="presentation" tabid="ContractInformation">
    <button class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">Contract Information</button>
  </li>
  <li class="nav-item" role="presentation" tabid="PayrollInformation" >
    <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Payroll Information</button>
  </li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" tabid="BasicInformation" id="home" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>
                <div style="display: none">
                    <span groupid="EmployeeDatabase" argumentid="RecId"></span>
                </div>
            </div>

            <!-- Employee ID and Status -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4 "></div>
                <div class="col-12 col-md-6 col-lg-2 mb-3 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control text required number" id="EmpId"
                            placeholder="Employee ID*" style="text-align: center; font-weight: bold; color: red;"
                            maxlength="10" groupid="EmployeeDatabase" argumentid="EmpId">
                        <label for="EmpId">Employee ID*</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-2">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required" id="EmpStatus"
                            loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="EmpStatus"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'24'}]}">
                            <option value="" selected="selected">Select Employee Status</option>
                        </select>
                        <label for="EmpStatus">Employee Status*</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Employee Name Fields -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text required alphanumericspacedot" id="NameInEnglish"
                            placeholder="Employee Name (In English)*" style="text-align: center; font-weight: bold;"
                            maxlength="255" groupid="EmployeeDatabase" argumentid="NameInEnglish">
                        <label for="NameInEnglish">Employee Name (In English)*</label>
                    </div>
                </div>


                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text" id="NameInArabic"
                            placeholder="Employee Name (In Arabic)" style="text-align: center; font-size: 16px; font-weight: bold;"
                            maxlength="255" groupid="EmployeeDatabase" argumentid="NameInArabic">
                        <label for="NameInArabic">Employee Name (In Arabic)</label>
                    </div>
                </div>

                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Gender and Date of Birth -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <input type="date" class="form-control text date" id="DateOfBirth"
                            placeholder="Date of Birth" maxlength="10" groupid="EmployeeDatabase" argumentid="DateOfBirth">
                        <label for="DateOfBirth">Date of Birth</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>


            <div class="row my-3 ">
                <div class="col-12 col-sm-none col-lg-4 ">
                </div>
                <div class="col-12 col-sm-6 col-lg-2 text-start">
                    <label for="floatingKM">
                        <small><b>Gender:</b></small>
                    </label>
                </div>
                <div class="col-12 col-sm-6 col-lg-4 text-start">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input" type="radio" id="Male" checked="checked" default="default" value="0" name="Gender"
                            groupid="EmployeeDatabase" argumentid="Gender">
                        <label class="form-check-label" for="Male">Male</label>
                    </div>
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input" type="radio" id="Female" value="1" name="Gender" groupid="EmployeeDatabase" argumentid="Gender">
                        <label class="form-check-label" for="Female">Female</label>
                    </div>
                </div>


            </div>

            <!-- Religion and Marital Status -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="Religion"
                            loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="Religion"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'13'}]}">
                            <option value="" selected="selected">Select Religion</option>
                        </select>
                        <label for="Religion">Religion</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="MaritalStatus"
                            loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="MaritalStatus"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'23'}]}">
                            <option value="" selected="selected">Select Marital Status</option>
                        </select>
                        <label for="MaritalStatus">Marital Status</label>
                    </div>
                </div>

                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>


            <!-- Nationality -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required" id="Nationality"
                            loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="Nationality"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'1'}]}">
                            <option value="" selected="selected">Select Nationality</option>
                        </select>
                        <label for="Nationality">Nationality*</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Save and Cancel Buttons -->
            <div class="row mt-4 justify-content-md-center mb-3">
                <div class="col-12 col-md-2 mb-3 mb-md-0">
                    <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle"
                        conf="{ActorId:'DataHelper', ActionId:'DataAction', Command:'UPD_Employee_DB', HideOnSuccess:true}">
                        Save</button>
                </div>
                <div class="col-12 col-md-2 ">
                    <button type="button" class="btn btn-secondary w-100 CloseForm ButtonStyle ">Cancel</button>
                </div>
            </div>
        
  </div>
  <div class="tab-pane" tabid="ContactInformation" id="profile" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>

            </div>

            <!-- Landline Number -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="LandlineNumber"
                            placeholder="Landline Number" maxlength="20" groupid="EmployeeDatabase" argumentid="LandlineNumber">
                        <label for="LandlineNumber">Landline Number</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Mobile Number -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="MobileNumber"
                            placeholder="Mobile Number" maxlength="20" groupid="EmployeeDatabase" argumentid="MobileNumber">
                        <label for="MobileNumber">Mobile Number</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Other Number -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="OtherNumber"
                            placeholder="Other Number" maxlength="20" groupid="EmployeeDatabase" argumentid="OtherNumber">
                        <label for="OtherNumber">Other Number</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

            </div>

            <!-- Emergency Contact Number -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number fw-bold" id="EmergencyContactNumber"
                            placeholder="Emergency Contact Number" maxlength="20" groupid="EmployeeDatabase" argumentid="EmergencyContactNumber">
                        <label for="EmergencyContactNumber" class="text-danger">Emergency Contact Number</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Official Email Address -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text email" id="OfficialEmail"
                            placeholder="Official Email Address" maxlength="255" groupid="EmployeeDatabase" argumentid="OfficialEmail">
                        <label for="OfficialEmail">Official Email Address</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
            </div>

            <!-- Personal Email Address -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text email" id="PersonalEmail"
                            placeholder="Personal Email Address" maxlength="255" groupid="EmployeeDatabase" argumentid="PersonalEmail">
                        <label for="PersonalEmail">Personal Email Address</label>
                    </div>
                </div>
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

            </div>

            <!-- Address Section -->
            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" argumentid="LocalAddress" groupid="EmployeeDatabase" style="height: 100px"></textarea>
                        <label for="floatingTextarea2">Employee Local Address</label>
                    </div>
                </div>

                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

            </div>

            <div class="row mb-3">
                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

                <div class="col-12 col-md-12 col-lg-4">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea3" argumentid="AddressAtCountryOfOrigin" groupid="EmployeeDatabase" style="height: 100px"></textarea>
                        <label for="floatingTextarea3">Address at Country of Origin</label>
                    </div>
                </div>

                <div class="col-12 col-md-none col-sm-none col-lg-4"></div>

            </div>
        
  </div>
  <div class="tab-pane" id="messages" tabid="ContractInformation" role="tabpanel" aria-labelledby="messages-tab" tabindex="0">
      
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>
            </div>

            <!-- Joining Date and Last Working Date -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="date" class="form-control text date" id="JoiningDate" placeholder="Joining Date" maxlength="10" groupid="EmployeeDatabase" argumentid="JoiningDate">
                        <label for="JoiningDate">Joining Date</label>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="date" class="form-control text date" id="LastWorkingDate" placeholder="Last Working Date" maxlength="10" groupid="EmployeeDatabase" argumentid="LastWorkingDate">
                        <label for="LastWorkingDate">Last Working Date</label>
                    </div>
                </div>
            </div>

            <!-- Entity and Visa Entity -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="Entity" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="Entity" childcombo="Branch,Department"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'16'}]}">
                            <option value="" selected>Select Entity</option>
                        </select>
                        <label for="Entity">Entity (Company Group)</label>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="VisaEntity" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="VisaEntity"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'19'}]}">
                            <option value="" selected>Select Visa Entity</option>
                        </select>
                        <label for="VisaEntity">Visa Entity</label>
                    </div>
                </div>
            </div>

            <!-- Branch and Department -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="Branch" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="Branch"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'17'},{SPParamName:'SubParentTypeId',Name:'Entity'}]}">
                            <option value="" selected>Select Branch</option>
                        </select>
                        <label for="Branch">Branch</label>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="Department" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="Department"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'18'},{SPParamName:'SubParentTypeId',Name:'Entity'}]}">
                            <option value="" selected>Select Department</option>
                        </select>
                        <label for="Department">Department</label>
                    </div>
                </div>
            </div>

            <!-- Job Category and Job Title -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="JobCategory" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="JobCategory"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'14'}]}">
                            <option value="" selected>Select Job Category</option>
                        </select>
                        <label for="JobCategory">Job Category</label>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text" id="JobTitle" placeholder="Job Title" maxlength="150" groupid="EmployeeDatabase" argumentid="JobTitle">
                        <label for="JobTitle">Job Title</label>
                    </div>
                </div>
            </div>

            <!-- Residency and Residency Type -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4">
                    <label class="fw-bold">On Company's Residency?</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="CompaniesResidencyYes" name="CompaniesResidency" value="1" groupid="EmployeeDatabase" argumentid="CompaniesResidency">
                        <label class="form-check-label" for="CompaniesResidencyYes">Yes</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="CompaniesResidencyNo" name="CompaniesResidency" value="0" checked groupid="EmployeeDatabase" argumentid="CompaniesResidency">
                        <label class="form-check-label" for="CompaniesResidencyNo">No</label>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="ResidencyType" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="ResidencyType"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'15'}]}">
                            <option value="" selected>Select Residency Type</option>
                        </select>
                        <label for="ResidencyType">Residency Type</label>
                    </div>
                </div>
            </div>
        
  </div>
  <div class="tab-pane" id="settings" tabid="PayrollInformation" role="tabpanel" aria-labelledby="settings-tab" tabindex="0">
              <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>
            </div>

            <!-- Basic Salary and Pay As -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-md-6 col-lg-4 ">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="BasicSalary" style="text-align: center; font-weight: bold;" maxlength="10" groupid="EmployeeDatabase" argumentid="BasicSalary" placeholder="Basic Salary">
                        <label for="BasicSalary">Basic Salary</label>
                    </div>
                </div>
<%--                <div class="col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="PayAs" loadon="FirstVisible" style="width: 155px;" groupid="EmployeeDatabase" argumentid="PayAs" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'25'}]}">
                            <option value="" selected="selected">Select Pay As</option>
                        </select>
                        <label for="PayAs">Pay As</label>
                    </div>
                </div>--%>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist required" id="PayAs"
                           loadon="FirstVisible"  groupid="EmployeeDatabase" argumentid="PayAs" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'25'}]}">
                            <option value="" selected="selected">Select Pay As</option>
                        </select>
                        <label for="PayAs">Select Pay As</label>
                    </div>
                </div>

            </div>

            <!-- Overtime Allowance and Bank Name -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="OvertimeAllowance" style="text-align: center;" maxlength="10" groupid="EmployeeDatabase" argumentid="OverTimeAllowance" placeholder="Overtime Allowance">
                        <label for="OvertimeAllowance">Overtime Allowance</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="EMPBankName" loadon="FirstVisible" groupid="EmployeeDatabase" argumentid="BankName" childcombo="BankBranch" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'21'}]}">
                            <option value="" selected="selected">Select Bank</option>
                        </select>
                        <label for="EMPBankName">Bank Name</label>
                    </div>
                </div>
            </div>

            <!-- Housing Allowance and Bank Branch -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="HousingAllowance" style="text-align: center;" maxlength="10" groupid="EmployeeDatabase" argumentid="HousingAllowance" placeholder="Housing Allowance">
                        <label for="HousingAllowance">Housing Allowance</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="BankBranch" loadon="FirstVisible"  groupid="EmployeeDatabase" argumentid="BankBranch" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'22'},{SPParamName:'SubParentTypeId',Name:'BankName'}]}">
                            <option value="" selected="selected">Select Bank Branch</option>
                        </select>
                        <label for="BankBranch">Bank Branch</label>
                    </div>
                </div>
            </div>

            <!-- Position Allowance and Bank Account Number -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="PositionAllowance" style="text-align: center;" maxlength="10" groupid="EmployeeDatabase" argumentid="PositionAllowance" placeholder="Position Allowance">
                        <label for="PositionAllowance">Position Allowance</label>
                    </div>
                </div>
                <div class="col-12 col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text" id="AccountNumber" style="text-align: center;" maxlength="50" groupid="EmployeeDatabase" argumentid="AccountNumber" placeholder="Bank Account Number">
                        <label for="AccountNumber">Bank Account Number</label>
                    </div>
                </div>
            </div>

            <!-- Transport Allowance and Swift Code -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="TransportAllowance" style="text-align: center;" maxlength="10" groupid="EmployeeDatabase" argumentid="TransportAllowance" placeholder="Transport Allowance">
                        <label for="TransportAllowance">Transport Allowance</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text" id="SwiftCode" style="text-align: center;" maxlength="50" groupid="EmployeeDatabase" argumentid="SwiftCode" placeholder="Swift Code">
                        <label for="SwiftCode">Swift Code</label>
                    </div>
                </div>
            </div>

            <!-- Salary Adjustment and Ticket Details -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="SalaryAdjustment" style="text-align: center;" maxlength="10" groupid="EmployeeDatabase" argumentid="SalaryAdjustment" placeholder="Salary Adjustment">
                        <label for="SalaryAdjustment">Salary Adjustment</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <select class="form-select dropdownlist" id="TicketDetails" loadon="FirstVisible"  groupid="EmployeeDatabase" argumentid="TicketDetails" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'20'}]}">
                            <option value="" selected="selected">Select Ticket Details</option>
                        </select>
                        <label for="TicketDetails">Ticket Details</label>
                    </div>
                </div>
            </div>

            <!-- Gross Salary and Ticket Allowance -->
            <div class="row mb-3 justify-content-md-center">
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="GrossSalary" style="text-align: center; font-weight: bold; color: red;" maxlength="10" groupid="EmployeeDatabase" argumentid="GrossSalary" placeholder="Gross Salary">
                        <label for="GrossSalary">Gross Salary</label>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4 col-lg-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number" id="TicketAllowance" style="text-align: center; font-weight: bold;" maxlength="10" groupid="EmployeeDatabase" argumentid="TicketAllowance" placeholder="Ticket Allowance">
                        <label for="TicketAllowance">Ticket Allowance</label>
                    </div>
                </div>
            </div>
        
  </div>
</div>

</div>

