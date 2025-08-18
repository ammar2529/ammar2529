<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventoryInvoice_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventoryInvoice_FrUc" %>


<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<script src="../../../Scripts/eForms/iRental/frmInvoicePaymentDetails.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSparePartInventoryInvoice.js"></script>




<div class=" InvoiceDetails">
    <!-- Alert Section -->
    <div class="row my-3 justify-content-md-center">
        <div class="alert alert-info mt-3" role="alert">
            Use the form below to update the invoice details, fields marked with an asterisk (*) are mandatory
        </div>
        <div style="display: none">
            <span groupid="SparePartInventoryInvoice" argumentid="RecId"></span>
            <span groupid="SparePartInventoryInvoice" argumentid="InvoiceRecId"></span>
            <span groupid="SparePartInventoryInvoice" argumentid="StateId"></span>
        </div>
    </div>

    <!-- Invoice No. and Status -->
    <div class="row mb-3 justify-content-center StatusRow">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold text-danger" id="InvRecCode"
                    groupid="SparePartInventoryInvoice" argumentid="InvRecCode" readonly 
                    placeholder="Invoice No." value="New invoice no. will be generated on saving">
                <label for="InvRecCode">Invoice No.</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center" id="StateName"
                    groupid="SparePartInventoryInvoice" argumentid="StateName" readonly 
                    placeholder="Invoice Status">
                <label for="StateName">Invoice Status</label>
            </div>
        </div>
    </div>

    <!-- Invoice For and Date -->
    <div class="row mb-3 justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-group">
<%--                <label><b>Invoice For:</b></label>--%>
                <div class="form-check form-check-inline">
                    <input class="form-check-input ServiceInvoice" type="radio" id="ServiceInvoice" checked="checked" default="default" value="ServiceInvoice"
                        name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails">
                    <label class="form-check-label fw-bold" for="ServiceInvoice">Service Invoice</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input PartsInvoice" type="radio" id="PartsInvoice" value="PartsInvoice"
                        name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails">
                    <label class="form-check-label fw-bold" for="PartsInvoice">Parts Invoice</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input QuotationInvoice" type="radio" id="QuotationInvoice" value="QuotationInvoice"
                        name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails">
                    <label class="form-check-label fw-bold" for="QuotationInvoice">Quotation Invoice</label>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="date" class="form-control text-center DisableOnClose CommonDisableClass CommonDisableClasss" id="InvoiceDate"
                    groupid="SparePartInventoryInvoice" argumentid="InvoiceDate" maxlength="10" placeholder="Invoice Date">
                <label for="InvoiceDate">Invoice Date</label>
            </div>
        </div>
    </div>

    <!-- Invoice Type and Customer/Service Codes -->
    <div class="row mb-3 justify-content-center serv">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-group">
<%--                <label><b>Invoice Type:</b></label>--%>
                <div class="form-check form-check-inline">
                    <input class="form-check-input CashInvoice  InvoiceTypeCommon" type="radio" id="CashInvoice" checked="checked" default="default" value="CashInvoice"
                        name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType">
                    <label class="form-check-label fw-bold" for="CashInvoice">Cash Invoice</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input WarrentyInvoice InvoiceTypeCommon" type="radio" id="WarrantyInvoice" value="WarrantyInvoice"
                        name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType">
                    <label class="form-check-label fw-bold" for="WarrantyInvoice">Warranty Invoice</label>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">

        </div>
    </div>


    <div class="row mb-3 justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control text-center fw-bold text-danger LOVPopup required text  CommonDisableClass CommonDisableClasss"
                    id="CustomerRecCode" groupid="SparePartInventoryInvoice" lovpopupid="customerInvoicePopup" argumentid="CustomerRecCode"
                    maxlength="10" placeholder="Customer Code*" requirederr="*Required">
                <label for="CustomerRecCode" class="cust">Customer Code*</label>

                <input type="text" class="form-control text-center fw-bold text-danger LOVPopup required text  CommonDisableClass CommonDisableClasss"
                    id="ServiceNo" groupid="SparePartInventoryInvoice" lovpopupid="carPopupGarageForInvoice" argumentid="ServiceNo" 
                    maxlength="10" placeholder="Customer Code*" requirederr="*Required">
                <label for="ServiceNo" class="serv">Service No.*</label>

                <input type="text" class="form-control text-center fw-bold text-danger LOVPopup required text  CommonDisableClass CommonDisableClasss"
                    id="CustomerRecCodeQuotation" groupid="SparePartInventoryInvoice" lovpopupid="QuotationInvoicePopup" argumentid="CustomerRecCodeQuotation" 
                    maxlength="10" placeholder="Customer Code*" requirederr="*Required">
                <label for="CustomerRecCodeQuotation" class="custQ">Customer Code*</label>


            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating serv">
                <input type="date" class=" text-center form-control-plaintext " id="ServiceDate"
                    groupid="SparePartInventoryInvoice" argumentid="DateCreated" maxlength="10" placeholder="Invoice Date" disabled>
                <label for="ServiceDate">Service Date</label>
            </div>
        </div>
    </div>

    <!-- Car Info Section -->
    <div class="row mb-3 hideCarandService justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold" id="SpCarNumber"
                    groupid="SparePartInventoryInvoice" argumentid="CarNumber" readonly placeholder="Car No.">
                <label for="SpCarNumber">Car No.</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold" id="CarYear"
                    groupid="SparePartInventoryInvoice" argumentid="CarYear" readonly placeholder="Year">
                <label for="CarYear">Year</label>
            </div>
        </div>
    </div>

    <div class="row mb-3 hideCarandService justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold" id="SpBrand"
                    groupid="SparePartInventoryInvoice" argumentid="Brand" readonly placeholder="Brand">
                <label for="SpBrand">Brand</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold" id="Model"
                    groupid="SparePartInventoryInvoice" argumentid="Model" readonly placeholder="Model">
                <label for="Model">Model</label>
            </div>
        </div>
    </div>

    <!-- Customer Info Section -->
    <div class="row mb-3 hideTrForINVCust justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating hideTrForINVCust">
                <input type="text" class="form-control-plaintext text-center fw-bold CommonSPCust serv" id="SICustomerRecCode"
                    groupid="SparePartInventoryInvoice" argumentid="SICustomerRecCode" readonly placeholder="Customer Code">
                <label for="SICustomerRecCode " class="CommonSPCust serv">Customer Code</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold CommonSPCust" id="NationalIDNo"
                    groupid="SparePartInventoryInvoice" argumentid="NationalIDNo" readonly placeholder="National ID No.">
                <label for="NationalIDNo">National ID No.</label>
            </div>
        </div>
    </div>

    <div class="row mb-3 hideTrForINVCust justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold CommonSPCust" id="CustomerName"
                    groupid="SparePartInventoryInvoice" argumentid="CustomerName" readonly placeholder="Name" style="font-size: 16px;">
                <label for="CustomerName">Name</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center fw-bold CommonSPCust" id="MobileTelephone1"
                    groupid="SparePartInventoryInvoice" argumentid="MobileTelephone1" readonly placeholder="Mobile Telephone">
                <label for="MobileTelephone1">Mobile Telephone</label>
            </div>
        </div>
    </div>
    
    <!-- Additional Details -->
    <div class="row mb-3 justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0 ">
            <div class="form-floating hideCarandService">
                <input type="text" class="form-control-plaintext text-center fw-bold CommonSPINv" id="CurrentServiceKm"
                    groupid="SparePartInventoryInvoice" argumentid="CurrentServiceKm" readonly placeholder="In KM">
                <label for="CurrentServiceKm">In KM</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control text-center common-disable" id="ManualID"
                    groupid="SparePartInventoryInvoice" argumentid="ManualID" maxlength="100" placeholder="Manual ID">
                <label for="ManualID">Manual ID</label>
            </div>
        </div>
    </div>

    <!-- Items Table -->


<div class="container mt-3 HideOnNewForm">
    <table class="table table-striped table-bordered w-form-table HideOnNewForm" id="dynamicRows">
        <thead class="table-dark">
            <tr>
                <th>Item ID</th>
                <th>Item Code</th>
                <th>Description</th>
                <th>Qty AVL</th>
                <th>QTY</th>
                <th>Unit Price</th>
                <th>Total Price</th>
                <th>Actions</th>
            </tr>
        </thead>
    <tbody>
        <tr class="LineOfItemRow HideOnNewForm trNoDynamic">
            <td style="display: none">
                <input type="text" class="form-control ElemDisabled text " groupid="SparePartInventoryInvoice" argumentid="InvRecId" disabled></td>
            <td>
                <input type="text" class="form-control LOVPopup text ItemIdClass  CommonDisableClass  " lovpopupid="ItemCodePopup" groupid="SparePartInventoryInvoice" argumentid="ItemId"></td>
            <td>
                <input type="text" class="form-control text ElemDisabled"  argumentid="SparePartName"  disabled="disabled"></td>

            <td>
                <input type="text" class="form-control ElemDisabled text" groupid="SparePartInventoryInvoice" argumentid="SparePartSerialNo" disabled></td>
            <td>
                <input type="text" class="form-control ElemDisabled number text" groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" disabled></td>
            <td>
                <input type="text" class="form-control number text CommonDisableClass SelectQuantity" groupid="SparePartInventoryInvoice" argumentid="SelectQuantity"></td>
            <td>
                <input type="text" class="form-control ElemDisabled CommonDisableClass text" groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice"></td>
            <td>
                <input type="text" class="form-control ElemDisabled text" groupid="SparePartInventoryInvoice" argumentid="TotalPrice" disabled></td>
            <td>
                <button class="btn btn-primary SaveBtn" type = "button" recid="recId"  SaveButton="SaveButton">Save</button></td>
        </tr>
    </tbody>
    </table>
    </div>



<div class="container mt-3 HideOnNewForm">
    <input type="hidden" groupid="SparePartInventoryInvoice" argumentid="FileGuid">
    <input type="hidden" groupid="SparePartInventoryInvoice" name="ChassisNo" argumentid="ChassisNo">

    <div class="ItemListDiv p-2">
        <table class="table table-striped table-bordered uploadedItemList HideOnNewForm">
            <thead class="table-dark">
                <tr>
                    <th>Item ID</th>
                    <th>Item Code</th>
                    <th>Description</th>
                    <th>From</th>
                    <th>Rack</th>
                    <th>Shelf</th>
                    <th>Store</th>
                    <th>Qty</th>
                    <th>Unit Price</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic rows will be inserted here -->
            </tbody>
            <tfoot>
                <tr class="NoRecordsTR">
                    <td class="NoRecords text-center" colspan="11">
                        <div class="PWCNoDataMessage">No records available.</div>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>



  <%--  <div class="container mt-3 HideOnNewForm">
    <div class="table-responsive">
        <table class="table table-bordered table-hover" id="dynamicRows">
            <thead class="table-dark">
                <tr>
                    <th scope="col" style="width: 2px;">Item ID</th>
                    <th scope="col" style="width: 100px;">Item Code</th>
                    <th scope="col" style="width: 300px;">Description</th>
                    <th scope="col" style="width: 50px;">Qty'AVL</th>
                    <th scope="col" style="width: 30px;">QTY</th>
                    <th scope="col" style="width: 70px;">Unit Price</th>
                    <th scope="col" style="width: 56px;">Total Price</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr class="trNoDynamic">
                    <td style="display: none;">
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="InvRecId" maxlength="10" disabled>
                    </td>
                    <td>
                        <input type="text" class="form-control text-center fw-bold text-danger lov-popup item-id-class common-disable elem-disabled" 
                            groupid="SparePartInventoryInvoice" lovpopupid="ItemCodePopup" argumentid="ItemId" maxlength="10">
                    </td>
                    <td>
                        <input type="text" class="form-control fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartSerialNo" maxlength="10" disabled>
                    </td>
                    <td>
                        <input type="text" class="form-control fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartName" maxlength="10" disabled>
                    </td>
                    <td>
                        <input type="text" class="form-control text-center fw-bold elem-disabled number" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" maxlength="10" disabled>
                    </td>
                    <td>
                        <input type="text" class="form-control text-center fw-bold number common-disable select-quantity" 
                            groupid="SparePartInventoryInvoice" argumentid="SelectQuantity" maxlength="10">
                    </td>
                    <td>
                        <input type="text" class="form-control text-center fw-bold elem-disabled common-disable" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice" maxlength="10">
                    </td>
                    <td>
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="TotalPrice" maxlength="10" disabled>
                    </td>
                    <td style="display: none;">
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="StoreLocationID" maxlength="10" disabled>
                    </td>
                    <td style="display: none;">
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartRackfNo" maxlength="10" disabled>
                    </td>
                    <td style="display: none;">
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartShelfNo" maxlength="10" disabled>
                    </td>
                    <td style="display: none;">
                        <input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="PurchasingFrom" maxlength="10" disabled>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary save-btn" recid="recId" SaveButton="SaveButton">Save</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>--%>
 <%--   <div class="container mt-3 HideOnNewForm">
        <div class="table-responsive">
            <table class="table table-bordered table-hover uploadedItemList">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Item ID</th>
                        <th scope="col">Item Code</th>
                        <th scope="col">Description</th>
                        <th scope="col">Qty'AVL</th>
                        <th scope="col">QTY</th>
                        <th scope="col">Unit Price</th>
                        <th scope="col">Total Price</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="trNoDynamic">
                        <td><input type="text" class="form-control text-center fw-bold text-danger lov-popup common-disable elem-disabled" 
                            groupid="SparePartInventoryInvoice" lovpopupid="ItemCodePopup" argumentid="ItemId" maxlength="10"></td>
                        <td><input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartSerialNo" maxlength="10" disabled></td>
                        <td><input type="text" class="form-control fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartName" maxlength="10" disabled></td>
                        <td><input type="text" class="form-control text-center fw-bold elem-disabled number" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" maxlength="10" disabled></td>
                        <td><input type="text" class="form-control text-center fw-bold number common-disable select-quantity" 
                            groupid="SparePartInventoryInvoice" argumentid="SelectQuantity" maxlength="10"></td>
                        <td><input type="text" class="form-control text-center fw-bold elem-disabled common-disable" 
                            groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice" maxlength="10"></td>
                        <td><input type="text" class="form-control text-center fw-bold elem-disabled" 
                            groupid="SparePartInventoryInvoice" argumentid="TotalPrice" maxlength="10" disabled></td>
                        <td><button type="button" class="btn btn-primary save-btn" recid="recId">Save</button></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="NoRecordsTR">
                        <td colspan="8" class="text-center NoRecords">
                            <div class="p-3 bg-light text-muted">No records available.</div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>--%>

    <!-- Totals Section -->
    <div class="row mb-3 justify-content-center HideOnNewForm">
        <div class="col-12 col-md-4 col-lg-3 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control text-center elem-disabled" id="SubTotal"
                    groupid="SparePartInventoryInvoice" argumentid="SubTotal" readonly placeholder="Sub Total">
                <label for="SubTotal">Sub Total</label>
            </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3 mb-3 mb-md-0 onQuotation">
            <div class="form-floating">
                <input type="text" class="form-control text-center common-disable" id="Card"
                    groupid="SparePartInventoryInvoice" argumentid="Card" maxlength="10" placeholder="Card">
                <label for="Card">Card</label>
            </div>
        </div>
    </div>
    <div class="row mb-3 justify-content-center HideOnNewForm">
        <div class="col-12 col-md-4 col-lg-3 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control text-center common-disable" id="Discount"
                    groupid="SparePartInventoryInvoice" argumentid="Discount" maxlength="100" placeholder="Discount">
                <label for="Discount">Discount</label>
            </div>
        </div>

        <div class="col-12 col-md-4 col-lg-3 mb-3 mb-md-0 onQuotation">
            <div class="form-floating">
                <input type="text" class="form-control text-center common-disable" id="Cash"
                    groupid="SparePartInventoryInvoice" argumentid="Cash" maxlength="10" placeholder="Cash">
                <label for="Cash">Cash</label>
            </div>
        </div>
    </div>
    <div class="row mb-3 justify-content-center HideOnNewForm">
        <div class="col-12 col-md-4 col-lg-3">
            <div class="form-floating">
                <input type="text" class="form-control text-center elem-disabled" id="GrandTotal"
                    groupid="SparePartInventoryInvoice" argumentid="GrandTotal" readonly placeholder="Grand Total">
                <label for="GrandTotal">Grand Total</label>
            </div>
        </div>

        <div class="col-12 col-md-4 col-lg-3 onQuotation">
            <div class="form-floating">
                <input type="text" class="form-control text-center elem-disabled" id="Total"
                    groupid="SparePartInventoryInvoice" argumentid="Total" readonly placeholder="Total Received">
                <label for="Total">Total Received</label>
            </div>
        </div>
    </div>



    <!-- Buttons -->
    <div class="row mt-4 justify-content-md-center mb-3">
        <div class="col-12 col-md-2 mb-3 mb-md-0 OnNewForm common-button InvoiceOpenBtn">
            <button type="button" class="DataAction btn btn-primary w-100 InvoiceOpenBtn common-button OnNewForm"
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_Invoice',HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" >
                Open
            </button>
        </div>
        <div class="col-12 col-md-2 mb-3 mb-md-0 OnNewForm common-button">
            <button type="button" class="MyDataAction btn btn-success w-100 ClosedInvoice  common-button OnNewForm"
               conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" >
                Close
            </button>
        </div>
        <div class="col-12 col-md-2 OnNewForm CanceledInvoice  common-button">
            <button type="button" class=" MyDataAction btn btn-danger w-100 CanceledInvoice  common-button OnNewForm"
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" >
                Cancel
            </button>
        </div>
    </div>

    <div class="row mt-2 justify-content-md-center mb-3">
        <div class="col-12 col-md-1 mb-3 mb-md-0 OnNewForm InvoiceButton_Edit">
            <button type="button" class="btn btn-secondary w-100 InvoiceButton_Edit OnNewForm" roles="iRen_Contracts_Admin" >
                Edit
            </button>
        </div>
        <div class="col-12 col-md-2 mb-3 mb-md-0 btnSaveInvoice   common-button">
            <button type="button" class="DataAction btn btn-primary w-100 btnSaveInvoice   common-button"
                 conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:false, Requery:false,GroupId:'SparePartInventoryInvoice'}" >
                Create Invoice
            </button>
        </div>
        <div class="col-12 col-md-1 mb-3 mb-md-0 btnSave common-button">
            <button type="button" class="DataAction btn btn-primary w-100 btnSave common-button"
                 conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:false, Requery:false,GroupId:'SparePartInventoryInvoice'}">
                Save
            </button>
        </div>
        <div class="col-12 col-md-1 mb-3 OnNewForm">
            <button type="button" class="btn btn-secondary w-100 PrintBill OnNewForm ">
                Print
            </button>
        </div>
        <div class="col-12 col-md-1 btnCancel">
            <button type="button" class="btn btn-secondary w-100 CloseForm  btnCancel">
                Close
            </button>
        </div>
    </div>

    <!-- Created By and Date -->
    <div class="row mb-3 justify-content-center">
        <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center" id="CreatedBy"
                    groupid="SparePartInventoryInvoice" argumentid="CreatedBy" readonly placeholder="Contract Created By">
                <label for="CreatedBy">Contract Created By</label>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control-plaintext text-center" id="InvDateCreated"
                    groupid="SparePartInventoryInvoice" argumentid="InvDateCreated" readonly placeholder="Contract Date & Time">
                <label for="InvDateCreated">Contract Date & Time</label>
            </div>
        </div>
    </div>
</div>

<%--<style>--%>
    


<%--.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    text-align: center;
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>--%>

          <!-- The Popup Modal -->
<%--                <div id="popupModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>Functionality is still in progress.</p>
                    </div>
                </div>--%>

<%--<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTableInvoice">


    <tr tabid="InvoiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

     
                <tr>
    <td colspan="4">
        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
                                <tr class="StatusRow">
                     <td class="ftitle" style="width: 20%;">
                        <nobr>Invoice No.:</nobr>

                    </td>
                    <td style="width:30%">
                       
                      <span class="ftitle" style="font-size: 12px;" groupid="SparePartInventoryInvoice" argumentid="InvRecCode"></span>
                         <input type="hidden" name="RecId" groupid="SparePartInventoryInvoice" argumentid="RecId" />
                           <input type="hidden" name="InvoiceRecId" groupid="SparePartInventoryInvoice" argumentid="InvoiceRecId" />
                       
                 </td>

                      <td class="ftitle" style="width: 20%;">
                        <nobr>Invoice Status:</nobr>
                    </td>
                    <td class="ftitle" style="width:30%">
                        <span class="ftitle" groupid="SparePartInventoryInvoice" argumentid="StateName"></span>

                        <div style="display: none">
                        <span groupid="SparePartInventoryInvoice" argumentid="StateId"></span>

                        </div>
                        </td>
                </tr>
                <tr>
                    <td class="ftitle" style="width: 20%;">
                        <nobr>Invoice For:</nobr>

                    </td>
                    <td class="ftitle" style="width: 30%;">

                        <input type="radio" class="   ServiceInvoice  " checked="checked" default="default" value="ServiceInvoice" name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails" /><label>Service</label>
                        <input type="radio" class="  PartsInvoice  " value="PartsInvoice" name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails" /><label>Parts</label>
                        <input type="radio" class="  QuotationInvoice  " value="QuotationInvoice" name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails" /><label>Quotation</label>
                    </td>

                    <td class="ftitle" style="width: 20%;">
                        <nobr>Invoice Date:</nobr>

                    </td>
                    <td class="ftitle" style="width: 30%;">

                        <input argumentid="InvoiceDate" class="text  date DisableOnClose CommonDisableClass  CommonDisableClasss" groupid="SparePartInventoryInvoice" maxlength="10" style="width: 150px;text-align:center" type="text" /></td>

                </tr>

                <tr class="serv">
                    <td class="ftitle">
                        <nobr>Invoice Type:</nobr>

                    </td>
                    <td class="ftitle" >

                        <input type="radio" class="   CashInvoice  InvoiceTypeCommon" checked="checked" default="default" value="CashInvoice" name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType" /><label>Cash</label>
                        <input type="radio" class="  WarrentyInvoice InvoiceTypeCommon " value="WarrantyInvoice" name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType" /><label>Warranty </label>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                      <tr>
                    <td class="ftitle">
                        <nobr class="cust">Customer Code *:</nobr>
                        <nobr class="serv">Service No.*:</nobr>
                    </td>
                    <td>
                    
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text  CommonDisableClass CommonDisableClasss "
                            groupid="SparePartInventoryInvoice" lovpopupid="customerInvoicePopup" argumentid="CustomerRecCode" requirederr=' *Required'  />

                       <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisableClass  CommonDisableClasss"
                         groupid="SparePartInventoryInvoice" lovpopupid="carPopupGarageForInvoice" argumentid="ServiceNo"   requirederr=' *Required'/>

                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text  CommonDisableClass CommonDisableClasss "
                            groupid="SparePartInventoryInvoice" lovpopupid="QuotationInvoicePopup" argumentid="CustomerRecCodeQuotation" requirederr=' *Required' />



                    </td>
                         

                   
                    <td class="ftitle">
                        <nobr class="serv">Service Date:</nobr></td>
                    <td>
                        

                        <span class="ftitle serv" groupid="SparePartInventoryInvoice" argumentid="DateCreated"></span>
                    </td>

                </tr>
                            <tr class="hideCarandService">
   
                  <td class="ftitle">
      <nobr>Car No:</nobr>
  </td>
  <td >
      <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="CarNumber"></span>
  </td>

   
                <td class="ftitle">
          <nobr>Year:</nobr>
                    </td>
                  <td style="text-align: left">
                   <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="CarYear"></span>

                  </td>
            </tr>

                   <tr class="hideCarandService">

   
                       <td class="ftitle">
                <nobr>Brand:</nobr>
            </td>
            <td >
                <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="Brand"></span>
              
            </td>
   
    <td class="ftitle">
          <nobr>Model:</nobr></td>
   
       <td class="ftitle">
            
           <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="Model"></span>
   
</td>

    
</tr>

                <tr class="hideCarandService">
     <td colspan="4">
         <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
     </td>
 </tr>
                             

                <tr class="hideTrForINVCust">
                   
                     <td class="ftitle" >
                      
                        <nobr class="serv">Customer Code</nobr></td>
                    <td class="ftitle" >
                    

                       <input  type="text" class="ftitle CommonSPCust serv" style="display: inline-block;font-size: 15px;background: transparent;color: rgb(98, 130, 150);
                        outline: none;border: none;color: #628296;cursor: context-menu;font-size: 12.5px;font-weight: bold;"
                           groupid="SparePartInventoryInvoice" argumentid="SICustomerRecCode" />

                    </td>

                   
                      <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td class="ftitle">
                          <div style="float: left; width: 135px" class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="NationalIDNo"></div>
                    <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="NationalIDExpiryDate"></span>
               
                    </td>
                   
                   
                </tr>

                <tr class="hideTrForINVCust">

                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: left">
                        <span class="ftitle CommonSPCust" style="font-size: 16px;" groupid="SparePartInventoryInvoice" argumentid="CustomerName"></span>
                    </td>



                    <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="MobileTelephone1"></span>
                      
                        <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="MobileTelephone2"></span>
                    </td>



                </tr>
           

              

             
                           
                


                <tr >

                    <td class="ftitle">
                        <nobr class="hideCarandService">In KM:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonSPINv hideCarandService" groupid="SparePartInventoryInvoice" argumentid="CurrentServiceKm"></span>
                    </td>


                    <td class="ftitle">
                        <nobr class="">Manual ID:</nobr></td>
                    <td>
                         <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text CommonDisableClass CommonDisableClasss"groupid="SparePartInventoryInvoice" argumentid="ManualID" />

                    </td>
                </tr>
            </table>
        </td>
                    </tr>

              <tr class="HideOnNewForm">
    <td colspan="4">
        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

              <tr class="LineOfItemRow HideOnNewForm">
    <td colspan="4">
        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table" id="dynamicRows">
            <tr>
                <td class="ftitle" style="width:2px">
                    <label for="column1">Item ID</label></td>
                <td class="ftitle" style="width:100px">
                    <label for="column2">Item Code</label></td>
                <td class="ftitle" style="width:300px">
                    <label for="column3">Description</label></td>
                <td class="ftitle" style="width:50px">
                    <label for="column4">Qty'AVL</label></td>
                <td class="ftitle" style="width:30px">
                    <label for="column5">QTY</label></td>
                <td class="ftitle" style="width:70px">
                    <label for="column7">Unit Price</label></td>
                <td class="ftitle" style="width:56px">
                    <label for="column8">Total Price</label></td>
                 <td class="ftitle"><label for="column9">Actions</label></td> <!-- Actions column -->

            </tr>
            <tr class="trNoDynamic">

                <td style="display: none">
                    <input type="text" style="text-align: center; width: 50px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="InvRecId" disabled="disabled" />

                </td>
                <td>



                    <input type="text" style="text-align: center; width: 50px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text ItemIdClass  CommonDisableClass ElemDisabled "
                    groupid="SparePartInventoryInvoice" lovpopupid="ItemCodePopup" argumentid="ItemId"   />
                </td>
                <td>
                    <input type="text" style="text-align: left; width: 130px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="SparePartSerialNo" disabled="disabled" />

                </td>


                <td>
                    <input type="text" style="text-align: left; width: 350px; font-weight: bold;" maxlength="10" class="text  ElemDisabled"
                        groupid="SparePartInventoryInvoice" argumentid="SparePartName"  disabled="disabled"/>
                </td>
                <td>
                    <input type="text" style="text-align: center; width: 50px;font-weight: bold;" maxlength="10" class="text ElemDisabled number "
                        groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" disabled="disabled"/>
                </td>
                <td>
                    <input type="text" style="text-align: center; width: 30px ; font-weight: bold; " maxlength="10" class="number text CommonDisableClass SelectQuantity "
                        groupid="SparePartInventoryInvoice" argumentid="SelectQuantity" />
                </td>
                <td>
                    <input type="text" style="text-align: center; width: 56px;font-weight: bold;" maxlength="10" class="text ElemDisabled  CommonDisableClass "
                        groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice" />
                </td>
                <td>
                    <input type="text" style="text-align: center; width: 70px; font-weight: bold; " maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="TotalPrice" disabled="disabled"/>

                </td>
           
                <td style="display:none">
                    <input type="text" style="text-align: center; width: 80px; font-weight: bold; " maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="StoreLocationID" disabled="disabled"/>

                </td>

                <td style="display: none">
                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="SparePartRackfNo" disabled="disabled" />

                </td>

                <td style="display: none">
                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="SparePartShelfNo" disabled="disabled" />

                </td>

         
                <td style="display: none">
                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                        groupid="SparePartInventoryInvoice" argumentid="PurchasingFrom" disabled="disabled" />

                </td>


                 <td><button type = "button" recid="recId" class="SaveBtn" SaveButton="SaveButton">Save</button></td> <!-- Delete button -->

            </tr>


     
        </table>


    </td>

  

</tr>
</table>
        </td>
                  </tr>

                <tr class="HideOnNewForm">
                    <td colspan="4">

                        <input type="hidden" groupid="SparePartInventoryInvoice" argumentid="FileGuid" readonly="readonly" />
                        <input type="hidden" groupid="SparePartInventoryInvoice" name="ChassisNo" argumentid="ChassisNo" />

                 


                        <div style="width: 100%; padding: 4px;" class="ItemListDiv ">

                            <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="uploadedItemList ">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4 " style="padding-left: 5px; padding-right: 0px; color: black; width: 60px;">Item ID</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 130px;">Item Code</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 270px;">Description</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">From</th>

                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Rack</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Shelf</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Store</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Qty</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Unit Price</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Total Price</th>

                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border w-grid-cell-border-last colIndex-4"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr class="NoRecordsTR">

                                        <td class="NoRecords w-grid-norecords-msg" colspan="10">
                                            <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                        </td>
                                    </tr>

                                </tfoot>

                            </table>
                        </div>
                      
                   
                        
                    </td>
                </tr>

               
                          <tr class="HideOnNewForm">
<td colspan="4">
    <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr class="HideOnNewForm">

                    <td class="ftitle" style="width: 20%;">
                        <nobr>Sub Total:</nobr></td>
                    <td style="width: 30%;">
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="100" class="text SubTotal ElemDisabled"
                            groupid="SparePartInventoryInvoice" argumentid="SubTotal" disabled="disabled" />

                    </td>
                    <td class="ftitle " style="width: 20%;">
                        <nobr class="onQuotation">Card:</nobr

                    </td>
                    <td style="width: 30%;">
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text CommonDisableClass CommonDisableClasss onQuotation"
                            groupid="SparePartInventoryInvoice" argumentid="Card" />
                    </td>



                </tr>


                <tr class="HideOnNewForm">


                    <td class="ftitle ">
                        <nobr>Discount:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="100" class="text Discount CommonDisableClass CommonDisableClasss"
                            groupid="SparePartInventoryInvoice" argumentid="Discount" /></td>

 
                    <td class="ftitle ">
                        <nobr class="onQuotation">Cash:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text CommonDisableClass CommonDisableClasss onQuotation"
                            groupid="SparePartInventoryInvoice" argumentid="Cash" />
                    </td>

                </tr>


                <tr class="HideOnNewForm">



                    <td class="ftitle">
                        <nobr>Grand Total:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text GrandTotal ElemDisabled"
                            groupid="SparePartInventoryInvoice" argumentid="GrandTotal" disabled="disabled" /></td>
                    <td class="ftitle ">
                        <nobr class="onQuotation">Total Received:</nobr>

                    </td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text onQuotation Total ElemDisabled"
                            groupid="SparePartInventoryInvoice" argumentid="Total" disabled="disabled" />
                    </td>


                    </tr>
        </table>
    </td>
                              </tr>

                  <tr>
                    <td colspan="4" style="text-align: center;">
                           
                       <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" style="width: 95px; color: blue;"  value="  Open  " class="DataAction ButtonStyle  InvoiceOpenBtn common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_Invoice',HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 95px; color: Green"  value="  Close " class="MyDataAction ButtonStyle ClosedInvoice  common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 95px; color: Red"  value="  Cancel  " class="MyDataAction ButtonStyle CanceledInvoice  common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />

                        </div>
                    
                        <div style="padding-top: 10px; padding-bottom: 10px;">
                            <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle InvoiceButton_Edit OnNewForm" />
                            <input type="button" style="width: 100px" value="  Create Invoice  "  class="DataAction ButtonStyle btnSaveInvoice   common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:false, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 50px" value="  Save  "  class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:false, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                             <input type="button" value="  Print  " style="width: 50px" class="ButtonStyle PrintBill OnNewForm  " />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel " />
                        </div>
                    </td>
                </tr>

                          <tr >
<td colspan="4">
    <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr>
                    <td class="ftitle" style="width:20%">
                        <nobr>Contract Created By:</nobr>
                    </td>
                    <td style="text-align: center; width:30%">
                        <span class="ftitle" groupid="SparePartInventoryInvoice" argumentid="CreatedBy"></span>
                    </td>

                    <td class="ftitle" style="width:20%">
                        <nobr>Contract Date & Time:</nobr>
                    </td>
                    <td style="text-align: center;width:30%">
                        <span class="ftitle" groupid="SparePartInventoryInvoice" argumentid="InvDateCreated"></span>
                        <span class="ftitle" groupid="SparePartInventoryInvoice" argumentid="DateCreatedTime"></span>
                    </td>
                </tr>
        </table>
    </td>
                              </tr>
            </table>
        </td>
    </tr>


    <script src="../../../Scripts/eForms/iRental/grdInvoicePaymentDetails.js"></script>

     <tr tabid="InvoicePaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdInvoicePaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_Invoice_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_Invoice_Payments\',KeysCol:\'RecId\'}}}">
                


 <GridConfig>
                     <script>
                         cf = {
                             cols: {
                                 Sequence: { width: '0px' },
                                 RecId: { width: '0px', caption: 'ID' },
                                 LocationReceiptId: { width: '130px', caption: 'ID' },
                                 PrintId: { width: '30px', caption: '' },
                                 ParentRecId: { width: '0px' },
                                 PaymentType: { width: '65px', caption: 'Type' },
                                 PaymentDate: { caption: 'Date', width: '90px' },
                                 PaymentMode: { caption: 'Mode', width: '75px' },
                                 ChequeNo: { width: '0px' },
                                 PaymentAmount: { caption: 'Amount', width: '80px' },
                                 ReceiptId: { caption: 'Manual ID' },
                                 DateCreated: { caption: 'Date Created', width: '130px' },
                                 CreatedBy: { caption: 'Created By', width: '150px' },
                                 StateId: { width: '0px' }
                             },
                             forms: {
                                 NewFormId: 'frmInvoicePaymentDetails',
                                 EditFormId: 'frmInvoicePaymentDetails',
                                 Keys: 'RecId'
                             }
                         };
                     </script>
                     </GridConfig>
                 <Scripts>
                     <script>
               
                     </script>
                     </Scripts>
                 <RowDetail>
                     <pre class="" colindex="4">
                    <AW:container id="conInvoicePaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdInvoicePaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_Invoice_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Invoice Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '182px' },
                                RecId: { width: '0px', caption: 'System ID' },
                                ParentRecId: { width: '0px' },
                                PaymentType_Audit: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Action By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                    <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                   </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
                     </RowDetail>


                 </AW:DataGrid>

            <AW:Form ID="frmInvoicePaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/Invoice_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Invoice Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>


</script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>
</table>--%>

