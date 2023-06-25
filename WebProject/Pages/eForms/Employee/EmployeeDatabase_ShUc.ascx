<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.EmployeeDatabase_ShUc" %>

  <table class="w-form-table" cellspacing="2" style="width:100%">
            <tr>
                <td style=" text-align: left;" class="ftitle">
                    <span>Emp ID</span>
                </td>
                <td style=" text-align: left;" class="ftitle">
                <span style="white-space:nowrap">Civil ID</span></td> 
                <td style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">Employee Name</span></td>
                <td style=" text-align: left;" class="ftitle"> 
                      <span style="white-space:nowrap">Job Title</span></td>
                <td style=" text-align: left;" class="ftitle">
                    <span>Status</span></td>
                <td style=" text-align: left;"> 
                    </td>
            </tr>
            <tr>
                <td style=" text-align: left;">

                        <input type="text" class="text" 
                        argumentid="EmpId" groupid="schEmployeeDatabase"></td>
                <td style=" text-align: left;">
                 <input type="text" class="text" 
                        argumentid="CivilId" groupid="schEmployeeDatabase"></td>
                <td style=" text-align: left;">
                         <input type="text" class="text" 
                        argumentid="NameInEnglish" groupid="schEmployeeDatabase"></td>
                <td style=" text-align: left;">
                          <input type="text" class="text" 
                        argumentid="JobTitle" groupid="schEmployeeDatabase"></td>
                <td style=" text-align: left;">
                    <select loadon="FirstVisible" class="dropdownlist" style="width: 165px;"
                            groupid="schEmployeeDatabase" argumentid="EmpStatus" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'24'}]}">
                            <option value="" selected="selected">Select Employee Status</option>
                        </select></td>
                <td style="text-align: left;padding-bottom:0px"> 
                <a href="javascript:void(0);"  class="search ViewButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
<a href="javascript:void(0);"  class="reset ClearButton">
                                     <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
            </tr>
            </table>