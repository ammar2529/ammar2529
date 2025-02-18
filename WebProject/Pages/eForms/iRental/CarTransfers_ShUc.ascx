<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarTransfers_ShUc" %>

<div class="container text-center">
    <div class="card">
<%--        <div class="card-header d-flex justify-content-between align-items-center" id="headerSeven" data-bs-toggle="collapse" data-bs-target="#cardContentSeven" aria-expanded="true" aria-controls="cardContentSeven" style="cursor: pointer;">
            Car Transfers
            <i class="fas fa-chevron-down"></i>
        </div>
        <div id="cardContentSeven" class="collapse show" aria-labelledby="headerSeven">--%>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="CarNumber">Car Number</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CarNumber" argumentid="CarNumber" groupid="schCarTransfers" style="height: 2px"; >
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="OutLocationId">Out Location</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="OutLocationId" groupid="schCarTransfers" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" >
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="InLocationId">In Location</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="InLocationId" groupid="schCarTransfers" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" >
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="DriverId">Driver</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="DriverId" groupid="schCarTransfers" argumentid="DriverId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'27'}]}" >
                            <option value="" selected="selected">Select Driver</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3" padding-bottom: 0px;">
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" >Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton" >Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
