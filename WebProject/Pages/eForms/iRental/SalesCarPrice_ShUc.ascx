<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesCarPrice_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerTwelve" data-bs-toggle="collapse" data-bs-target="#cardContentTwelve" aria-expanded="true" aria-controls="cardContentTwelve" style="cursor: pointer;">
            Car for Sale Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentTwelve" class="collapse show" aria-labelledby="headerTwelve">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" >
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="YearId">Year</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="YearId" groupid="schCarForSalesDetails" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" >
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="TypeId">Type</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" >
                            <option value="" selected="selected">Select Type</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" >
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 reset clearCheck ClearButton search ViewButton" >Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton" >Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
