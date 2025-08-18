<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_ShUc" %>


<div class="">
    <div class="card">
        <div class="card-body">

            <div class="row">
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
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="RecCode" argumentid="RecCode" groupid="schContractDetails" placeholder="Enter Rec Code">
                        <label for="RecCode">Rec Code</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="Rental_ShUcCarNumber" argumentid="CarNumber" groupid="schContractDetails" placeholder="Enter Car Number">
                        <label for="Rental_ShUcCarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schContractDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="BrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schContractDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYearId" groupid="schContractDetails" argumentid="CarYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                        </select>
                        <label for="CarYearId">Car Year</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="OutLocationId" groupid="schContractDetails" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="OutLocationId">Out Location</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schContractDetails" placeholder="Enter National ID">
                        <label for="NationalIDNo">National ID No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schContractDetails" placeholder="Enter Customer Name">
                        <label for="CustomerName">Customer Name</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="StateId" argumentid="StateId" groupid="schContractDetails" name="D4">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCCreatedState">Created - Reservation</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractOpen">Contract Open - Car Out</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractOpenCarIn" style="color: red">Contract Open - Car In</option>
                            <option value="RRCWithLegalContractOpenCarOut" style="color: red">With Legal - Contract Open - Car Out</option>
                            <option value="RRCWithLegalContractOpenCarIn" style="color: red">With Legal - Contract Open - Car In</option>
                            <option value="RRCWithLegalContractClosedPendingPayment" style="color: red">With Legal - Contract Closed - Pending Payment</option>
                            <option value="RRCContractClosedPendingPayment" style="color: red">Contract Closed - Pending Payment</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractClosed" style="color: Green">Contract Closed - Payment Cleared</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractCancelled">Contract Cancelled</option>
                            <option value="">-----------------------------</option>
                        </select>
                        <label for="StateId">Status</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" style="white-space: nowrap;">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" groupid="schContractDetails">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" groupid="schContractDetails">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
