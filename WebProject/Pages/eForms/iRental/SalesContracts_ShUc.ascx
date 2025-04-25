<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_ShUc" %>


<div class="">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class="h4 fw-bold ink-bar">Search</span>
                    </div>
                </div>
            </div>
         
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" aria-label=".form-control-sm example" id="RecCode" argumentid="RecCode" groupid="schSalesContractDetails" placeholder="Enter Rec Code">
                        <label for="RecCode">RecCode</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" aria-label=".form-control-sm example" id="LPONumber" argumentid="LPONumber" groupid="schSalesContractDetails" placeholder="Enter LPO Number">
                        <label for="LPONumber">LPONumber</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">

 
<%--                            <div class="custom-floating">
                                <select class="form-select" id="customSelect" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="FinanceCompany" 
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" name="D5">
                                    <option value="" selected class="x"></option>

                                </select>
                                <label for="customSelect">FinanceCompany</label>
                            </div>--%>
                    <div class="custom-floating">
                        <select class="form-select" id="customSelectTest" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="FinanceCompany" 
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" name="D5">
                            <option value="" selected></option>

                        </select>
                        <label for="customSelectTest">FinanceCompany</label>
                    </div>

                    <%--                    <div class="custom-floating">
                        <div class="custom-dropdown" id="customDropdown" aria-label="Custom dropdown with floating label">
                            <div class="selected">Select an option</div>
                            <ul class="dropdown-list">
                                <li data-value="">Select an option</li>
                                <li data-value="1">Option 1</li>
                                <li data-value="2">Option 2</li>
                                <li data-value="3">Option 3</li>
                            </ul>
                        </div>
                        <label for="customDropdown">Select an option</label>
                    </div>--%>
                      
                 
<%--                    <div class="select-wrapper mb-3">
                        <div class="form-outline">
                            <input class="form-control select-input" type="text" role="combobox" aria-disabled="false" aria-haspopup="listbox" aria-expanded="false" id="FinanceCompany-input" readonly placeholder=" ">
                            <label class="form-label select-label" for="FinanceCompany-input">Finance Company</label>
                            <span class="select-arrow"></span>
                        </div>
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="FinanceCompany" name="D5" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}">
                            <option value="" selected="selected"></option>

                        </select>
                    </div>--%>
                    <%--                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="FinanceCompany" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" name="D5">
                            <option value="" selected="selected"></option>
                        </select>
                        <label for="FinanceCompany">FinanceCompany</label>
                    </div>--%>
                </div>
                <div class="col-sm-6 col-lg-2">
<%--                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="Salesman" loadon="FirstVisible" 
                            groupid="schSalesContractDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}" name="D6">
                            <option value="" selected="selected">Salesman</option>
                        </select>
                        <label for="Salesman">Salesman</label>
                    </div>--%>


                    <div class="custom-floating">
                        <select class="form-select" id="customSelectSalesman" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="Salesman" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}" name="D6">
                            <option value="" selected></option>

                        </select>
                        <label for="customSelectSalesman">Salesman</label>
                    </div>

                </div>
                <div class="col-sm-6 col-lg-2">
<%--                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="StateId" groupid="schSalesContractDetails" argumentid="StateId" name="D4">
                            <option value="" selected hidden>Status</option>
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
                        <label for="StateId">State</label>
                    </div>--%>

                    <div class="custom-floating">
                        <select class="form-select" id="customSelectStateId" aria-label="Custom floating label select" groupid="schSalesContractDetails" argumentid="StateId" name="D4">
                            <option value="" selected ></option>
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
                        <label for="customSelectStateId">State</label>
                    </div>

                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schSalesContractDetails" placeholder="Enter Car Number">
                        <label for="CarNumber">CarNumber</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schSalesContractDetails" placeholder="Enter Chassis No">
                        <label for="ChassisNo">ChassisNo</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
<%--                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="BrandId" groupid="schSalesContractDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D12">
                            <option value="" selected="selected">Brand</option>
                        </select>
                        <label for="BrandId">Brand</label>
                    </div>--%>

                    <div class="custom-floating">
                        <select class="form-select" id="customSelectBrand" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="BrandId" childcombo="ModelId" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D12">
                            <option value="" selected ></option>

                        </select>
                        <label for="customSelectBrand">Brand</label>
                    </div>
                </div>
                
                <div class="col-sm-6 col-lg-2">
<%--                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="ModelId" groupid="schSalesContractDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D10">
                            <option value="" selected="selected">Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>--%>

                    <div class="custom-floating">
                        <select class="form-select" id="customSelectModel" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="ModelId"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D10">
                            <option value="" selected ></option>

                        </select>
                        <label for="customSelectModel">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
<%--                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" aria-label="Small select example" id="ColorId"
                                groupid="schSalesContractDetails" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}" name="D8">
                            <option value="" selected="selected">Color</option>
                        </select>
                        <label for="ColorId">Color</label>
                    </div>--%>
                    <div class="custom-floating">
                        <select class="form-select" id="customSelectColor" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schSalesContractDetails" argumentid="ColorId"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}" name="D8">
                            <option value="" selected></option>

                        </select>
                        <label for="customSelectColor">Color</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schSalesContractDetails" placeholder="Enter Customer Name">
                        <label for="CustomerName">CustomerName</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schSalesContractDetails" placeholder="Enter National ID">
                        <label for="NationalIDNo">NationalIDNo</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schSalesContractDetails" placeholder="Enter Mobile">
                        <label for="MobileTelephone1">MobileTelephone1</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarOwnerNationalIdNumber" argumentid="CarOwnerNationalIdNumber" groupid="schSalesContractDetails" maxlength="12" placeholder="Enter Owner National ID">
                        <label for="CarOwnerNationalIdNumber">CarOwnerIdNumber</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ReceiptId" argumentid="ReceiptId" groupid="schSalesContractDetails" maxlength="12" placeholder="Enter Receipt ID">
                        <label for="ReceiptId">ReceiptId</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2 text-center mt-3" style="padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton" resetonpopupshow="resetonpopupshow">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>