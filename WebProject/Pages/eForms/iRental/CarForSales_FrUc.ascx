﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_FrUc" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>
    <tr>
        <td class="ftitle">Car Type*:</td>
        <td  width="32%">

            <input type="radio" class="CommonDisable"   value="N" default="default"  checked="checked" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required" /><label>New Car</label>
            <input type="radio" class="CommonDisable" value="U" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required"/><label>Used Car</label>


        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>Chassis No.*:</nobr>
        </td>
        <td width="100%">
            <input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text required validateunique" primarykey="ChassisNo"
                storeid="iRental_CarsForSale" uniquenotfound="{en:' Chassis Number is valid...',color:'green'}"
                uniquefound="{en:' Duplicate Chassis Number...',color:'red'}" groupid="SalesCarsForm" argumentid="ChassisNo" />
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Car No.:</nobr>
        </td>
        <td>
            <div style="display: none"><span groupid="SalesCarsForm" argumentid="RecId"></span></div>
            <div>
                <%--<input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text  " primarykey="ChassisNo"
                    storeid="iRental_CarsForSale" uniquenotfound="{en:' Car Number is valid...',color:'green'}"
                    uniquefound="{en:' Duplicate Car Number...',color:'red'}" groupid="SalesCarsForm" argumentid="CarNumber" />--%>
                <input type="text"  style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text" 
                groupid="SalesCarsForm" argumentid="CarNumber" />
                <nobr class="ftitle">Registration Date:</nobr>
            <input type="text" groupid="SalesCarsForm" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="RegistrationDate" /></div>
        </td>
    </tr>

  <%--  <tr>
         <td class="ftitle">
            <nobr>Registration Date:</nobr>
        </td>
        <td>
            <input type="text" groupid="SalesCarsForm" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="RegistrationDate" />
        </td>

    </tr>--%>

    <tr>
        <td class="ftitle">
            <nobr>Brand*:</nobr>
        </td>
        <td>
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                groupid="SalesCarsForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
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
                  groupid="SalesCarsForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
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
                groupid="SalesCarsForm" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
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
                groupid="SalesCarsForm" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
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
                groupid="SalesCarsForm" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                <option value="" selected="selected">Select Type</option>
            </select>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>






        
                                <tr>
                            <td class="ftitle">
                                
                            </td>
                            <td>
                                <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="157"/>

                                    <nobr class="ftitle">Expiry Date (dd/mm/yyyy)</nobr> 

                                    <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="0"/>

                                    <nobr class="ftitle">Policy No.</nobr> 
                                  
                            </td>
                        </tr>

                        <tr>
                           
                           
                             <td class="ftitle">
                                <nobr>Full Insurance:</nobr>
                            </td>
                            <td>
                                  <select loadon="FirstVisible" class="dropdownlist" requirederr="&amp;nbsp;*" style="width: 155px;"
                            groupid="SalesCarsForm" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                    </select>
                                    <asp:TextBox ID="FullInsuranceExpiry" runat="server" groupid="SalesCarsForm" MaxLength="10"
                                    Width="150px" class="text date" argumentid="FullInsuranceExpiry" /> 

<%--                                           <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="10">--%>

                                    <asp:TextBox ID="FullInsurancePolicyNo" runat="server" groupid="SalesCarsForm" MaxLength="50"
                                    Width="150px" class="text" style="text-align:center;font-weight:bold;color:red" argumentid="FullInsurancePolicyNo" />

                               

                                     
                            </td>
                        </tr>

    <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1"/>
                            </td>
                        </tr>


    <tr>
        <td class="ftitle">
            <nobr>Current Mileage*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="SalesCarsForm" argumentid="CurrentMileage" />

            <b>KM</b> <span class="smalltext" style="padding-left: 10px; padding-right: 10px;">Enter "<b>0</b>" for Brand New Car</span>
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>Car Location*:</nobr>
        </td>
        <td>
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                groupid="SalesCarsForm" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
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
                groupid="SalesCarsForm" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}">
                <option value="" selected="selected">Select Status</option>
            </select>

            <span class="ftitle" groupid="SalesCarsForm" argumentid="ContractNo" style="padding-left: 20px; color: red"></span>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>
    <tr>
        <td class="ftitle" valign="top">
            <nobr>Comments:</nobr>
        </td>
        <td width="100%">
            <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="CurrentCondition" groupid="SalesCarsForm"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif" />
        </td>
        <td>
            <input type="text" style="display: none" groupid="SalesCarsForm" argumentid="action" value="new" class="noautoreset" />
            <input type="button" id="onUpdate" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>

