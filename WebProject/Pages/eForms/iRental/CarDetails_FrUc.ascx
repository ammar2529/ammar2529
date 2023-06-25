<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarDetails_FrUc" %>

  <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                      <tr> 
                            <td class="ftitle">
                                <nobr>Car For:</nobr>
                            </td>
                            <td width="100%">
                               <input type="radio" checked="checked" default="default" value="Rental" name="CarFor" groupid="CarsForm" argumentid="CarFor"><label>Rental</label>
                               <input type="radio" value="Lease" name="CarFor" groupid="CarsForm" argumentid="CarFor"><label>Lease</label>
                            </td>
                        </tr>

                     <tr>
                            <td class="ftitle">
                                <nobr>Car Number*:</nobr>
                            </td>
                            <td>
                                    <div style="display:none"><span groupid="CarsForm" argumentid="RecId"></span></div>
                                    <div><input type="text" style="text-align:center;width:150px; font-weight:bold;color:red"  maxlength="10" class="text required validateunique" primarykey="RecId"
                                    storeid="iRental_Cars" uniquenotfound="{en:' Car Number is valid...',color:'green'}"  uniquefound="{en:' Duplicate Car Number...',color:'red'}" groupid="CarsForm"  argumentid="CarNumber" /></div>
                            </td> 
                        </tr>


                         <tr>
                            <td class="ftitle">
                                <nobr>Chassis Number*:</nobr>
                            </td>
                            <td width="100%">
                                           <input type="text" style="text-align:center;width:150px;"  maxlength="50" class="text required validateunique" primarykey="RecId"
                                    storeid="iRental_Cars" uniquenotfound="{en:' Chassis Number is valid...',color:'green'}"  uniquefound="{en:' Duplicate Chassis Number...',color:'red'}" groupid="CarsForm"  argumentid="ChassisNo" />
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Brand*:</nobr>
                            </td>
                            <td>
                                    <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                            groupid="CarsForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                                            <option value="" selected="selected">Select Brand</option>
                                    </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Model*:</nobr>
                            </td>
                            <td>
                                     <select class="dropdownlist required" style="width: 155px;"
                                    groupid="CarsForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                                    <option value="" selected="selected">Select Model</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Year*:</nobr>
                            </td>
                            <td>
                                 <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                groupid="CarsForm" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                                <option value="" selected="selected">Select Year</option>
                                </select>
                            </td>
                        </tr>

                                                <tr>
                            <td class="ftitle">
                                <nobr>Color*:</nobr>
                            </td>
                            <td>
                                <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                    groupid="CarsForm" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                                    <option value="" selected="selected">Select Color</option>
                                </select>
                            </td>
                        </tr>
                              <tr>
                            <td class="ftitle">
                                <nobr>Type*:</nobr>
                            </td>
                            <td>
                             <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="CarsForm" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                            <option value="" selected="selected">Select Type</option>
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

                                    <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="25">

                                    <nobr class="ftitle">Policy No.</nobr> 
                                    <nobr class="ftitle" style="padding-left:122px">Value</nobr> 
                                    <nobr class="ftitle" style="padding-left:45px">Amount Paid</nobr> 
                            </td>
                        </tr>

                        <tr>
                            <td class="ftitle">
                                <nobr>Normal Insurance*:</nobr>
                            </td>
                            <td>
                            <select loadon="FirstVisible" class="dropdownlist required" requirederr="&amp;nbsp;*" style="width: 155px;"
                            groupid="CarsForm" argumentid="InsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'8'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                            </select>

                                    <asp:TextBox ID="InsuranceExpiry" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="150px" class="text required date" requirederr="&amp;nbsp;*" argumentid="InsuranceExpiry" /> 

                                     <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="30">

                                    <asp:TextBox ID="InsurancePolicyNo" runat="server" groupid="CarsForm" MaxLength="50"
                                    Width="150px" class="text" style="text-align:center;font-weight:bold;color:red" argumentid="InsurancePolicyNo" />

                                    <asp:TextBox ID="InsurancePolicyValue" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="100px" style="text-align:center" class="text number" alphconf="{allow:'.'}" argumentid="InsurancePolicyValue" /> 

                                    <asp:TextBox ID="InsurancePolicyAmount" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="100px" style="text-align:center" class="text number" alphconf="{allow:'.'}" argumentid="InsurancePolicyAmount" /> 
                            </td>
                        </tr>
                          <tr>
                            <td class="ftitle">
                                <nobr>Full Insurance:</nobr>
                            </td>
                            <td>
                                  <select loadon="FirstVisible" class="dropdownlist" requirederr="&amp;nbsp;*" style="width: 155px;"
                            groupid="CarsForm" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                    </select>
                                    <asp:TextBox ID="FullInsuranceExpiry" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="150px" class="text date" argumentid="FullInsuranceExpiry" /> 

                                           <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="30">

                                    <asp:TextBox ID="FullInsurancePolicyNo" runat="server" groupid="CarsForm" MaxLength="50"
                                    Width="150px" class="text" style="text-align:center;font-weight:bold;color:red" argumentid="FullInsurancePolicyNo" />

                                    <asp:TextBox ID="FullInsurancePolicyValue" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="100px" style="text-align:center" class="text number" alphconf="{allow:'.'}" argumentid="FullInsurancePolicyValue" /> 

                                    <asp:TextBox ID="FullInsurancePolicyAmount" runat="server" groupid="CarsForm" MaxLength="10"
                                    Width="100px" style="text-align:center" class="text number" alphconf="{allow:'.'}" argumentid="FullInsurancePolicyAmount" /> 
                            </td>
                        </tr>

                               <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                        <tr>
                            <td class="ftitle">
                                <nobr>Current Mileage*:</nobr>
                            </td>
                            <td>
                          
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text required number"
                                    groupid="CarsForm"  argumentid="CurrentMileage" />

                                    <b>KM</b> <span class="smalltext" style="padding-left:10px;padding-right:10px;">Enter "<b>0</b>" for Brand New Car</span>
                            </td>
                        </tr>
                             <tr>
                            <td class="ftitle">
                                <nobr>Car Location*:</nobr>
                            </td>
                            <td>
                                          <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="CarsForm" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>
                            </td>
                        </tr>
                             <tr>
                            <td class="ftitle">
                                <nobr>Car Status*:</nobr>
                            </td>
                            <td>
                                                         <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="CarsForm" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'9'}]}">
                            <option value="" selected="selected">Select Status</option>
                    </select>

                        <span class="ftitle" groupid="CarsForm" argumentid="ContractNo" style="padding-left:20px;color:red"></span>
                            </td>
                        </tr>
                            <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                                  <tr>
                            <td class="ftitle" valign="top">
                                <nobr>Current Condition:</nobr>
                            </td>
                            <td width="100%">
                               <textarea class="textarea"  rows="6" wrap="1" cols="37" argumentid="CurrentCondition" groupid="CarsForm" ></textarea>
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
                            <td >

                                                  <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Cars',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">                   
                                
                            </td>
                        </tr>
                    </table>
