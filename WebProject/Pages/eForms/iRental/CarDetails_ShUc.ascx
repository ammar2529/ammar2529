<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarDetails_ShUc" %>

<div class="">
    <div class="card">
        <div class="card-body">

                        <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Car Details</span>
						                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; 
                               transition: color 0.3s ease; position: absolute; 
                               right: 10px;"
                        onmouseover="this.style.color='red';" 
                        onmouseout="this.style.color='black';">
                    </i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="CarFor" argumentid="CarFor" groupid="schCarDetails" name="D1">
                            <option value="">Select Car For</option>
                            <option value="Rental">Rental</option>
                            <option value="Lease">Lease</option>
                        </select>
                        <label for="CarFor">Car For</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CDBrandId" groupid="schCarDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="CDBrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                        <label for="CarYear">Year</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                            <option value="" selected="selected">Select Type</option>
                        </select>
                        <label for="TypeId">Type</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarLocationId" groupid="schCarDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="CarLocationId">Location</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarStatusId" groupid="schCarDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'9'}]}">
                            <option value="" selected="selected">Select Status</option>
                        </select>
                        <label for="CarStatusId">Status</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarDetails" placeholder="Enter Car Number">
                        <label for="CarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarDetails" placeholder="Enter Chassis No">
                        <label for="ChassisNo">Chassis No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="InsuranceCompanyId" groupid="schCarDetails" argumentid="InsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'8'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                        </select>
                        <label for="InsuranceCompanyId">Insurance Company</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NormalInsuranceExpiryDays" argumentid="NormalInsuranceExpiryDays" groupid="schCarDetails" placeholder="Enter Days">
                        <label for="NormalInsuranceExpiryDays">Expiry (Days)</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="FullInsuranceCompanyId" groupid="schCarDetails" argumentid="FullInsuranceCompanyId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                            <option value="" selected="selected">Select Insurance</option>
                        </select>
                        <label for="FullInsuranceCompanyId">Full Insurance</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="FullInsuranceExpiryDays" argumentid="FullInsuranceExpiryDays" groupid="schCarDetails" placeholder="Enter Days">
                        <label for="FullInsuranceExpiryDays">Expiry (Days)</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>