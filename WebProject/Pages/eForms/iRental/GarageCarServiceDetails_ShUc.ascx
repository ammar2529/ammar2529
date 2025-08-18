<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.GarageCarServiceDetails_ShUc" %>


<div class=" text-center">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="RecCode" argumentid="RecCode" groupid="schCarServiceDetails" placeholder="Enter Rec Code">
                        <label for="RecCode">Rec Code</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="Gcs_ShUcCarNumber" argumentid="CarNumber" groupid="schCarServiceDetails" placeholder="Enter Car Number">
                        <label for="Gcs_ShUcCarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CustomerName" argumentid="CustomerName" groupid="schCarServiceDetails" placeholder="Enter Customer Name">
                        <label for="CustomerName">Customer Name</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NationalIDNo" argumentid="NationalIDNo" groupid="schCarServiceDetails" placeholder="Enter National ID">
                        <label for="NationalIDNo">National ID No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="MobileTelephone1" argumentid="MobileTelephone1" groupid="schCarServiceDetails" placeholder="Enter Mobile">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty date" id="CarRecivedDate" groupid="schCarServiceDetails" argumentid="CarRecivedDate" maxlength="10" placeholder="Enter Received Date">
                        <label for="CarRecivedDate">Car Received Date</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty date" id="CarDeliverdDate" groupid="schCarServiceDetails" argumentid="CarDeliverdDate" maxlength="10" placeholder="Enter Delivered Date">
                        <label for="CarDeliverdDate">Car Delivered Date</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="StateId" groupid="schCarServiceDetails" argumentid="StateId" name="D4">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="OpenState">Open</option>
                            <option value="">-----------------------------</option>
                            <option value="ClosedState">Closed</option>
                            <option value="">-----------------------------</option>
                            <option value="CanceledState">Canceled</option>
                            <option value="">-----------------------------</option>
                        </select>
                        <label for="StateId">Status</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <!-- Empty Cell -->
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>