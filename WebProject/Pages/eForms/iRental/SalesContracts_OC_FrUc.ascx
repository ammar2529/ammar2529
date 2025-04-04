<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_OC_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_OC_FrUc" %>


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12 p-4 bg-light shadow rounded">
            <div class="alert alert-info text-center">
                Use the form below to update the details. Fields marked with an asterisk (*) are mandatory.
            </div>

            <!-- Description Field -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="description" class="fw-bold">Description*:</label>
                </div>
                <div class="col-md-9">
                    <textarea id="description" class="form-control" rows="6" groupid="Sales_OtherCharges" argumentid="Description"></textarea>
                    <div style="display:none">
                        <span groupid="Sales_OtherCharges" argumentid="RecId"></span>
                    </div>
                    <div style="display:none">
                        <span groupid="Sales_OtherCharges" argumentid="ParentRecId"></span>
                    </div>
                </div>
            </div>

            <!-- Amount Field -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="charges" class="fw-bold">Amount*:</label>
                </div>
                <div class="col-md-9">
                    <input id="charges" type="text" class="form-control text-center number" maxlength="10"
                        groupid="Sales_OtherCharges" alphconf="{allow:'.'}" argumentid="AdditionalAmount" />
                </div>
            </div>

            <!-- Spacer (Optional) -->
            <div class="row mb-3">
                <div class="col-md-12 text-center">
                    <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                </div>
            </div>

            <!-- Action Buttons -->
          <div class="row justify-content-center">
    <!-- Save Button -->
    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 mb-2">
        <button type="button" class="btn btn-primary SaveBtn DataAction w-100"
            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_OtherCharges',HideOnSuccess:true}">
            Save
        </button>
    </div>

    <!-- Cancel Button -->
    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 mb-2">
        <button type="button" class="btn btn-secondary CloseForm w-100">
            Cancel
        </button>
    </div>
</div>

        </div>
    </div>
</div>



<%--<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                        <tr>
                              <td width="20%" class="ftitle" valign="top">
                              <nobr>Description*:</nobr>
                            </td>
                            <td width="80%">
                             <div style="display:none"><span groupid="Sales_OtherCharges" argumentid="RecId"></span></div>
                                    <div style="display:none"><span groupid="Sales_OtherCharges" argumentid="ParentRecId"></span></div>
                              <textarea class="textarea" rows="6" wrap="1" cols="60" argumentid="Description" groupid="Sales_OtherCharges" ></textarea></td>
                        </tr>

                       <tr>
                              <td class="ftitle" >
                              <nobr>Amount*:</nobr>
                            </td>
                            <td>
                            <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text number"
                                    groupid="Sales_OtherCharges" alphconf="{allow:'.'}"  argumentid="Charges" />
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
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_OtherCharges',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>
                    </table>--%>