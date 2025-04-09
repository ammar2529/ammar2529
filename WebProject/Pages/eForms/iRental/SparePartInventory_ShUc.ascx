<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventory_ShUc" %>

<div class="text-center">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ItemId" argumentid="ItemId" groupid="schSparePartInventory" placeholder="Enter Item ID">
                        <label for="ItemId">Item ID</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartSerialNo" argumentid="SparePartSerialNo" groupid="schSparePartInventory" placeholder="Enter Serial No">
                        <label for="SparePartSerialNo">Serial No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartName" argumentid="SparePartName" groupid="schSparePartInventory" placeholder="Enter Spare Part Name">
                        <label for="SparePartName">Spare Part Name</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="BrandId" groupid="schSparePartInventory" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D1">
                            <option value="" selected="selected">Select Brand</option>
                        </select>
                        <label for="BrandId">Brand</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="ModelId" groupid="schSparePartInventory" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
                            <option value="" selected="selected">Select Model</option>
                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select argumentid="StoreLocation" class="form-select form-select-sm dropdownlist" id="StoreLocation" groupid="schSparePartInventory" loadon="FirstVisible" name="D2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}">
                            <option selected="selected" value="">Select Store</option>
                        </select>
                        <label for="StoreLocation">Store Location</label>
                    </div>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <select class="form-select form-select-sm dropdownlist" id="PurchasingFrom" groupid="schSparePartInventory" argumentid="PurchasingFrom" name="D4">
                            <option value="" selected="selected">Select Purchasing From</option>
                            <option value="Geniune">GP</option>
                            <option value="China">LC</option>
                            <option value="Kuwait">LK</option>
                        </select>
                        <label for="PurchasingFrom">Purchasing From</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartRackfNo" argumentid="SparePartRackfNo" groupid="schSparePartInventory" placeholder="Enter Rack No">
                        <label for="SparePartRackfNo">Rack No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartShelfNo" argumentid="SparePartShelfNo" groupid="schSparePartInventory" placeholder="Enter Shelf No">
                        <label for="SparePartShelfNo">Shelf No</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="mb-3">
                        <label for="SparePartQuantityCheck" class="form-label" style="color: #000; font-size: 0.875rem;">Quantity</label>
                        <div class="d-flex">
                            <select class="form-select form-select-sm dropdownlist me-1" id="SparePartQuantityCheck" groupid="schSparePartInventory" argumentid="SparePartQuantityCheck" name="D5">
                                <option value="" selected="selected">< Or ></option>
                                <option value="LessThan">Less</option>
                                <option value="GreaterThan">Greater</option>
                            </select>
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartQuantity" argumentid="SparePartQuantity" groupid="schSparePartInventory" placeholder="Enter Quantity">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="mb-3">
                        <label for="SparePartUnitPriceCheck" class="form-label" style="color: #000; font-size: 0.875rem;">Unit Price</label>
                        <div class="d-flex">
                            <select class="form-select form-select-sm dropdownlist me-1" id="SparePartUnitPriceCheck" groupid="schSparePartInventory" argumentid="SparePartUnitPriceCheck" name="D5">
                                <option value="" selected="selected">< Or ></option>
                                <option value="LessThanP">Less</option>
                                <option value="GreaterThanP">Greater</option>
                            </select>
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="SparePartUnitPrice" argumentid="SparePartUnitPrice" groupid="schSparePartInventory" placeholder="Enter Unit Price">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button href="javascript:void(0);" class="btn btn-primary btn-sm me-2 search ViewButton" groupid="schSparePartInventory">Search</button>
                    <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset clearCheck ClearButton" groupid="schSparePartInventory">Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>



