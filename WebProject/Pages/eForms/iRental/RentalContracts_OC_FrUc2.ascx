<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_OC_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_OC_FrUc2" %>

<div class=" mt-3">
    <!-- Note Section -->
            <div class="row my-3 justify-content-md-center">
                <div class="alert alert-info mt-3" role="alert">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </div>
 
            </div>


    <!-- Description Field -->
    <div class="row mb-3">
        <label for="Description" class="col-md-2 col-form-label">Description *</label>
        <div class="col-md-10">
            <!-- Hidden Fields -->
            <div style="display: none;">
                <span groupid="Rental_OtherCharges" argumentid="RecId"></span>
            </div>
            <div style="display: none;">
                <span groupid="Rental_OtherCharges" argumentid="ParentRecId"></span>
            </div>
            <!-- Textarea -->
            <textarea id="Description" class="form-control" rows="6" groupid="Rental_OtherCharges" argumentid="Description"></textarea>
        </div>
    </div>

    <!-- Amount Field -->
    <div class="row mb-3">
        <label for="Amount" class="col-md-2 col-form-label">Amount *</label>
        <div class="col-md-4">
            <input type="text" id="RentalAmount" class="form-control text-center" maxlength="10" groupid="Rental_OtherCharges" argumentid="Charges" alphconf="{allow:'.'}">
        </div>
    </div>

    <!-- Spacer -->
    <div class="row mb-3">
        <div class="col-12">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" alt="">
        </div>
    </div>

    <!-- Buttons -->
    <div class="row mb-3">
        <div class="col-md-10 offset-md-2">
            <button type="button" class="btn btn-primary DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts_OtherCharges',HideOnSuccess:true}">
                Save
            </button>
            <button type="button" class="btn btn-secondary CloseForm ButtonStyle">
                Cancel
            </button>
        </div>
    </div>
</div>
