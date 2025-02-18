<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaseContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.LeaseContracts_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerNine" data-bs-toggle="collapse" data-bs-target="#cardContentNine" aria-expanded="true" aria-controls="cardContentNine" style="cursor: pointer;">
            Contract Details
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentNine" class="collapse show" aria-labelledby="headerNine">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="RecCode">Rec Code</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="RecCode" argumentid="RecCode" groupid="schContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">Brand</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schContractDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D3" >
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">Model</label>
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schContractDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D2" >
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarYearId">Year</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="CarYearId" groupid="schContractDetails" argumentid="CarYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" >
                            <option value="" selected="selected">Select Year</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2" style="height: 2px;">
                        <!-- This part remains commented as per the original code -->
                    </div>
                </div>

                                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="OutLocationId">Out Location</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="OutLocationId" groupid="schContractDetails" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" >
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NationalIDNo">National ID No</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerName">Customer Name</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="StateId">Status</label>
                        <select class="form-select form-select-sm dropdownlist" id="StateId" argumentid="StateId" groupid="schContractDetails" name="D4" ">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCCreatedState">Created - Reservation</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractOpen">Contract Open - Car Out</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractOpenCarIn" style="color:red">Contract Open - Car In</option>
                            <option value="RRCWithLegalContractOpenCarOut" style="color:red">With Legal - Contract Open - Car Out</option>
                            <option value="RRCWithLegalContractOpenCarIn" style="color:red">With Legal - Contract Open - Car In</option>
                            <option value="RRCWithLegalContractClosedPendingPayment" style="color:red">With Legal - Contract Closed - Pending Payment</option>
                            <option value="RRCContractClosedPendingPayment" style="color:red">Contract Closed - Pending Payment</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractClosed" style="color:Green">Contract Closed - Payment Cleared</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractCancelled">Contract Cancelled</option>
                            <option value="">-----------------------------</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3"  padding-bottom: 0px; white-space:nowrap;">
                        <button  href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" >Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" >Clear</button>
                    </div>

            </div>
        </div>
    </div>
    </div>

 