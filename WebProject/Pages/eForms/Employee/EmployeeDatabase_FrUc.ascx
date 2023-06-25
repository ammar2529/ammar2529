<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.EmployeeDatabase_FrUc" %>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
    <tr>
        <td style="padding-top: 10px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="BasicInformation">
                    <div>
                        Basic Information</div>
                </li>
                <li tabid="ContactInformation">
                    <div>
                        Contact Information</div>
                </li> 
                <li tabid="ContractInformation">
                    <div>
                        Contract Information</div>
                </li>
                <li tabid="PayrollInfomation" style="border-right: 1px solid #8298B0;">
                    <div>
                        Payroll Information</div>
                </li>
            </ul>
        </td>
    </tr>
    <tr tabid="BasicInformation">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">
                        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Employee ID*:</nobr>
                    </td>
                    <td width="100%">
                        <div style="display: none">
                            <span groupid="EmployeeDatabase" argumentid="RecId"></span>
                        </div>
                        <div style="width:325px; float:left">
                            <input type="text" style="text-align: center; font-weight:bold; color:Red; width: 150px;" maxlength="10" class="text required number"
                                groupid="EmployeeDatabase" argumentid="EmpId" /></div><div style="float:left"><nobr class="ftitle" style="padding-right:10px;font-style:italic; color:red">Employee Status*:</nobr>
                                <select loadon="FirstVisible" class="dropdownlist required" style="width: 165px;"
                            groupid="EmployeeDatabase" argumentid="EmpStatus" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'24'}]}">
                            <option value="" selected="selected">Select Employee Status</option>
                        </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Employee Name (In English)*:</nobr>
                    </td>
                    <td>
                        <input type="text" style="text-align: center;font-weight:bold;  width: 300px;" maxlength="255" class="text required alphanumericspacedot"
                            groupid="EmployeeDatabase" argumentid="NameInEnglish" />
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Employee Name (In Arabic):</nobr>
                    </td>
                    <td>
                        <input type="text" style="text-align: center; font-size:16px;font-weight:bold; width: 300px;" maxlength="255" class="text"
                            groupid="EmployeeDatabase" argumentid="NameInArabic" />
                    </td>
                </tr>
                               <tr>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                                        <input type="radio" checked="checked" default="default" value="0" name="Gender"
                                            groupid="EmployeeDatabase" argumentid="Gender"><label>Male</label>
                                        <input type="radio" value="1" name="Gender" groupid="EmployeeDatabase" argumentid="Gender"><label>Female</label>
                    </td>
                </tr>

                                <tr>
                    <td class="ftitle">
                        <nobr>Date of Birth:</nobr>
                    </td>
                    <td>
                       <input type="text" style="width: 150px;" maxlength="10" class="text date" groupid="EmployeeDatabase" argumentid="DateOfBirth" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Religion:</nobr>
                    </td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="Religion" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'13'}]}">
                            <option value="" selected="selected">Select Religion</option>
                        </select>
                    </td>
                </tr>

                                <tr>
                    <td class="ftitle">
                        <nobr>Marital Status:</nobr>
                    </td>
                    <td>
                       <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="MaritalStatus" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'23'}]}">
                            <option value="" selected="selected">Select Marital Status</option>
                        </select>
                    </td>
                </tr>
                             <tr>
                    <td class="ftitle">
                        <nobr>Nationality*:</nobr>
                    </td>
                    <td>
                                   <select loadon="FirstVisible" class="dropdownlist required" style="width: 215px;"
                            groupid="EmployeeDatabase" argumentid="Nationality" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'1'}]}">
                            <option value="" selected="selected">Select Nationality</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                    </td>
                    <td>
                        <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="154">
                        <nobr class="ftitle">Expiry Date (dd/mm/yyyy)</nobr>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Passport No:</nobr>
                    </td>
                    <td>
                                            <input type="text" style="width: 150px;" maxlength="50" class="text alphanumericspacedot"
                            groupid="EmployeeDatabase" argumentid="PassportNo" />
                                                    <input type="text" style="width: 150px;" maxlength="10" class="text date"
                            groupid="EmployeeDatabase" argumentid="PassportExpiryDate" />

                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Civil ID No:</nobr>
                    </td>
                    <td>

                                                                <input type="text" style="width: 150px;" maxlength="12" class="text number required"
                            requirederr="&amp;nbsp;*" groupid="EmployeeDatabase" argumentid="CivilId" />
                                                    <input type="text" style="width: 150px;" maxlength="10" class="text date"
                            groupid="EmployeeDatabase" argumentid="ResidencyExpiryDate" />

                    </td>
                </tr>      
                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                                <tr>
                    <td class="ftitle">
                        <nobr>System User ID:</nobr>
                    </td>
                    <td>
                    <input type="text" style="width: 150px;" maxlength="50" class="text" groupid="EmployeeDatabase" argumentid="UserId" />
                    </td>
                </tr>    

                    <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                    </td>
                    <td>
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Employee_DB',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr tabid="ContactInformation" style="display: none;">
        <td style="padding-top: 1px;">
                        <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="tr1">
                    <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">
                        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                    </td>
                </tr>
                                <tr>
                    <td class="ftitle">
                        <nobr>Landline Number:</nobr>
                    </td>
                    <td width="100%">
                     <input type="text" style="width: 150px;text-align:center;" maxlength="20" class="text number"
                            groupid="EmployeeDatabase" argumentid="LandlineNumber" />
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Mobile Number:</nobr>
                    </td>
                    <td>
                                             <input type="text" style="width: 150px;text-align:center;" maxlength="20" class="text number"
                            groupid="EmployeeDatabase" argumentid="MobileNumber" />
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Other Number:</nobr>
                    </td>
                    <td>
                          <input type="text" style="width: 150px;text-align:center;" maxlength="20" class="text number"
                            groupid="EmployeeDatabase" argumentid="OtherNumber" />
                    </td>
                </tr>
                           <tr>
                    <td class="ftitle">
                        <nobr style="color:Red">Emergency Contact Number:</nobr>
                    </td>
                    <td>
                          <input type="text" style="width: 150px; text-align:center; font-weight:bold" maxlength="20" class="text number"
                            groupid="EmployeeDatabase" argumentid="EmergencyContactNumber" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Official Email Address:</nobr>
                    </td>
                    <td>
                        <input type="text" style="width: 235px;" maxlength="255" class="text email"
                            groupid="EmployeeDatabase" argumentid="OfficialEmail" />
                    </td>
                </tr>
                                <tr>
                    <td class="ftitle">
                        <nobr>Personal Email Address:</nobr>
                    </td>
                    <td>
                                            <input type="text" style="width: 235px;" maxlength="255" class="text email"
                            groupid="EmployeeDatabase" argumentid="PersonalEmail" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                       
                    </td>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="ftitle">
                                    <nobr>Employee Local Address</nobr>
                                </td>
                                <td class="ftitle" style="padding-left: 5px">
                                    <nobr>Address at Country of Origin</nobr>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%">
                                    <textarea class="textarea" rows="6" wrap="1" cols="50" argumentid="LocalAddress" groupid="EmployeeDatabase"></textarea>
                                </td>
                                <td style="width: 50%; padding-left: 5px">
                                    <textarea class="textarea" rows="6" wrap="1" cols="50" argumentid="AddressAtCountryOfOrigin"
                                        groupid="EmployeeDatabase"></textarea>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
        </td>
    </tr>
    <tr tabid="ContractInformation" style="display: none;">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="tr2">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">
                        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                    </td>
                </tr>
                                <tr>
                    <td width="20%" class="ftitle">
                        <nobr>Joining Date:</nobr>
                    </td>
                    <td width="30%">
                      <input type="text" style="width: 150px;" maxlength="10" class="text date"
                            groupid="EmployeeDatabase" argumentid="JoiningDate" />
                    </td>
                                <td width="20%" class="ftitle">
                        <nobr>Last Working Date:</nobr>
                    </td>
                    <td width="30%">
                     <input type="text" style="width: 150px;" maxlength="10" class="text date"
                            groupid="EmployeeDatabase" argumentid="LastWorkingDate" />
                    </td>
                </tr>
                                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                                                <tr>
                    <td class="ftitle">
                        <nobr>Entity (Company Group):</nobr>
                    </td>
                    <td>
                       <select loadon="FirstVisible"  class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="Entity" childcombo="Branch,Department" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'16'}]}">
                            <option value="" selected="selected">Select Entity</option>
                        </select>
                    </td>
                                <td class="ftitle">
                        <nobr>Visa Entity:</nobr>
                    </td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="VisaEntity" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'19'}]}">
                            <option value="" selected="selected">Select Visa Entity</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Branch:</nobr>
                    </td>
                    <td>
                       <select class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="Branch" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'17'},{SPParamName:'SubParentTypeId',Name:'Entity'}]}">
                            <option value="" selected="selected">Select Branch</option>
                        </select>
                    </td>
                                <td class="ftitle">
                        <nobr>Department:</nobr>
                    </td>
                    <td>
                        <select class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="Department" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'18'},{SPParamName:'SubParentTypeId',Name:'Entity'}]}">
                            <option value="" selected="selected">Select Department</option>
                        </select>
                    </td>
                </tr>

                
                                                <tr>
                    <td class="ftitle">
                        <nobr>Job Category:</nobr>
                    </td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="JobCategory" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'14'}]}">
                            <option value="" selected="selected">Select Job Category</option>
                        </select>
                    </td>
                                <td class="ftitle">
                        <nobr>Job Title:</nobr>
                    </td>
                    <td>
                           <input type="text" style="width: 230px;" maxlength="150" class="text"
                            groupid="EmployeeDatabase" argumentid="JobTitle" />
                    </td>
                </tr>
                                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>
                                <tr>
                    <td class="ftitle">
                        <nobr>On Company's Residency?</nobr>
                    </td>
                    <td>
                                        <input type="radio" value="1" name="CompaniesResidency" groupid="EmployeeDatabase" argumentid="CompaniesResidency"><label>Yes</label>
                                        <input type="radio" checked="checked" default="default" value="0" name="CompaniesResidency" groupid="EmployeeDatabase" argumentid="CompaniesResidency"><label>No</label>
                    </td>
                                <td class="ftitle">
                        <nobr>Residency Type:</nobr>
                    </td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" style="width: 235px;"
                            groupid="EmployeeDatabase" argumentid="ResidencyType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'15'}]}">
                            <option value="" selected="selected">Select Residency Type</option>
                        </select>
                    </td>
                </tr>
                </table>
        </td>
    </tr>

        <tr tabid="PayrollInfomation" style="display: none;">
        <td style="padding-top: 1px;">
                <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                     <tr id="tr3">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">
                        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                    </td>
                </tr>
                                <tr>
                    <td width="20%" class="ftitle">
                        <nobr>Basic Salary:</nobr>
                    </td>
                    <td width="30%">
                      <input type="text" style="width: 150px;text-align:center; font-weight:bold" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="BasicSalary" />
                    </td>
                                <td width="20%" class="ftitle">
                        <nobr>Pay As:</nobr>
                    </td>
                    <td width="30%">
                            <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="PayAs" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'25'}]}">
                            <option value="" selected="selected">Select Pay As</option>
                        </select>
                    </td>
                </tr>

                    <tr>
                    <td class="ftitle">
                        <nobr>Overtime Allowance:</nobr>
                    </td>
                    <td>
                      <input type="text" style="width: 150px;text-align:center;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="OverTimeAllowance" />
                    </td>
                                <td width="20%" class="ftitle">
                        <nobr>Bank Name:</nobr>
                    </td>
                    <td width="30%">
                          <select loadon="FirstVisible" childcombo="BankBranch" class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="BankName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'21'}]}">
                            <option value="" selected="selected">Select Bank</option>
                        </select>
                    </td>
                </tr>

                                    <tr>
                    <td class="ftitle">
                        <nobr>Housing Allowance:</nobr>
                    </td>
                    <td>
                      <input type="text" style="width: 150px;text-align:center;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="HousingAllowance" />
                    </td>
                                <td class="ftitle">
                        <nobr>Bank Branch:</nobr>
                    </td>
                    <td>
                                            <select class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="BankBranch" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'22'},{SPParamName:'SubParentTypeId',Name:'BankName'}]}">
                            <option value="" selected="selected">Select Bank Branch</option>
                        </select>
                    </td>
                </tr>

                 <tr>
                    <td class="ftitle">
                        <nobr>Position Allowance:</nobr>
                    </td>
                    <td>
                                           <input type="text" style="width: 150px;text-align:center;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="PositionAllowance" />
                    </td>
                                <td class="ftitle">
                        <nobr>Bank Account Number:</nobr>
                    </td>
                    <td>
                      <input type="text" style="width: 150px;text-align:center;" maxlength="50" class="text"
                            groupid="EmployeeDatabase" argumentid="AccountNumber" />
                    </td>
                </tr>

                                 <tr>
                    <td class="ftitle">
                        <nobr>Transport Allowance:</nobr>
                    </td>
                    <td>
                                           <input type="text" style="width: 150px;text-align:center;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="TransportAllowance" />
                    </td>
                                <td class="ftitle">
                        <nobr>Swift Code:</nobr>
                    </td>
                    <td>
                      <input type="text" style="width: 150px;text-align:center;" maxlength="50" class="text"
                            groupid="EmployeeDatabase" argumentid="SwiftCode" />
                    </td>
                </tr>

                                                 <tr>
                    <td class="ftitle">
                        <nobr>Salary Adjustment:</nobr>
                    </td>
                    <td>
                                           <input type="text" style="width: 150px;text-align:center;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="SalaryAdjustment" />
                    </td>
                                <td class="ftitle">
                        <nobr>Ticket Details:</nobr>
                    </td>
                    <td>

                        <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="EmployeeDatabase" argumentid="TicketDetails" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'20'}]}">
                            <option value="" selected="selected">Select Ticket Details</option>
                        </select>

                    </td>
                </tr>

                                                                 <tr>
                    <td class="ftitle">
                        <nobr>Gross Salary:</nobr>
                    </td>
                    <td>
                                           <input type="text" style="width: 150px;text-align:center; font-weight:bold;color:red;" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="GrossSalary" />
                    </td>
                                <td class="ftitle">
                        <nobr>Ticket Allowance:</nobr>
                    </td>
                    <td>
                                                               <input type="text" style="width: 150px;text-align:center;font-weight:bold" maxlength="10" class="text number"
                            groupid="EmployeeDatabase" argumentid="TicketAllowance" />
                    </td>
                </tr>
                </table>
         </td>
         </tr>
</table>
