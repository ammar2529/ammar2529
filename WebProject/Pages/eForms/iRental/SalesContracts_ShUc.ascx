<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_ShUc" %>


<div class="container ">
    <div class="card">
      <%--  <div class="card-header collapsible-header" data-bs-toggle="collapse" data-bs-target="#collapsePanel" aria-expanded="true" aria-controls="collapsePanel">
            <span>Data Grid Example</span>
            <span id="collapse-icon">-</span>
        </div>--%>
        <%--<div id="collapsePanel" class="collapse show">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="RecCode">RecCode</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" aria-label=".form-control-sm example" id="RecCode" argumentid="RecCode" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="LPONumber">LPONumber</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" aria-label=".form-control-sm example" id="LPONumber" argumentid="LPONumber" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="FinanceCompany">FinanceCompany</label>
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="FinanceCompany" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" name="D5">
                            <option value="" selected="selected">Select Finance Company</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="Salesman">Salesman</label>
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="Salesman" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}" name="D6">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="StateId">StateId</label>
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="StateId" groupid="schSalesContractDetails" argumentid="StateId" name="D4">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCCreatedState">Created - Reservation</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractClosed" style="color: Green">Contract Closed - Payment Cleared</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractCancelled">Contract Cancelled</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCPendingPaymentCarOut">Pending Payment - Car Out</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCPendingPaymentCarIn">Pending Payment - Car In</option>
                            <option value="">-----------------------------</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">CarNumber</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-sm-6 col-lg-2">
                        <label for="ChassisNo">ChassisNo</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="BrandId">BrandId</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="BrandId" groupid="schSalesContractDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D12">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ModelId">ModelId</label>
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="ModelId" groupid="schSalesContractDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D10">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ColorId">ColorId</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="ColorId" groupid="schSalesContractDetails" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}" name="D8">
                            <option value="" selected="selected">Select Color</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerName">CustomerName</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NationalIDNo">NationalIDNo</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-sm-6 col-lg-2">
                        <label for="MobileTelephone1">MobileTelephone1</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schSalesContractDetails" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarOwnerNationalIdNumber">CarOwnerNationalIdNumber</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarOwnerNationalIdNumber" argumentid="CarOwnerNationalIdNumber" groupid="schSalesContractDetails" maxlength="12" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="ReceiptId">ReceiptId</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ReceiptId" argumentid="ReceiptId" groupid="schSalesContractDetails" maxlength="12" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2"></div>
                    <div class="col-sm-6 col-lg-2"></div>
                    <div class="col-sm-6 col-lg-2 text-center mt-3" style="padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
                        <button href="javascript:void(0);" class="btn btn-primary search ViewButton">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary reset clearCheck ClearButton" resetonpopupshow="resetonpopupshow">Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--</div>--%>




