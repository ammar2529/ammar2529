<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiaryManagement_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.SearchForms.BeneficiaryManagement_ShUc" %>


<div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">
                    <span class="ink-bar">Beneficiary Management</span>
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
                <div class="form-floating">
                    <input type="text" class="form-control" aria-label=".form-control-sm example" id="RecCode" argumentid="RecCode" groupid="schBeneficiaryManagement" placeholder="BEN-Code">
                    <label for="RecCode">BEN-Code</label>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="custom-floating">
                    <select class="form-select" id="BeneficiaryType" aria-label="Custom floating label select" groupid="schBeneficiaryManagement" argumentid="BeneficiaryType" name="D4">
                        <option value="" selected></option>
                        <option value="C">Company</option>
                        <option value="I">Individual</option>
                    </select>
                    <label for="BeneficiaryType">Beneficiary Type</label>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating">
                    <input type="text" class="form-control" aria-label=".form-control-sm example" id="CompanyName" argumentid="CompanyName" groupid="schBeneficiaryManagement" placeholder="Company Name">
                    <label for="CompanyName">Company Name</label>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating">
                    <input type="text" class="form-control" aria-label=".form-control-sm example" id="PersonName" argumentid="PersonName" groupid="schBeneficiaryManagement" placeholder="Person Name">
                    <label for="PersonName">Person Name</label>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating">
                    <input type="text" class="form-control" aria-label=".form-control-sm example" id="NationalIDNo" argumentid="NationalIDNo" groupid="schBeneficiaryManagement" placeholder="National ID No.">
                    <label for="NationalIDNo">National ID No.</label>
                </div>
            </div>

            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2">
                <div class="form-floating">
                    <input type="text" class="form-control" aria-label=".form-control-sm example" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schBeneficiaryManagement" placeholder="Mobile Telephone">
                    <label for="MobileTelephone1">Mobile Telephone</label>
                </div>
            </div>



        </div>

        <div class="row justify-content-end mt-2">
            <div class="col-12 col-sm-12 col-xs-12 col-lg-2 col-xl-2 d-flex justify-content-center align-items-center">
                <button type="button" class="btn btn-primary search ViewButton me-2">Search</button>
                <button type="button" class="btn btn-secondary reset ClearButton">Clear</button>
            </div>
        </div>
    </div>
</div>


