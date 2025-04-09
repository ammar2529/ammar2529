<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarTransfers_ShUc" %>

<div class="text-center">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarTransfers" placeholder="Enter Car Number">
                        <label for="CarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="OutLocationId" groupid="schCarTransfers" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="OutLocationId">Out Location</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="InLocationId" groupid="schCarTransfers" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                        <label for="InLocationId">In Location</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="DriverId" groupid="schCarTransfers" argumentid="DriverId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'27'}]}">
                            <option value="" selected="selected">Select Driver</option>
                        </select>
                        <label for="DriverId">Driver</label>
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