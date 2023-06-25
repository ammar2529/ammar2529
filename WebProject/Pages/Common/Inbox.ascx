<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inbox.ascx.cs" Inherits="WebProject.Pages.Common.Inbox" %>

 <div style="padding:10px;" >
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="EmpInfo" >
            <tr>
                <td style="padding-bottom:1px;">
                <table cellspacing="0" cellpadding="0" border="0" style="width:100%"><tr><td>
                    <ul class="SimpleTab" style="margin:0px">
                        <li class="active" tabid="BasicInfomation">
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
                        <li tabid="PayrollInfomation" style="border-right:1px solid #8298B0;">
                            <div>
                                Payroll Information</div>
                        </li>
                    </ul>
                    </td></tr></table>
                </td>
            </tr>
            <tr tabid="BasicInfomation">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                    <tr class="EMPInfoNotFound" style="display:none;">
                            <td colspan="4" class="ftitle" style="color:red;">
                             Employee information not found ...</td>
                        </tr>
                        <tr >
                            <td style="width:25%">
                               <span class="ftitle">Employee Id</span> </td>
                            <td style="width:25%" colspan="3">
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="EmpId"></span>   
                                <div style="display:none">
                                <input type="text" value="BasicInfomation" class="tabid" groupid="EmployeeInfo" argumentid="TabId" />
                                </div> 
                                </td>
                                       
            
                        </tr>
                        <tr >
                                            <td> <span class="ftitle">Name In English</span></td>
                            <td colspan="3">  
                            <span class="ftitle" groupid="EmployeeInfo" argumentid="NameInEnglish"></span>
                          </td>

                        </tr>
                                                <tr>
                            <td >
                             <span class="ftitle">Name In Arabic</span>  
                             
                            </td>
                            <td colspan="3">
                             <span class="ftitle" style="font-size:16px" groupid="EmployeeInfo" argumentid="NameInArabic"></span> 
                            </td>
                     
                        </tr>
                                                <tr>
                            <td >
                           
                             <span class="ftitle">Gender</span>
                           </td>
                            <td> 
                             <span  class="ftitle" groupid="EmployeeInfo" argumentid="Gender"></span> 
                            </td>
                                        <td >
                             <span class="ftitle">Passport No.</span></td>
                            <td>  <span  class="ftitle" groupid="EmployeeInfo" argumentid="PassportNo"></span> 
                            </td>
                        </tr>
                                                <tr>
                           <td >
                             <span class="ftitle">Date of Birth</span>  
                             
                            </td>
                            <td> <span></span> 
                              <span  class="ftitle" groupid="EmployeeInfo" argumentid="DateOfBirth"></span> 
                            </td>
                              <td >
                             <span class="ftitle">Passport Expiry Date</span></td>
                            <td>
                             <span  class="ftitle" groupid="EmployeeInfo" argumentid="PassportExpiryDate"></span>
                            </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="ftitle">Religion</span></td>
                            <td>  <span  class="ftitle" groupid="EmployeeInfo" argumentid="Religion"></span> 
                            </td>
                                                  <td style="width:25%">
                             <span class="ftitle">Civil ID No.</span></td>
                            <td style="width:25%">
                             <span  class="ftitle" groupid="EmployeeInfo" argumentid="CivilId"></span> 
                        </td>
                        </tr>
                                                                                      <tr>
<td >
                             <span class="ftitle">Nationality</span></td>
                            <td>  <span  class="ftitle" groupid="EmployeeInfo" argumentid="Nationality"></span> 
                            </td>
                                 <td >
                             <span class="ftitle">Civil ID Expiry Date</span></td>
                            <td>
                             <span  class="ftitle" groupid="EmployeeInfo" argumentid="ResidencyExpiryDate"></span>
                            </td>

                        </tr>

                                                                                                  <tr>
                                                                                                                              <td >
                             <span class="ftitle">Marital Status</span></td>
                            <td>  <span  class="ftitle" groupid="EmployeeInfo" argumentid="MaritalStatus"></span> 
                            </td>
                             <td >
                                 <span class="ftitle">Employee Status</span></td>
                            <td> <span   class="ftitle" groupid="EmployeeInfo" argumentid="EmpStatus"></span></td>


            
                        </tr>
                                                                                                
                                                                                                
                                                                        </table>
                </td>
            </tr>
            <tr tabid="ContactInformation" style="display:none;">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                        <tr>
                            <td style="width: 25%">
                                <span class="ftitle">Landline Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="LandlineNumber">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Mobile Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="MobileNumber">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="ftitle">Other Number</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="OtherNumber">
                                </span>
                            </td>
                        </tr>
                                                <tr>
                            <td>
                                <span class="ftitle">Emergency Contact Number</span>
                            </td>
                            <td>
                                <span class="ftitle" style="color:red" groupid="EmployeeInfo" argumentid="EmergencyContactNumber">
                                </span>
                            </td>
                        </tr>

                                           <tr>
                            <td>
                                <span class="ftitle">Official Email Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="OfficialEmail">
                                </span>
                            </td>
                        </tr>

                                                                   <tr>
                            <td>
                                <span class="ftitle">Personal Email Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="PersonalEmail">
                                </span>
                            </td>
                        </tr>

                                                                                           <tr>
                            <td>
                                <span class="ftitle">Employee Local Address</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="LocalAddress">
                                </span>
                            </td>
                        </tr>

                                                                                                                   <tr>
                            <td>
                                <span class="ftitle">Address at Country of Origin</span>
                            </td>
                            <td>
                                <span class="ftitle" groupid="EmployeeInfo" argumentid="AddressAtCountryOfOrigin">
                                </span>
                            </td>
                        </tr>
                </table>
                </td>
            </tr>
            <tr tabid="ContractInformation" style="display:none;">
        <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
            <table class="FormTable" style=" width: 100%" cellspacing="1" >
                <tr>
                    <td style="width: 25%">
                        <span  class="ftitle">Joining Date</span>
                    </td>
                    <td style="width: 25%">
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="JoiningDate">
                        </span>
                    </td>
                    <td style="width: 25%">
                        <span class="ftitle">Last Working Date</span>
                    </td>
                    <td style="width: 25%">
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="LastWorkingDate">
                        </span>
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
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="Entity">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Visa Entity</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="VisaEntity">
                        </span>
                    </td>
                </tr>
                                <tr>
                    <td>
                        <span class="ftitle">Branch</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="Branch">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Department</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="Department">
                        </span>
                    </td>
                </tr>
                                                <tr>
                    <td>
                        <span class="ftitle">Job Category</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="JobCategory">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Job Title</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="JobTitle">
                        </span>
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
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="CompaniesResidency">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Residency Type</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="ResidencyType">
                        </span>
                    </td>
                </tr>
                   <tr>
                    <td colspan="4">
                        <span class="ftitle">&nbsp;</span>
                    </td>
                </tr>

                                        </table>
        </td>
    </tr>
          <tr tabid="PayrollInfomation" style="display:none">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                                    <tr>
                    <td style="width: 25%">
                        <span  class="ftitle">Basic Salary</span>
                    </td>
                    <td style="width: 25%; text-align:center">
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="BasicSalary">
                        </span>
                    </td>
                    <td style="width: 25%">
                        <span class="ftitle">Pay As</span>
                    </td>
                    <td style="width: 25%">
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="PayAs">
                        </span>
                    </td>
                </tr>
                                        <tr>
                    <td>
                        <span class="ftitle">Overtime Allowance</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle"  groupid="EmployeeInfo" argumentid="OverTimeAllowance">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Bank Name</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="BankName">
                        </span>
                    </td>
                </tr>
                                                        <tr>
                    <td>
                        <span class="ftitle">Housing Allowance</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle"  groupid="EmployeeInfo" argumentid="HousingAllowance">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Bank Branch</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="BankBranch">
                        </span>
                    </td>
                </tr>
                                                                        <tr>
                    <td>
                        <span class="ftitle">Position Allowance</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle"  groupid="EmployeeInfo" argumentid="PositionAllowance">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Bank Account Number</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="AccountNumber">
                        </span>
                    </td>
                </tr>
                                                                          <tr>
                    <td>
                        <span class="ftitle">Transport Allowance</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle"  groupid="EmployeeInfo" argumentid="TransportAllowance">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Swift Code</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="SwiftCode">
                        </span>
                    </td>
                </tr>
                                                                                          <tr>
                    <td>
                        <span class="ftitle">Salary Adjustment</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle"  groupid="EmployeeInfo" argumentid="SalaryAdjustment">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Ticket Details</span>
                    </td>
                    <td>
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketDetails">
                        </span>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <span class="ftitle">Gross Salary</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle" style="color:red;text-align:center" groupid="EmployeeInfo" argumentid="GrossSalary">
                        </span>
                    </td>
                    <td>
                        <span class="ftitle">Ticket Allowance</span>
                    </td>
                    <td style="text-align:center">
                        <span class="ftitle" groupid="EmployeeInfo" argumentid="TicketAllowance">
                        </span>
                    </td>
                </tr>
                   <tr>
                    <td colspan="4">
                        <span class="ftitle">&nbsp;</span>
                    </td>
                </tr>
                                                                                                
                                     </table>
                </td>
            </tr>

        </table>
    </div>
