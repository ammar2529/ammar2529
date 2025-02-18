<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_ShUc" %>

<div class="container ">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerTen" data-bs-toggle="collapse" data-bs-target="#cardContentTen" aria-expanded="true" aria-controls="cardContentTen" style="cursor: pointer;">
            Car for Sale Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentTen" class="collapse show" aria-labelledby="headerTen">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarForSalesDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ChassisNo">Chassis No.</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarForSalesDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D2" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3" >
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarYear">Year</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarForSalesDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" name="D5" >
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="TypeId">Type</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" name="D6" >
                            <option value="" selected="selected">Select Type</option>
                        </select>
                    </div>
                </div>

                  <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <input type="hidden" value="SearchChassisNo" groupid="schCarForSalesDetails" argumentid="SearchChassisN" />
                        <label for="CarLocationId">Location</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarLocationId" groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" >
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarStatusId">Status</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarStatusId" groupid="schCarForSalesDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}" name="D4">
                            <option value="" selected="selected">Select Status</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <!-- Empty Cell -->
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <!-- Empty Cell -->
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <!-- Empty Cell -->
                    </div>

                      <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" >
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" >Clear</button>
                    </div>
            </div>
        </div>
    </div>

</div>

