<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Invoice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Invoice_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerSeventeen" data-bs-toggle="collapse" data-bs-target="#cardContentSeventeen" aria-expanded="true" aria-controls="cardContentSeventeen" style="cursor: pointer;">
            Invoice Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentSeventeen" class="collapse show" aria-labelledby="headerSeventeen">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="InvRecCode">Invoice Rec Code</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="InvRecCode" argumentid="InvRecCode" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schInvoice" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schInvoice" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6" >
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="StateId">Status</label>
                        <select class="form-select form-select-sm dropdownlist" id="StateId" groupid="schInvoice" argumentid="StateId" name="D4" >
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="OpenState">Open</option>
                            <option value="">-----------------------------</option>
                            <option value="ClosedState">Closed</option>
                            <option value="">-----------------------------</option>
                            <option value="CanceledState">Canceled</option>
                            <option value="">-----------------------------</option>
                        </select>
                    </div>
                </div>

                 <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="ServiceNo">Service No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ServiceNo" argumentid="ServiceNo" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerName">Customer Name</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NationalIDNo">National ID No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schInvoice" style="height: 2px; ">
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" >
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" >Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton" >Clear</button>
                    </div>
            </div>
        </div>
    </div>
</div>

