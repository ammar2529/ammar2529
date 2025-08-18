<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Invoice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Invoice_ShUc" %>

<div class=" text-center">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="InvRecCode" argumentid="InvRecCode" groupid="schInvoice" placeholder="Enter Invoice Rec Code">
                        <label for="InvRecCode">Invoice Rec Code</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="InvCarNumber" argumentid="CarNumber" groupid="schInvoice" placeholder="Enter Car Number">
                        <label for="InvCarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schInvoice" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="BrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schInvoice" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="StateId" groupid="schInvoice" argumentid="StateId" name="D4">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="OpenState">Open</option>
                            <option value="">-----------------------------</option>
                            <option value="ClosedState">Closed</option>
                            <option value="">-----------------------------</option>
                            <option value="CanceledState">Canceled</option>
                            <option value="">-----------------------------</option>
                        </select>
                        <label for="StateId">Status</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ServiceNo" argumentid="ServiceNo" groupid="schInvoice" placeholder="Enter Service No">
                        <label for="ServiceNo">Service No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schInvoice" placeholder="Enter Customer Name">
                        <label for="CustomerName">Customer Name</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schInvoice" placeholder="Enter National ID">
                        <label for="NationalIDNo">National ID No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schInvoice" placeholder="Enter Mobile">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
