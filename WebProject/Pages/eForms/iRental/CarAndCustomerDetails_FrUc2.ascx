<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarAndCustomerDetails_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarAndCustomerDetails_FrUc2" %>
<script src="../../../Scripts/eForms/iRental/frmCarAndServiceDetails.js"></script>
<div class="">

    <div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">

                    <span class="  ink-bar">Car And Customer Details</span>
                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                        onmouseover="this.style.color='red';"
                        onmouseout="this.style.color='black';"></i>
                </div>
            </div>

                <!-- Contract No. and Status -->
    <div class="row mt-2  StatusTR">
        <div class="col-12 col-sm-6 col-lg-2">
            <label for="floatingKM">
                <small><b>Contract No.</b></small>
            </label>
        </div>
        <div class="col-12 col-sm-6 col-lg-1">
            <div class="form-floating">
                <span class="ftitle" style="color: red;" groupid="CarAndCustomersDetails" argumentid="RecCode">New contract no. will be generated on saving</span>

            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-6 ">
        </div>

    </div>

     <div class="row mt-2 ">
         <div class="col-12 col-sm-6 col-lg-1 ">
             <label for="floatingKM">
                 <small><b>Car For*</b></small>
             </label>
         </div>
            <div class="col-12 col-sm-6 col-lg-5">
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input CommonDisableClass ElemDisabled RadioButtons Sales" id="Sales"default="default" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor">
                    <label class="form-check-label" for="Sales">Sales</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-inpu CommonDisableClass ElemDisabled RadioButtons Sales Rental" id="Rental"  value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor">
                    <label class="form-check-label" for="Rental">Rental</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input CommonDisableClass ElemDisabled RadioButtons Lease" id="Lease"  value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" >
                    <label class="form-check-label" for="Lease">Lease</label>
                </div>
            </div>
        </div>

    
 <!-- Car No. and Customer Code -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" maxlength="10" class="form-control form-control-sm text LOVPopup required CommonDisableCarNumber" id="CarNumberSales" placeholder="Car No." groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForSales" argumentid="CarNumber" />
                    <label for="CarNumberSales">Car No.</label>
                </div>
                <div class="form-floating ">
                    <input type="text" maxlength="10" class="form-control form-control-sm text LOVPopup required CommonDisableCarNumber" id="CarNumberRental" placeholder="Car No." groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForRental" argumentid="CarNumber" style="display: none;" />
                </div>
                <div class="form-floating ">
                    <input type="text" maxlength="10" class="form-control form-control-sm text LOVPopup required CommonDisableCarNumber" id="CarNumberLease" placeholder="Car No." groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForLease" argumentid="CarNumber" style="display: none;"/>
                </div>
                <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="RecId" />
                <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="CsRecId" />
                <input type="hidden" name="CarAndCustomersDetailsRecId" groupid="CarAndCustomersDetails" argumentid="CarAndCustomersDetailsRecId" />
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" maxlength="10" class="form-control form-control-sm LOVPopup required text CommonDisableCarNumber" id="CustomerRecCode" placeholder="Customer Code" groupid="CarAndCustomersDetails" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr='*Required'>
                    <label for="CustomerRecCode">Customer Code*</label>
                </div>
            </div>
        </div>

   <!-- Chassis No. and Name -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable ChassisNo" groupid="CarAndCustomersDetails" argumentid="ChassisNo" disabled readonly>
                    <label for="ChassisNo">Chassis No.</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" style="font-size: 16px;" groupid="CarAndCustomersDetails" argumentid="CustomerName" disabled readonly>
                    <label for="CustomerName">Name</label>
                </div>
            </div>
        </div>

        <!-- Brand and Nationality -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Brand" disabled readonly>
                    <label for="Brand">Brand</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="Nationality" disabled readonly>
                    <label for="Nationality">Nationality</label>
                    <input type="hidden" groupid="CarAndCustomersDetails" argumentid="NationalityID" />
                </div>
            </div>
        </div>


  
        <!-- Model and National ID No. -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Model" disabled readonly>
                    <label for="Model">Model</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable NationalIDNo"  groupid="CarAndCustomersDetails" argumentid="NationalIDNo" disabled readonly>
                    <label for="NationalIDNo">National ID No.</label>
                    <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="NationalIDExpiryDate"></span>
                </div>
            </div>
        </div>

     <!-- Year and Gender -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="CarYear" disabled readonly>
                    <label for="CarYear">Year</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="Gender" disabled readonly>
                    <label for="Gender">Gender</label>
                </div>
            </div>
        </div>

     <!-- Color and Mobile Telephone -->
        <div class="row mt-2 ">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Color" disabled readonly>
                    <label for="Color">Color</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="MobileTelephone1" disabled readonly>
                    <label for="MobileTelephone1">Mobile Telephone</label>
                </div>
            </div>
        </div>

    <!-- Type -->
    <div class="row mt-2 ">
        <div class="col-12 col-sm-6 col-lg-6">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Type" disabled readonly>
                <label for="Type">Type</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-6">
        </div>
    </div>

     <!-- Full Insurance Details -->
    <div class="row mt-2  hideTr">
        <div class="col-12 col-sm-6 col-lg-6">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsuranceCompanyId" disabled readonly>
                <label for="FullInsuranceCompanyId">Full Insurance</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-6">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsurancePolicyNo" disabled readonly>
                <label for="FullInsurancePolicyNo">Policy No.</label>
            </div>
        </div>

    </div>



    <!-- Expiry Date -->
    <div class="row mt-2  hideTr">
        <div class="col-12 col-sm-6 col-lg-6">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsuranceExpiry" disabled readonly>
                <label for="FullInsuranceExpiry">Expiry Date (dd/mm/yyyy)</label>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-6">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="ContractDate" disabled readonly>
                <label for="ContractDate">Contract Date</label>
            </div>
        </div>
    </div>



        <!-- Engine Warranty - KM and Years -->
        <div class="row mt-2  hideOnSales">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="EngineWarranty" disabled readonly>
                    <label for="EngineWarranty">Engine Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="EnginYearsWarranty" disabled readonly>
                    <label for="EnginYearsWarranty">Years</label>
                </div>
            </div>
        </div>

        <!-- Gear Warranty - KM and Years -->
        <div class="row mt-2  hideOnSales">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="GearWarranty" disabled readonly>
                    <label for="GearWarranty">Gear Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="GearYearsWarranty" disabled readonly>
                    <label for="GearYearsWarranty">Years</label>
                </div>
            </div>
        </div>

        <!-- Car Warranty - KM and Years -->
        <div class="row mt-2  hideOnSales">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="CarWarranty" disabled readonly>
                    <label for="CarWarranty">Car Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm CommonDisable" groupid="CarAndCustomersDetails" argumentid="CarYearsWarranty" disabled readonly>
                    <label for="CarYearsWarranty">Years</label>
                </div>
            </div>
        </div>

     <!-- Table -->
        <div class="row mt-2 ">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered CustomerModifyListt">
                        <thead >
                            <tr>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">Code</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black; width: 30%;">Customer Name</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">Nationality</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">National ID No</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">Mobile</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">Created Date</th>
                                <th class="ColTemplate" style="padding-left: 5px; padding-right: 0px; color: black;">Created By</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="ItemTRR">
                                <!-- Table rows go here -->
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr class="NoRecordsTR">
                                <td class="NoRecords text-center" colspan="7">
                                    <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

      <!-- Action Buttons -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 text-center">
                <div class="py-3">
                    <!-- Save Button 1 -->
                    <button type="button" class="btn btn-primary DataAction btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:true, Requery:true,GroupId:'CarAndCustomersDetails'}">Save</button>
                    <!-- Save Button 2 -->
                    <button type="button" class="btn btn-primary DataAction btnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:false, Requery:false,GroupId:'CarAndCustomersDetails'}">Save</button>
                    <!-- Close Button -->
                    <button type="button" class="btn btn-secondary CloseForm btnCancel common-button">Close</button>
                </div>
            </div>
        </div>

        </div>
        </div>
        </div>
    



</div>

