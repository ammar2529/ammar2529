<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_FrUc" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<%--<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>--%>


<%--<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">


      <tr>
      <td colspan="4">
          <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
    <tr>
        <td class="ftitle" style="width:20%">Car Type*:</td>
        <td  >

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
          
                <input type="text"  style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text" 
                groupid="SalesCarsForm" argumentid="CarNumber" />
                <nobr class="ftitle">Registration Date:</nobr>
            <input type="text" groupid="SalesCarsForm" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="RegistrationDate" /></div>
        </td>
    </tr>


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
                      <nobr>Interior Color:</nobr>
                  </td>
                  <td>
                      <select loadon="FirstVisible" class="dropdownlist " style="width: 155px;"
                          groupid="SalesCarsForm" argumentid="InteriorColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'45'}]}">
                          <option value="" selected="selected">Select Interior Color</option>
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
              </table>
          </td>
          </tr>





      <tr>
      <td colspan="4">
          <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
        
                                <tr>
                            <td class="ftitle" style="width:20%">
                                
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


                                    <asp:TextBox ID="FullInsurancePolicyNo" runat="server" groupid="SalesCarsForm" MaxLength="50"
                                    Width="150px" class="text" style="text-align:center;font-weight:bold;color:red" argumentid="FullInsurancePolicyNo" />

                               

                                     
                            </td>
                        </tr>

              </table>
          </td>
          </tr>


      <tr>
      <td colspan="4">
          <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
    <tr>
        <td class="ftitle" style="width:20%">
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
              </table>
          </td>
          </tr>


      <tr>
      <td colspan="4">
          <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
    <tr>
        <td class="ftitle" valign="top" style="width:20%">
            <nobr>Comments:</nobr>
        </td>
        <td width="100%">
            <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="CurrentCondition" groupid="SalesCarsForm" style="width: 70%;height: 45px;resize: none;"></textarea>
        </td>
    </tr>
              </table>
          </td>
          </tr>

      <tr>
      <td colspan="4">
          <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
    <tr>
        <td style="width:20%">
            <img src="App_Themes/eForms_Theme/Images/spacer.gif" />
        </td>
        <td>
            <input type="text" style="display: none" groupid="SalesCarsForm" argumentid="action" value="new" class="noautoreset" />
            <input type="button" id="onUpdate" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
              </table>
          </td>
          </tr>
</table>--%>

<%--<style>
    /* General Material Design Style */
body {
    font-family: 'Roboto', sans-serif;
}

.w-form-table {
    width: 100%;
    margin-bottom: 20px;
}

/* Material Input Fields */
.w-form-table input[type="text"],
.w-form-table input[type="number"],
.w-form-table select,
.w-form-table textarea {
    font-size: 14px;
    padding: 12px;
    border-radius: 4px;
    border: 1px solid #ccc;
    transition: border-color 0.3s ease;
    width: 100%;
    box-sizing: border-box;
}

.w-form-table input[type="text"]:focus,
.w-form-table input[type="number"]:focus,
.w-form-table select:focus,
.w-form-table textarea:focus {
    border-color: #6200ea; /* Material purple */
    outline: none;
}

.w-form-table select {
    padding: 10px;
    font-size: 14px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.w-form-table select:focus {
    border-color: #6200ea;
}

.w-form-table .textarea {
    font-size: 14px;
    border-radius: 4px;
    border: 1px solid #ccc;
    resize: vertical;
    padding: 12px;
}

.w-form-table input[type="radio"] {
    margin-right: 5px;
    cursor: pointer;
}

.w-form-table input[type="radio"]:checked + label {
    font-weight: bold;
}

/* Button Styles */
button, input[type="button"] {
    padding: 12px 24px;
    background-color: #6200ea;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover, input[type="button"]:hover {
    background-color: #3700b3;
}

/* Material Design Header */
.ftitle {
    font-size: 16px;
    color: #333;
}

input[type="text"]:focus,
textarea:focus {
    border-color: #6200ea;
}

</style>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
    <tr>
        <td colspan="4">
            <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
                <!-- Car Type -->
                <tr>
                    <td class="ftitle" style="width:20%">Car Type*:</td>
                    <td>
                        <label><input type="radio" class="CommonDisable" value="N" checked="checked" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required" /> <span>New Car</span></label>
                        <label><input type="radio" class="CommonDisable" value="U" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required" /> <span>Used Car</span></label>
                    </td>
                </tr>
                <!-- Chassis No. -->
                <tr>
                    <td class="ftitle"><nobr>Chassis No.*:</nobr></td>
                    <td><input type="text" class="text required validateunique" groupid="SalesCarsForm" argumentid="ChassisNo" style="text-align: center; width: 150px;" maxlength="50" /></td>
                </tr>
                <!-- Car Number and Registration Date -->
                <tr>
                    <td class="ftitle"><nobr>Car No.:</nobr></td>
                    <td>
                        <input type="text" class="text" style="text-align: center; width: 150px; font-weight: bold; color: red;" maxlength="10" groupid="SalesCarsForm" argumentid="CarNumber" />
                        <nobr class="ftitle">Registration Date:</nobr>
                        <input type="text" class="text date" style="width: 75px;" groupid="SalesCarsForm" argumentid="RegistrationDate" />
                    </td>
                </tr>
                <!-- Brand -->
                <tr>
                    <td class="ftitle"><nobr>Brand*:</nobr></td>
                    <td>
        <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                groupid="SalesCarsForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>
                    </td>
                </tr>
                <!-- Model -->
                <tr>
                    <td class="ftitle"><nobr>Model*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </td>
                </tr>
                <!-- Year -->
                <tr>
                    <td class="ftitle"><nobr>Year*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="YearId"  storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </td>
                </tr>
                <!-- Color -->
                <tr>
                    <td class="ftitle"><nobr>Color*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                            <option value="" selected="selected">Select Color</option>
                        </select>
                    </td>
                </tr>
                <!-- Interior Color -->
                <tr>
                    <td class="ftitle"><nobr>Interior Color:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" groupid="SalesCarsForm" argumentid="InteriorColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'45'}]}">
                            <option value="" selected="selected">Select Interior Color</option>
                        </select>
                    </td>
                </tr>
                <!-- Type -->
                <tr>
                    <td class="ftitle"><nobr>Type*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                            <option value="" selected="selected">Select Type</option>
                        </select>
                    </td>
                </tr>
                <!-- Insurance -->
                <tr>
                    <td class="ftitle"><nobr>Full Insurance:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist" groupid="SalesCarsForm" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                        </select>
                        <input type="text" class="text date" maxlength="10" style="width: 150px;" groupid="SalesCarsForm" argumentid="FullInsuranceExpiry" />
                        <input type="text" class="text" style="text-align: center; font-weight: bold; color: red" maxlength="50" groupid="SalesCarsForm" argumentid="FullInsurancePolicyNo" />
                    </td>
                </tr>
                <!-- Mileage -->
                <tr>
                    <td class="ftitle"><nobr>Current Mileage*:</nobr></td>
                    <td><input type="text" class="text required number" groupid="SalesCarsForm" argumentid="CurrentMileage" style="text-align: center; width: 150px;" maxlength="10" /> <b>KM</b></td>
                </tr>
                <!-- Location -->
                <tr>
                    <td class="ftitle"><nobr>Car Location*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </td>
                </tr>
                <!-- Status -->
                <tr>
                    <td class="ftitle"><nobr>Car Status*:</nobr></td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist required" groupid="SalesCarsForm" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}">
                            <option value="" selected="selected">Select Status</option>
                        </select>
                    </td>
                </tr>
                <!-- Comments -->
                <tr>
                    <td class="ftitle" valign="top" style="width:20%"><nobr>Comments:</nobr></td>
                    <td><textarea class="textarea" rows="6" style="width: 70%; height: 45px; resize: none;" groupid="SalesCarsForm" argumentid="CurrentCondition"></textarea></td>
                </tr>
                <!-- Save and Cancel buttons -->
                <tr>
                    <td colspan="4">
                        <input type="button" value="Save" class="DataAction ButtonStyle" />
                        <input type="button" value="Cancel" class="CloseForm ButtonStyle" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>--%>
