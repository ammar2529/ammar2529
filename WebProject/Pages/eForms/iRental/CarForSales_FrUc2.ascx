<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_FrUc2" %>

<div class="container">
    <div class="row mt-5 justify-content-start">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <span class="input-group-text me-2 rounded" id="inputGroup-sizing-md">Car Type*</span>
                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check CommonDisable" id="btnradio1" autocomplete="off" value="N" checked="checked" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required">
                    <label class="btn btn-outline-primary btn-sm" for="btnradio1">New Car</label>

                    <input type="radio" class="btn-check CommonDisable" id="btnradio2" autocomplete="off" value="U" name="CarType" groupid="SalesCarsForm" argumentid="CarType" required="required">
                    <label class="btn btn-outline-primary btn-sm" for="btnradio2">Used Car</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm validateunique" id="floatingInput2" placeholder="Chassis No." groupid="SalesCarsForm" argumentid="ChassisNo">
                <label for="floatingInput2">Chassis No.*</label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm" id="floatingCarNumber" placeholder="Car No." style="text-align: center; font-weight: bold; color: red;" maxlength="10" groupid="SalesCarsForm" argumentid="CarNumber">
                <label for="floatingCarNumber">Car No.</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm datepicker" id="floatingRegistrationDate" placeholder="Registration Date" groupid="SalesCarsForm" argumentid="RegistrationDate">
                <label for="floatingRegistrationDate">Registration Date</label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                         <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D2" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                <label for="floatingBrand">Brand*</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3" >
                            <option value="" selected="selected">Select Model</option>
                        </select>
                <label for="floatingModel">Model*</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">

                <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist required" 
                    groupid="SalesCarsForm" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                    <option value="" selected="selected">Select Year</option>
                </select>
                <label for="floatingYear">Year*</label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
  
                <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist required" 
                    groupid="SalesCarsForm" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                    <option value="" selected="selected">Select Color</option>
                </select>
                <label for="floatingColor">Color*</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">

                <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist "
                    groupid="SalesCarsForm" argumentid="InteriorColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'45'}]}">
                    <option value="" selected="selected">Select Interior Color</option>
                </select>
                <label for="floatingInteriorColor">Interior Color</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">

                <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist required" 
                    groupid="SalesCarsForm" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                    <option value="" selected="selected">Select Type</option>
                </select>
                <label for="floatingType">Type*</label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <select class="form-select form-select-sm dropdownlist" groupid="SalesCarsForm" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                    <option value="" selected="selected">Select Insurance</option>
                </select>
                <select loadon="FirstVisible" class="form-select form-select-sm  dropdownlist" requirederr="&amp;nbsp;*" 
                    groupid="SalesCarsForm" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                    <option value="" selected="selected">Select Insurance</option>
                </select>
                <label for="floatingInsurance">Full Insurance</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm datepicker" id="floatingInsuranceExpiry" placeholder="Insurance Expiry"  groupid="SalesCarsForm" argumentid="FullInsuranceExpiry">
                <label for="floatingInsuranceExpiry">Insurance Expiry</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm" id="floatingPolicyNo" placeholder="Policy No." style="text-align: center; font-weight: bold; color: red;" maxlength="50" groupid="SalesCarsForm" argumentid="FullInsurancePolicyNo">
                <label for="floatingPolicyNo">Policy No.</label>
            </div>
        </div>
    </div>

    <div class="row mt-2">
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="form-floating">
            <input type="text" class="form-control form-control-sm required number" id="floatingCurrentMileage" placeholder="Current Mileage" style="text-align: center; " maxlength="10" groupid="SalesCarsForm" argumentid="CurrentMileage">
            <label for="floatingCurrentMileage">Current Mileage*</label>
            <small><b>KM</b></small>
        </div>
    </div>
</div>

    <div class="row mt-2">
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="form-floating">

            <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist required" 
                groupid="SalesCarsForm" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                <option value="" selected="selected">Select Location</option>
            </select>
            <label for="floatingCarLocation">Car Location*</label>
        </div>
    </div>
</div>

    <div class="row mt-2">
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="form-floating">

            <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist required" 
                groupid="SalesCarsForm" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}">
                <option value="" selected="selected">Select Status</option>
            </select>
            <label for="floatingCarStatus">Car Status*</label>
        </div>
    </div>
</div>

    <div class="row mt-2">
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="form-floating">
            <textarea class="form-control form-control-sm" id="floatingComments" placeholder="Comments" rows="6" style="height: 45px; resize: none;" groupid="SalesCarsForm" argumentid="CurrentCondition"></textarea>
            <label for="floatingComments">Comments</label>
        </div>
    </div>
</div>

    <div class="row mt-2">
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="d-flex justify-content-start">
            <input type="text" style="display: none" groupid="SalesCarsForm" argumentid="action" value="new" class="noautoreset" />
            <button type="button" id="onUpdate" class="btn btn-primary me-2" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true}">Save</button>
            <button type="button" class="btn btn-secondary CloseForm">Cancel</button>
        </div>
    </div>
</div>


</div>


