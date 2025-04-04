<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_PD_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_PD_FrUc2" %>

<div class="container mt-3">
    <form class="w-100">
        <!-- Instruction Note -->

        <div class="row my-3 justify-content-md-center">
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>

            </div>

            <div style="display: none">
                <span groupid="Rental_Payments" argumentid="ParentRecId"></span>
                <span groupid="Rental_Payments" argumentid="RecId"></span>

            </div>

        </div>



        <!-- System ID Section -->
        <div class="row mb-3">
            <label for="SystemID" class="col-md-2 col-form-label">System ID</label>
            <div class="col-md-4">
                <input type="text" id="SystemID" class="form-control text-center fw-bold bg-light" maxlength="50" groupid="Rental_Payments" argumentid="LocationReceiptId" disabled>
            </div>
            <label for="ManualID" class="col-md-2 col-form-label text-end fw-bold fst-italic">Manual ID:</label>
            <div class="col-md-4">
                <input type="text" id="ManualID" class="form-control text-center fw-bold" maxlength="10" groupid="Rental_Payments" argumentid="ReceiptId">
            </div>
        </div>

        <!-- Payment Date -->
        <div class="row mb-3">
            <label for="PaymentDate" class="col-md-2 col-form-label">Payment Date *</label>
            <div class="col-md-4">
                <input type="text" id="PaymentDate" class="form-control" maxlength="10" groupid="Rental_Payments" argumentid="PaymentDate">
            </div>
        </div>

        <!-- Payment Type -->
        <div class="row mb-3">
            <label class="col-md-2 col-form-label">Payment Type *</label>
            <div class="col-md-4">
                <div class="form-check">
                    <input type="radio" id="PaymentTypeReceipt" class="form-check-input" name="PaymentType" value="0" checked groupid="Rental_Payments" argumentid="PaymentType">
                    <label for="PaymentTypeReceipt" class="form-check-label">Receipt</label>
                </div>
                <div class="form-check">
                    <input type="radio" id="PaymentTypeReturn" class="form-check-input" name="PaymentType" value="1" groupid="Rental_Payments" argumentid="PaymentType">
                    <label for="PaymentTypeReturn" class="form-check-label">Return</label>
                </div>
            </div>
        </div>

        <!-- Payment Mode -->
        <div class="row mb-3">
            <label for="PaymentMode" class="col-md-2 col-form-label">Payment Mode *</label>
            <div class="col-md-4">
                <select id="PaymentMode" class="form-select" groupid="Rental_Payments" argumentid="PaymentMode"
                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}" required>
                    <option value="" selected>Select Payment Mode</option>
                </select>
            </div>
        </div>

        <!-- Bank Details -->
        <div class="row mb-3">
            <label for="BankName" class="col-md-2 col-form-label">Bank *</label>
            <div class="col-md-4">
                <select id="BankName" class="form-select" groupid="Rental_Payments" argumentid="BankName"
                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" required>
                    <option value="" selected>Select Bank</option>
                </select>
            </div>
            <label for="ChequeNo" class="col-md-2 col-form-label">Cheque No *</label>
            <div class="col-md-4">
                <input type="text" id="ChequeNo" class="form-control text-center" maxlength="50" groupid="Rental_Payments" argumentid="ChequeNo" required>
            </div>
        </div>

        <!-- Cheque Date -->
        <div class="row mb-3">
            <label for="ChequeDate" class="col-md-2 col-form-label">Cheque Date *</label>
            <div class="col-md-4">
                <input type="text" id="ChequeDate" class="form-control text-center" maxlength="10" groupid="Rental_Payments" argumentid="ChequeDate" required>
            </div>
        </div>

        <!-- Payment Amount -->
        <div class="row mb-3">
            <label for="PaymentAmount" class="col-md-2 col-form-label">Payment Amount *</label>
            <div class="col-md-4">
                <input type="text" id="PaymentAmount" class="form-control text-center" maxlength="10" groupid="Rental_Payments" argumentid="PaymentAmount">
            </div>
            <label for="AmountInWords" class="col-md-2 col-form-label">Amount in Words</label>
            <div class="col-md-4">
                <input type="text" id="AmountInWords" class="form-control text-center bg-light" maxlength="255" groupid="Rental_Payments" argumentid="AmountInWords" disabled>
            </div>
        </div>

        <!-- Comments -->
        <div class="row mb-3">
            <label for="PaymentComments" class="col-md-2 col-form-label">Comments</label>
            <div class="col-md-10">
                <textarea id="PaymentComments" class="form-control" rows="4" groupid="Rental_Payments"></textarea>
            </div>
        </div>

        <!-- Buttons -->
        <div class="row mb-3">
            <div class="col-md-10 offset-md-2">
                <button type="submit" class="btn btn-primary DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts_Payments',HideOnSuccess:true}">
                    Save
                </button>
                <button type="button" class="btn btn-secondary CloseForm ButtonStyle">
                    Cancel
                </button>
            </div>
        </div>
    </form>
</div>
