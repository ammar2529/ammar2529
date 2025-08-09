<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiaryManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.BeneficiaryManagement_FrUc" %>

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

        <div id="trNote" class="mb-2">
            <div class="col-12" style="padding-top: 10px; padding-bottom: 10px">
                Use the form below to update the details, fields marked with an asterisk (*) are mandatory
            </div>
        </div>

        <div style="display: none">
            <span groupid="Beneficiary" argumentid="RecId"></span>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <input type="text" class="form-control-plaintext text-danger" id="RecCode" groupid="Beneficiary"
                        argumentid="RecCode" value="New customer code will be generated on saving" placeholder="Code" readonly>
                    <label for="RecCode">Code:</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test1" groupid="Beneficiary" argumentid="test1" disabled="disabled">
                    <label for="test1"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test2" groupid="Beneficiary" argumentid="test2" disabled="disabled">
                    <label for="test2"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 align-self-end">
                <label class="me-3">
                    <small>Beneficiary Type</small>
                </label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input Company" type="radio" checked="checked" default="default" id="BeneficiaryTypeCompany" value="C" name="BeneficiaryType"
                            groupid="Beneficiary" argumentid="BeneficiaryType">
                        <label class="form-check-label" for="BeneficiaryTypeCompany">Company</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input Individual" type="radio" value="I" id="BeneficiaryTypeIndividual" name="BeneficiaryType" groupid="Beneficiary" argumentid="BeneficiaryType">
                        <label class="form-check-label" for="BeneficiaryTypeIndividual">Individual</label>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test3" groupid="Beneficiary" argumentid="test3" disabled="disabled">
                    <label for="test3"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test4" groupid="Beneficiary" argumentid="test4" disabled="disabled">
                    <label for="test4"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <input type="text" class="form-control required" id="CompanyName" groupid="Beneficiary"
                        argumentid="CompanyName" placeholder="Company Name*">
                    <label for="CompanyName" class="CompanyTD">Company Name*</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test5" groupid="Beneficiary" argumentid="test5" disabled="disabled">
                    <label for="test5"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test6" groupid="Beneficiary" argumentid="test6" disabled="disabled">
                    <label for="test6"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <input type="text" class="form-control" id="PersonName" groupid="Beneficiary"
                        argumentid="PersonName" placeholder="Person Name">
                    <label for="PersonName" class="PersonTD">Person Name</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test7" groupid="Beneficiary" argumentid="test7" disabled="disabled">
                    <label for="test7"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test8" groupid="Beneficiary" argumentid="test8" disabled="disabled">
                    <label for="test8"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <input type="text" class="form-control alphanumericspacedot" id="NationalIDNo" groupid="Beneficiary"
                        argumentid="NationalIDNo" maxlength="13" placeholder="National ID No.">
                    <label for="NationalIDNo">National ID No.</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test9" groupid="Beneficiary" argumentid="test9" disabled="disabled">
                    <label for="test9"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test10" groupid="Beneficiary" argumentid="test10" disabled="disabled">
                    <label for="test10"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <input type="text" class="form-control number" id="MobileTelephone1" groupid="Beneficiary"
                        argumentid="MobileTelephone1" maxlength="8" placeholder="Mobile Telephone">
                    <label for="MobileTelephone1">Mobile Telephone</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test11" groupid="Beneficiary" argumentid="test11" disabled="disabled">
                    <label for="test11"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test12" groupid="Beneficiary" argumentid="test12" disabled="disabled">
                    <label for="test12"></label>
                </div>
            </div>
        </div>

        <div class="row mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating">
                    <textarea class="form-control textarea" id="Address" placeholder="Address"
                        style="height: 100px; resize: none;" argumentid="Address" groupid="Beneficiary"></textarea>
                    <label for="Address">Address</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test13" groupid="Beneficiary" argumentid="test13" disabled="disabled">
                    <label for="test13"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="test14" groupid="Beneficiary" argumentid="test14" disabled="disabled">
                    <label for="test14"></label>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center mt-4 mb-2">
            <div class="row">
                <div class="col-md-3">
                    <button type="button" class="btn btn-primary DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_BeneficiaryManagement',HideOnSuccess:true,Requery:true,GroupId:'Beneficiary'}">
                        <i class="fa fa-save me-1"></i>Save
                    </button>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-secondary CloseForm ButtonStyle">
                        <i class="fa fa-times me-1"></i>Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

