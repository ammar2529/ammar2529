<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GRG_CarAndCustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GRG_CarAndCustomerDetails_ShUc" %>

<div class="text-center">
    <div class="card">
        <div class="card-body">
                                    <div class="row mb-2">
                            <div class="col-sm-12 ">
                                <div class="form-header">

                                    <span class=" h5 fw-bold ink-bar">Search</span>
                                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                                        tabid="CloseBtn" title="Close Form"
                                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                                        onmouseover="this.style.color='red';"
                                        onmouseout="this.style.color='black';"></i>
                                </div>
                            </div>
                        </div>
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarAndCustomerDetails" placeholder="Enter Car Number">
                        <label for="CarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarAndCustomerDetails" placeholder="Enter Chassis No">
                        <label for="ChassisNo">Chassis No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="GCBrandId" groupid="schCarAndCustomerDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="GCBrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schCarAndCustomerDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYear" groupid="schCarAndCustomerDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                        <label for="CarYear">Year</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="CarFor" argumentid="CarFor" groupid="schCarAndCustomerDetails" name="D7">
                            <option value="" selected="selected">Select CarFor</option>
                            <option value="Sales">Sales</option>
                            <option value="Rental">Rental</option>
                            <option value="Lease">Lease</option>
                        </select>
                        <label for="CarFor">Car For</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schCarAndCustomerDetails" placeholder="Enter Customer Name">
                        <label for="CustomerName">Customer Name</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schCarAndCustomerDetails" placeholder="Enter National ID">
                        <label for="NationalIDNo">National ID No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schCarAndCustomerDetails" placeholder="Enter Mobile">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" style="white-space: nowrap; padding-top: 6px;">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
