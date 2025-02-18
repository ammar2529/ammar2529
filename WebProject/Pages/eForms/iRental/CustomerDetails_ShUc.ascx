<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CustomerDetails_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerThree" data-bs-toggle="collapse" data-bs-target="#cardContentThree" aria-expanded="true" aria-controls="cardContentThree" style="cursor: pointer;">
            Customer Management
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentThree" class="collapse show" aria-labelledby="headerThree">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="RecCode">RecCode</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="RecCode" argumentid="RecCode" groupid="schCustomerManagement" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerName">CustomerName</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schCustomerManagement" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NationalIDNo">NationalIDNo</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schCustomerManagement" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="MobileTelephone1">MobileTelephone1</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schCustomerManagement" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CustomerStatus">CustomerStatus</label>
                        <select class="form-select form-select-sm dropdownlist" id="CustomerStatus" argumentid="CustomerStatus" groupid="schCustomerManagement" name="D1" ">
                            <option value="">Select Status</option>
                            <option value="Active">Active</option>
                            <option value="Blacklisted">Blacklisted</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3"  padding-bottom: 0px;">
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" ">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" ">Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
