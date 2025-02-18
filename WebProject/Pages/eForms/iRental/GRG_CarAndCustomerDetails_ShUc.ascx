<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GRG_CarAndCustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GRG_CarAndCustomerDetails_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerThirteen" data-bs-toggle="collapse" data-bs-target="#cardContentThirteen" aria-expanded="true" aria-controls="cardContentThirteen" style="cursor: pointer;">
            Car and Customer Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentThirteen" class="collapse show" aria-labelledby="headerThirteen">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarAndCustomerDetails" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ChassisNo">Chassis No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarAndCustomerDetails" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarAndCustomerDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarAndCustomerDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarYear">Year</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarAndCustomerDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" >
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                </div>

                 <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarFor">Car For</label>
                        <select class="form-select form-select-sm dropdownlist" id="CarFor" argumentid="CarFor" groupid="schCarAndCustomerDetails" name="D7" >
                            <option value="" selected="selected">Select CarFor</option>
                            <option value="Sales">Sales</option>
                            <option value="Rental">Rental</option>
                            <option value="Lease">Lease</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerName">Customer Name</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schCarAndCustomerDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NationalIDNo">National ID No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schCarAndCustomerDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schCarAndCustomerDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center" style="height: 2px; padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton" >Clear</button>
                    </div>
            </div>
        </div>
    </div>
    </div>
