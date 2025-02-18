<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarDetails_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerFive" data-bs-toggle="collapse" data-bs-target="#cardContentFive" aria-expanded="true" aria-controls="cardContentFive" style="cursor: pointer;">
            Car Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentFive" class="collapse show" aria-labelledby="headerFive">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarFor">Car For</label>
                        <select class="form-select form-select-sm dropdownlist" id="CarFor" argumentid="CarFor" groupid="schCarDetails" name="D1" ">
                            <option value="">Select Car For</option>
                            <option value="Rental">Rental</option>
                            <option value="Lease">Lease</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" ">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" ">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarYear">Year</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" ">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="TypeId">Type</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" ">
                            <option value="" selected="selected">Select Type</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarLocationId">Location</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarLocationId" groupid="schCarDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" ">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </div>

                </div>

                                <div class="row mt-2">
     <div class="col-sm-6 col-lg-2">
                        <label for="CarStatusId">Status</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarStatusId" groupid="schCarDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'9'}]}" ">
                            <option value="" selected="selected">Select Status</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarDetails"  style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ChassisNo">Chassis No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarDetails"  style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="InsuranceCompanyId">Insurance Company</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="InsuranceCompanyId" groupid="schCarDetails" argumentid="InsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'8'}]}"  width: 120px;">
                            <option value="" selected="selected">Select Insurance</option>
                        </select>
                    </div>

                                        <div class="col-sm-6 col-lg-2">
        <label for="NormalInsuranceExpiryDays">Expiry (Days)</label>
        <input type="text" class="form-control form-control-sm CommonEmpty" id="NormalInsuranceExpiryDays" argumentid="NormalInsuranceExpiryDays" groupid="schCarDetails" style="height: 2px;">
    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="FullInsuranceCompanyId">Full Insurance</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="FullInsuranceCompanyId" groupid="schCarDetails" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}"  width: 120px;">
                            <option value="" selected="selected">Select Insurance</option>
                        </select>
                    </div>

                </div>
                <div class="row mt-2">

                    <div class="col-sm-6 col-lg-2">
                        <label for="FullInsuranceExpiryDays">Expiry (Days)</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="FullInsuranceExpiryDays" argumentid="FullInsuranceExpiryDays" groupid="schCarDetails" style="height: 2px;">
                    </div>

        <div class="col-sm-6 col-lg-2">

        </div>
                    
        <div class="col-sm-6 col-lg-2">

        </div>
                    
        <div class="col-sm-6 col-lg-2">

        </div>
                    
        <div class="col-sm-6 col-lg-2">

        </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center"  padding-bottom: 0px;">
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" ">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" ">Clear</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

