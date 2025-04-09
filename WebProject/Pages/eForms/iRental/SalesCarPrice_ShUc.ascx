<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesCarPrice_ShUc" %>

<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-6 col-lg-2">
                <div class="form-floating">
                    <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                        <option value="" selected="selected">Select Brand</option>
                    </select>
                    <label for="BrandId">Brand</label>
                </div>
            </div>

            <div class="col-sm-6 col-lg-2">
                <div class="form-floating">
                    <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                        <option value="" selected="selected">Select Model</option>
                    </select>
                    <label for="ModelId">Model</label>
                </div>
            </div>

            <div class="col-sm-6 col-lg-2">
                <div class="form-floating">
                    <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="YearId" groupid="schCarForSalesDetails" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                        <option value="" selected="selected">Select Year</option>
                    </select>
                    <label for="YearId">Year</label>
                </div>
            </div>

            <div class="col-sm-6 col-lg-2">
                <div class="form-floating">
                    <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                        <option value="" selected="selected">Select Type</option>
                    </select>
                    <label for="TypeId">Type</label>
                </div>
            </div>

            <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                <button class="btn btn-primary btn-sm me-2   search ViewButton">Search</button>
                <button class="btn btn-secondary btn-sm reset clearCheck ClearButton">Clear</button>
            </div>
        </div>
    </div>
</div>
 
