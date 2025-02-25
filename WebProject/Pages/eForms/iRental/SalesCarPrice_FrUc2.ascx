<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesCarPrice_FrUc2" %>

<div class="container">
    <div class="alert alert-info mt-3" role="alert">
        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
    </div>

    <form>
        <!-- Brand -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  id="brand" class="form-select form-control-sm required" groupid="SalesCarsPriceForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                        <option value="" selected>Select Brand</option>
                    </select>
                    <label for="brand">Brand*</label>
                </div>
            </div>
        </div>

        <!-- Model -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  id="model" class="form-select form-control-sm required" groupid="SalesCarsPriceForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                        <option value="" selected>Select Model</option>
                    </select>
                    <label for="model">Model*</label>
                </div>
            </div>
        </div>

        <!-- Year -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  id="year" class="form-select form-control-sm required" groupid="SalesCarsPriceForm" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                        <option value="" selected>Select Year</option>
                    </select>
                    <label for="year">Year*</label>
                </div>
            </div>
        </div>

        <!-- Car Price -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" id="price" class="form-control form-control-sm text-center required number" maxlength="10" groupid="SalesCarsPriceForm" alphconf="{allow:'.'}" argumentid="Price" placeholder="Car Price">
                    <label for="price">Car Price*</label>
                </div>
            </div>
        </div>

        <!-- Comments -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <textarea id="comments" class="form-control form-control-sm" rows="3" argumentid="Comments" groupid="SalesCarsPriceForm" style="resize: none;" placeholder="Comments"></textarea>
                    <label for="comments">Comments</label>
                </div>
            </div>
        </div>

        <!-- Buttons -->
        <div class="row mt-2 justify-content-md-center mb-2">
            <div class="col-12 col-sm-2 col-lg-2">
                <input type="text" style="display: none" groupid="SalesCarsForm" argumentid="action" value="new" class="noautoreset" />
                <button type="button" id="onUpdate" class="btn btn-primary me-2 w-100 mb-2 DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true,GroupId:'SalesCarsForm'}">Save</button>
            </div>
            <div class="col-12 col-sm-2 col-lg-2">
                <button type="button" class="btn btn-secondary w-100 mb-2 CloseForm">Cancel</button>
            </div>
        </div>
    </form>
</div>
