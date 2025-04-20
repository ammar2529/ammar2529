<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_ShUc" %>

<%--<p class="d-inline-flex gap-1">
      <a class="btn btn-primary collapsed" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Search
      </a>
     
    </p>--%>
<%--    <div class="collapse" id="collapseExample" style="">
          <div class="card-header">
    Featured
  </div>
      <div class="card card-body">
    <div >
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
</div>      </div>
    </div>--%>


<div class="">
    <div class="card">


        <div class="card-body">
            <div class="col-sm-12 ">
                <div class="form-header">

                    <span class=" h5 fw-bold ink-bar">Search</span>

                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarForSalesDetails" placeholder="Enter Car Number">
                        <label for="CarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarForSalesDetails" placeholder="Enter Chassis No">
                        <label for="ChassisNo">Chassis No.</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CFSBrandId" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D2">
                            <option value="" selected>Select Brand</option>
                        </select>
                        <label for="CFSBrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
                            <option value="" selected>Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarForSalesDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" name="D5">
                            <option value="" selected>Select Year</option>
                        </select>
                        <label for="CarYear">Year</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="TypeId" groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" name="D6">
                            <option value="" selected>Select Type</option>
                        </select>
                        <label for="TypeId">Type</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <input type="hidden" value="SearchChassisNo" groupid="schCarForSalesDetails" argumentid="SearchChassisN">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarLocationId" groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected>Select Location</option>
                        </select>
                        <label for="CarLocationId">Location</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarStatusId" groupid="schCarForSalesDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}" name="D4">
                            <option value="" selected>Select Status</option>
                        </select>
                        <label for="CarStatusId">Status</label>
                    </div>
                </div>
                <!-- Empty cells for spacing -->
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>



