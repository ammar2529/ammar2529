<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarRateDetails_ShUc" %>

<div class="text-center">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="RateTypeId" groupid="schCarRateDetails" argumentid="RateTypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'26'}]}">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select>
                        <label for="RateTypeId">RateType</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarRateDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="BrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarRateDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarRateDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                        <label for="CarYear">CarYear</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="IsDisable" groupid="schCarRateDetails" argumentid="IsDisable">
                            <option value="">Select Is Disable</option>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                        <label for="IsDisable">IsDisable</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
