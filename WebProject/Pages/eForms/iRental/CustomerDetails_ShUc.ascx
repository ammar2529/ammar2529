<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CustomerDetails_ShUc" %>

<div class="">
    <div class="card">
        <div class="card-body">
                        <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Search</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="RecCode" argumentid="RecCode" groupid="schCustomerManagement" placeholder="Enter RecCode">
                        <label for="RecCode">RecCode</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schCustomerManagement" placeholder="Enter Customer Name">
                        <label for="CustomerName">CustomerName</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schCustomerManagement" placeholder="Enter National ID">
                        <label for="NationalIDNo">NationalIDNo</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schCustomerManagement" placeholder="Enter Mobile">
                        <label for="MobileTelephone1">MobileTelephone1</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating">
                        <select class="form-select form-select-sm dropdownlist" id="CustomerStatus" argumentid="CustomerStatus" groupid="schCustomerManagement" name="D1">
                            <option value="">Select Status</option>
                            <option value="Active">Active</option>
                            <option value="Blacklisted">Blacklisted</option>
                        </select>
                        <label for="CustomerStatus">CustomerStatus</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
