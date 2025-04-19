<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarRateDetails_FrUc2" %>

<div class="">

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Rate Management</span>
                        <i class="fa-regular fa-rectangle-xmark CloseForm"
                            tabid="CloseBtn" title="Close Form"
                            style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                            onmouseover="this.style.color='red';"
                            onmouseout="this.style.color='black';"></i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="row my-3 justify-content-md-center">
                        <div class="alert alert-info mt-3" role="alert">
                            Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <div style="display: none"><span groupid="CarsRateForm" argumentid="RecId"></span></div>
                                <select class="form-select form-select-sm dropdownlist required" id="RateTypeId" groupid="CarsRateForm"
                                    argumentid="RateTypeId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'26'}]}">
                                    <option value="" selected="selected">Select Rate Type</option>
                                </select>
                                <label for="RateTypeId">Rate Type*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="CRDBrandId" groupid="CarsRateForm"
                                    argumentid="BrandId" childcombo="ModelId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'2'}]}">
                                    <option value="" selected="selected">Select Brand</option>
                                </select>
                                <label for="CRDBrandId">Brand*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="ModelId" groupid="CarsRateForm"
                                    argumentid="ModelId"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'3'}, {SPParamName:'SubParentTypeId', Name:'BrandId'}]}">
                                    <option value="" selected="selected">Select Model</option>
                                </select>
                                <label for="ModelId">Model*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="CarYear" groupid="CarsRateForm"
                                    argumentid="CarYear" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'4'}]}">
                                    <option value="" selected="selected">Select Year</option>
                                </select>
                                <label for="CarYear">Year*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required number" id="Rate"
                                    placeholder="Daily Rental Rate (KD)*" groupid="CarsRateForm" maxlength="10" alphconf="{allow:'.'}">
                                <label for="Rate">Daily Rental Rate (KD)*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required number" id="AllowedKM"
                                    placeholder="Daily Mileage (KM) Limit*" groupid="CarsRateForm" maxlength="10">
                                <label for="AllowedKM">Daily Mileage (KM) Limit*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required number" id="ExtraKMRate"
                                    placeholder="Rate/KM (Extra Mileage)*" groupid="CarsRateForm" maxlength="10" alphconf="{allow:'.'}">
                                <label for="ExtraKMRate">Rate/KM (Extra Mileage)*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-6 col-lg-4">
                            <label>Is Disabled:</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="IsDisable" id="IsDisableNo" value="0" groupid="CarsRateForm" argumentid="IsDisable" checked>
                                <label class="form-check-label" for="IsDisableNo">No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="IsDisable" id="IsDisableYes" value="1" groupid="CarsRateForm" argumentid="IsDisable">
                                <label class="form-check-label" for="IsDisableYes">Yes</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center mb-2">
                        <div class="col-12 col-sm-6 col-lg-2">
                            <button type="button" class="btn btn-primary w-100 DataAction"
                                conf="{ActorId:'DataHelper', ActionId:'DataAction', Command:'UPD_iRental_Cars_Rates', HideOnSuccess:true}">
                                Save</button>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-2">
                            <button type="button" class="btn btn-secondary w-100 CloseForm">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</div>
