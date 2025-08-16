<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_Cust_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_Cust_ShUc" %>


<div class="mb-4">
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

                <div class="col-sm-6 col-lg-8 ">
                    <div class="form-floating ">
                        <input type="text" class="form-control " aria-label=".form-control-sm example" id="Search" argumentid="Search" groupid="schRentalContracts_Cust" placeholder="Search">
                        <label for="Search">Search</label>
                    </div>
                </div>

                <div class="col-auto d-flex align-items-center">
                    <button class="search ViewButton btn btn-success me-2">
                        Search
                    </button>
                    <button class="reset ClearButton btn btn-primary me-2">
                        Clear
                    </button>
                    <button class="ClosePopup CloseLOVPopup btn btn-danger">
                        Close
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>




