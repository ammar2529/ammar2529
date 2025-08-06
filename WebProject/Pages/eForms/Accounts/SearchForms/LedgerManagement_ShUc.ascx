<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.SearchForms.LedgerManagement_ShUc" %>

<div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">

                    <span class="  ink-bar">Ledger Management</span>
                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                        onmouseover="this.style.color='red';"
                        onmouseout="this.style.color='black';"></i>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating ">
                    <input type="text" class="form-control " aria-label=".form-control-sm example" id="LedgerCode" argumentid="LedgerManagementRecCode" groupid="schLedgerManagement" placeholder="Ledger Code">
                    <label for="LedgerCode">Ledger Code</label>
                </div>
            </div>



            <div class="col-sm-6 col-lg-2">

                <div class="custom-floating">
                    <select class="form-select" id="BeneficiaryType" aria-label="Custom floating label select" groupid="schLedgerManagement" argumentid="BeneficiaryType" name="D4">
                        <option value="" selected></option>
                        <option value="C">Company</option>
                        <option value="I">Individual</option>
                    </select>
                    <label for="BeneficiaryType">Beneficiary Type</label>
                </div>

            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating ">
                    <input type="text" class="form-control " aria-label=".form-control-sm example" id="CompanyName" argumentid="CompanyName" groupid="schLedgerManagement" placeholder="Company Name">
                    <label for="CompanyName">Company Name</label>
                </div>
            </div>




            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2 d-flex justify-content-center align-items-center">
                <button type="button" class="btn btn-primary search ViewButton me-2">Search</button>
                <button type="button" class="btn btn-secondary reset ClearButton">Clear</button>
            </div>






        </div>
    </div>
</div>

