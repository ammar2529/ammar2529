<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarRateDetails_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerFour" data-bs-toggle="collapse" data-bs-target="#cardContentFour" aria-expanded="true" aria-controls="cardContentFour" style="cursor: pointer;">
            Car Rate Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentFour" class="collapse show" aria-labelledby="headerFour">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="RateTypeId">RateTypeId</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="RateTypeId" groupid="schCarRateDetails" argumentid="RateTypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'26'}]}" ">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">BrandId</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarRateDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" ">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">ModelId</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarRateDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" ">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarYear">CarYear</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarRateDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" ">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="IsDisable">IsDisable</label>
                        <select class="form-select form-select-sm dropdownlist" id="IsDisable" groupid="schCarRateDetails" argumentid="IsDisable" ">
                            <option value="">Select Is Disable</option>
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3"  padding-bottom: 0px;">
                        <button href="javascript:void(0);"  class="btn btn-primary btn-sm me-2 search ViewButton" ">Search</button>
                        <button href="javascript:void(0);"  class="btn btn-secondary btn-sm reset ClearButton" ">Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
