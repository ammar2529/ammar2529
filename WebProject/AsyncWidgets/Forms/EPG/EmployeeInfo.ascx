<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeInfo.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.EPG.EmployeeInfo" %>

<style>
    .SimpleTab
    {
       height: 21px; 
       cursor:pointer;
    }
    .SimpleTab li
    {
        background-color:Black;
        display:inline;
        float:left;
        height: 20px;
       border-left:1px solid #8298B0;
       border-top:1px solid #8298B0;
	    border-bottom:1px solid #8298B0;
       font-size: 10px;
        font-weight:bold;
       font-family:Arial;
    }
.SimpleTab li.active div {
    background: none repeat scroll 0 0 black;
    color:White;
    
       
}
.SimpleTab li div {
    background: url('/App_Themes/Silver/Images/SliverMenu.gif') repeat scroll 0 -6px green;
    text-decoration: none;
    height: 15px;
    padding-top:4px;
    padding-bottom:2px;
    font-style: normal;
    width:120px;
    text-align:center;
    
}
.FormTable td
{
    border: 1px solid #B4B7D9;

    position: relative;
    text-align: left;   
    padding-left:4px;
        padding-right: 2px;
        padding-top: 2px;
        padding-bottom: 2px;
    }
.FormLabel
{
        color: #333333;
    font-family: Calibri;
    font-size: 12px;
        font-weight:bold;
    }
.ReadOnlyTextbox
{
    background-color:transparent ;
    border-color:transparent ;    
}
</style>
    <div style="padding:10px;" >
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
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
                        <li tabid="PayrollInfomation">
                            <div>
                                Payroll Information</div>
                        </li>
						<li tabid="Circular" style="border-right:1px solid #8298B0;">
                            <div style="width:80px">
                                Circular</div>
                        </li>
                    </ul>
                    </td><td style="text-align:right; padding-bottom:4px">
                    <a href="#" class="EditProfile" style="font-size: 11px;color: #105678;">Edit Profile</a>
                    <a href="#" class="Cancel" style="display:none;font-size: 11px;color: #105678;" >Cancel</a>
                    <input  type="button" style="display:none;width: 80px" value="Save" class="DataAction PWCButton btnUpdateForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'EPG_UPD_EmployeeInfo',filter:'input:visible,textarea:visible,select:visible,.formid,.tabid'}">
                    </td></tr></table>
                </td>
            </tr>
            <tr tabid="BasicInfomation">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                    <tr class="EMPInfoNotFound" style="display:none;">
                            <td colspan="4" class="PWCLabel" style="color:red;">
                             Employee information not found!</td>
                        </tr>
                        <tr >
                            <td style="width:25%">
                               <span class="FormLabel">Employee Id</span> </td>
                            <td style="width:25%">
                                <span groupid="EmployeeInfo" argumentid="EmpId" style="padding-top:2px;display:block;height:14px;width:150px;color:White;background-color:graytext;font-weight:bold;text-align: center;" class="PWCTextBox" >
                                &nbsp;</span> 
                                <div style="display:none">
                                <input type="text" class="formid" groupid="EmployeeInfo" argumentid="FormId" />
                                <input type="text" value="BasicInfomation" class="tabid" groupid="EmployeeInfo" argumentid="TabId" />
                                </div> 
                                </td>
                            <td colspan="2" rowspan="5">
                               
                                &nbsp;</td>
                        </tr>
                        <tr >
                            <td style="width:25%">
                            <span class="FormLabel">Given Name</span>  
                            </td>
                            <td style="width:25%">
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="GivenName"></span>  

                        <input type="text" groupid="EmployeeInfo" argumentid="GivenName" style="width: 150px;display:none"
                             class="PWCTextBox" alt="" />
                            </td>
                        </tr>
                        <tr>
                            <td >
                             <span class="FormLabel"> Middle Name</span>  
                             
                            </td>
                            <td> <span></span> 
                            <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="MiddleName"></span>  
                              <input type="text" groupid="EmployeeInfo" argumentid="MiddleName" style="width: 150px;display:none"
                            class="PWCTextBox"  />
                            </td>
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Family Name</span>  
                             
                            </td>
                            <td> <span></span> 
                                <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="FamilyName"></span>  
                              <input type="text" groupid="EmployeeInfo" argumentid="FamilyName" style="width: 150px;display:none"
                           class="PWCTextBox"  />
                            </td>
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Name in Arabic</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="NameInArabic"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="NameInArabic"style="width: 150px;display:none"
                          class="PWCTextBox" alt="" />
                            </td>
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Gender</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="Gender"></span> 
                            <select class="PWCListBox" style="width: 150px ;display:none"   groupid="EmployeeInfo" argumentid="Gender"
                            storeinfo="{Command:'EPG_SEL_EmpInfoCBO',TextCol:'Name',ValCol:'ChildId'}">
							    <option value="" selected="selected" >Select Gender</option>
						    </select>
                            </td>
                            <td style="width:25%">
                             <span class="FormLabel">Passport No</span>  
                             
                            </td>
                            <td style="width:25%"> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="PassportNo"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="PassportNo" style="width: 150px ;display:none"
                            class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Date of Birth</span>  
                             
                            </td>
                            <td> <span></span> 
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="DateOfBirth"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="DateOfBirth" style="width: 150px ;display:none"
                            class="PWCTextBox date" alt="" />
                            </td>
                            <td>
                             <span class="FormLabel">Passport Expiry Date</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="PassportExpiryDate"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="PassportExpiryDate" style="width: 150px ;display:none"
                            class="PWCTextBox date" alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Religion</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="Religion"></span> 
                        <select class="PWCListBox" style="width: 150px ;display:none"   groupid="EmployeeInfo" argumentid="Religion"
                        storeinfo="{Command:'EPG_SEL_EmpInfoCBO',TextCol:'Name',ValCol:'ChildId'}" >
							    <option value="" selected="selected" >Select Religion</option>
   						    </select>
                            </td>
                            <td>
                             <span class="FormLabel">Residency Type</span>  
                             
                            </td>
                            <td>
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="ResidencyType"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="ResidencyType" style="width: 150px ;display:none"
                          class="PWCTextBox " alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Nationality</span>  
                             
                            </td>
                            <td> <span></span> 
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="Nationality"></span> 
                           <select class="PWCListBox" style="width: 150px ;display:none"   groupid="EmployeeInfo" argumentid="Nationality"
                           storeinfo="{Command:'EPG_SEL_EmpInfoCBO',TextCol:'Name',ValCol:'ChildId'}" >
							    <option value="" selected="selected" >Select Nationality</option>
                                 

						    </select>
                            </td>
                            <td>
                             <span class="FormLabel">Residency Expiry Date</span> </td>
                            <td> <span></span> 
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="ResidencyExpiryDate"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="ResidencyExpiryDate" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                                                
                                     </table>
                </td>
            </tr>
            <tr tabid="ContactInformation" style="display:none;">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                        <tr >
                            <td style="width:25%">
                            <span class="FormLabel">Email Address</span>  
                            </td>
                            <td style=""> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="EmailId"></span>  

                        <input type="text" groupid="EmployeeInfo" argumentid="EmailId" style="width: 220px;display:none"
                           class="PWCTextBox" alt="" />
                            </td>
                           
                        </tr>
                        <tr>
                            <td >
                             <span class="FormLabel">Landline Number</span>  
                             
                            </td>
                            <td> <span></span> 
                            <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="LandlineNumber"></span>  
                              <input type="text" groupid="EmployeeInfo" argumentid="LandlineNumber" style="width: 220px;display:none"
                            class="PWCTextBox"  />
                            </td>
                           
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">MobileNumber</span>  
                             
                            </td>
                            <td> <span></span> 
                                <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="MobileNumber"></span>  
                              <input type="text" groupid="EmployeeInfo" argumentid="MobileNumber" style="width: 220px;display:none"
                         class="PWCTextBox"  />
                            </td>
                            
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Other Contact Number</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="OtherNumber"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="OtherNumber"style="width: 220px;display:none"
                            class="PWCTextBox" alt="" />
                            </td>
                           
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Mailing Address</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="MailingAddress"></span> 
                        <textarea  groupid="EmployeeInfo" argumentid="MailingAddress"  style="width:450px;display:none"" 
                                    class="PWCTextBox" cols="20" rows="3" ></textarea>
                            </td>

                        </tr>
                         <tr>
                            <td >
                             <span class="FormLabel">Street Address</span>  
                             
                            </td>
                            <td> <span></span> 
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="StreetAddress"></span> 
<%--                              <input type="text" groupid="EmployeeInfo" argumentid="StreetAddress" style="width: 150px ;display:none"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" />--%>
                         <textarea  groupid="EmployeeInfo" argumentid="StreetAddress"  style="width:450px;display:none"" 
                                    class="PWCTextBox" cols="20" rows="3" ></textarea>
                            </td>
                        </tr>
                </table>
                </td>
            </tr>
            <tr tabid="ContractInformation" style="display:none;">
        <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
            <table class="FormTable" style=" width: 100%" cellspacing="1" >
                <tr >
                    <td style="width:25%">
                    <span class="FormLabel">Joining Date</span>  
                    </td>
                    <td style="width:25%"> <span></span> 
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="JoiningDate"></span>  

                <input type="text" groupid="EmployeeInfo" argumentid="JoiningDate" style="width: 150px;display:none"
                   class="PWCTextBox" alt="" />
                    </td>
                           
                    <td style="width:25%">
                        <span class="FormLabel">Direct Line Manager</span></td>
                           
                    <td style="width:25%"> <span></span> 
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="DirectLineManager"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="DirectLineManager" style="width: 150px ;display:none"
                    class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                <tr>
                    <td >
                        <span class="FormLabel">Job Title</span>  
                             
                    </td>
                    <td> <span></span> 
                   <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="JobTitle"></span>  
                <input type="text" groupid="EmployeeInfo" argumentid="JobTitle" style="width: 150px;display:none"
                  class="PWCTextBox" />
                    </td>
                           
                    <td>
                        <span class="FormLabel">Branch Name</span></td>
                           
                    <td> <span></span> 
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="BranchName"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="BranchName" style="width: 150px ;display:none"
                  class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        <tr>
                    <td >
                        <span class="FormLabel">Job Category</span>  
                             
                    </td>
                    <td><span></span> 
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="JobCategory"></span>  
                        <input type="text" groupid="EmployeeInfo" argumentid="JobCategory" style="width: 150px;display:none"
                    class="PWCTextBox"  />
                    </td>
                            
                    <td>
                        <span class="FormLabel">No of Working Days</span> </td>
                            
                    <td><span></span>
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="NoOfWorkingDays"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="NoOfWorkingDays" style="width: 150px ;display:none"
                    class="PWCTextBox" alt="" />
                </td>
                            
                </tr>
                                        <tr>
                    <td >
                        <span class="FormLabel">Job Sub Category</span>  
                             
                    </td>
                    <td><span></span>
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="JobSubCategory"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="JobSubCategory"style="width: 150px;display:none"
                   class="PWCTextBox" alt="" />
                    </td>
                           
                    <td>
                        <span class="FormLabel">Time In</span></td>
                           
                    <td><span></span>
                      <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="TimeIn"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="TimeIn" style="width: 150px ;display:none"
                 class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        <tr>
                    <td >
                         <span class="FormLabel">Subject</span>  </td>
                    <td><span></span>
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="Subject"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="Subject"style="width: 150px;display:none"
                   class="PWCTextBox" alt="" />
                </td>
                           
                    <td>
                        <span class="FormLabel">Time Out</span></td>
                           
                    <td><span></span>
                      <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="TimeOut"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="TimeOut" style="width: 150px ;display:none"
                   class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        <tr>
                    <td >
                         <span class="FormLabel">No of Classes</span> </td>
                    <td><span></span>
                       <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="NoOfClasses"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="NoOfClasses"style="width: 150px;display:none"
                  class="PWCTextBox" alt="" />
                </td>
                           
                    <td>
                      <span class="FormLabel">MOE Approval Number</span> </td>
                           
                    <td><span></span>
                        <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="MOEApprovalNumber"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="MOEApprovalNumber"style="width: 150px;display:none"
                 class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        <tr>
                    <td >
                         <span class="FormLabel">Level of Class</span></td>
                    <td><span></span>
                       <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="LevelOfClass"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="LevelOfClass"style="width: 150px;display:none"
                    class="PWCTextBox" alt="" />
                </td>
                           
                    <td rowspan="2">
                           <span class="FormLabel">Is the Employee on Company’s Residency?</span>  </td>
                           
                    <td rowspan="2"><span></span>
                         <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="CompaniesResidency"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="CompaniesResidency" style="width: 150px ;display:none"
                    class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        <tr>
                    <td >
                          <span class="FormLabel"> Group Of Class</span></td>
                    <td><span></span>
                         <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="GroupOfClass"></span> 
                        <input type="text" groupid="EmployeeInfo" argumentid="GroupOfClass"style="width: 150px;display:none"
                  class="PWCTextBox" alt="" />
                </td>
                           
                </tr>
                                        </table>
        </td>
    </tr>
          <tr tabid="PayrollInfomation" style="display:none">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                      <tr>
                            <td style="width:25%">
                             <span class="FormLabel">Basic Salary</span>  
                             
                            </td>
                            <td style="width:25%;text-align:center"><span></span>
                                <span  class="FormLabel" style="font-weight:normal" groupid="EmployeeInfo" argumentid="BasicSalary"></span>  
                              <input type="text" groupid="EmployeeInfo" argumentid="BasicSalary" style="width: 150px;display:none"
                          class="PWCTextBox"  />
                            </td>
                            <td  style="width:25%">
                             <span class="FormLabel">Bank Name</span>  
                             
                            </td>
                            <td  style="width:25%;"><span></span>
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="BankName"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="BankName" style="width: 150px ;display:none"
                        class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                         <tr>
                            <td >
                             <span class="FormLabel">Overtime Allowance</span>  
                             
                            </td>
                            <td style="text-align:center"><span></span>
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="OverTimeAllowance"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="OverTimeAllowance"style="width: 150px;display:none"
                          class="PWCTextBox" alt="" />
                            </td>
                           <td>
                             <span class="FormLabel">Branch</span>  
                             
                            </td>
                            <td><span></span>
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="Branch"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="Branch" style="width: 150px ;display:none"
                          class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                <tr>
                            <td >
                             <span class="FormLabel">Housing Allowance</span>  
                             
                            </td>
                            <td style="text-align:center"><span></span>
                             <span  class="FormLabel" style="font-weight:normal;text-align:center" groupid="EmployeeInfo" argumentid="HousingAllowance"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="HousingAllowance" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                            </td>
                          <td>
                             <span class="FormLabel">Account Number</span>  
                             
                            </td>
                            <td><span></span>
                             <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="AccountNumber"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="AccountNumber" style="width: 150px ;display:none"
                         class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Position Allowance</span>  
                             
                            </td>
                            <td style="text-align:center"><span></span>
                              <span  class="FormLabel" style="font-weight:normal;text-align:center" groupid="EmployeeInfo" argumentid="PositionAllowance"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="PositionAllowance" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                            </td>
                            <td>
                             <span class="FormLabel">Swift Code</span> </td>
                            <td><span></span>
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="SwiftCode"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="SwiftCode" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Transport Allowance</span>  
                             
                            </td>
                            <td style="text-align:center"><span></span>
                             <span  class="FormLabel" style="font-weight:normal;text-align:center" groupid="EmployeeInfo" argumentid="TransportAllowance"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="TransportAllowance" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                            </td>
                             <td>
                             <span class="FormLabel">Ticket Details</span> </td>
                            <td><span></span>
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="TicketDetails"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="TicketDetails" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                        <tr>
                            <td >
                             <span class="FormLabel">Gross Salary</span>  
                             
                            </td>
                            <td style="text-align:center"><span></span>
                              <span  class="FormLabel" style="font-weight:normal;text-align:center" groupid="EmployeeInfo" argumentid="GrossSalary"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="GrossSalary" style="width: 150px ;display:none"
                            class="PWCTextBox" alt="" />
                            </td>
                            <td>
                             <span class="FormLabel">Summer Vacation Status</span> </td>
                            <td><span></span>
                              <span  class="FormLabel" style="font-weight:normal;" groupid="EmployeeInfo" argumentid="SummerVacationStatus"></span> 
                              <input type="text" groupid="EmployeeInfo" argumentid="SummerVacationStatus" style="width: 150px ;display:none"
                           class="PWCTextBox" alt="" />
                        </td>
                        </tr>
                                                                                                
                                     </table>
                </td>
            </tr>
          <tr tabid="Circular" style="display:none">
                <td style="background: #EEEEFF;padding:10px;border: 1px solid #8298B0;">
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                      <tr >
                            <td style="text-align:center">
							
							<br /> 
							<br />
							<br />
                             <span class="FormLabel">Coming Soon !!!</span>  

							<br />
							<br />
							<br />
							<br />
                            </td>
                           
                        </tr>
					</table>
                </td>
            </tr>
        </table>
    </div>