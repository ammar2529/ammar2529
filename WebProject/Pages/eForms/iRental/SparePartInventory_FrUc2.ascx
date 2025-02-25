<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventory_FrUc2" %>

<div class="container">
    <!-- Note -->
    <div class="alert alert-info mt-3" role="alert">
        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
    </div>
                <div style="display: none"><span groupid="SparePartInventoryForm" argumentid="RecId"></span>
                <input type="hidden"groupid="SparePartInventoryForm" argumentid="UserName"  />
              <input type="hidden" groupid="SparePartInventoryForm" argumentid="FileGuid" readonly="readonly" />

            </div>
    
        <!-- Purchasing From -->
 <div class="row mt-2 justify-content-md-center">
             <div class="col-12 col-sm-6 col-lg-2 ">
            <label for="floatingKM">
                <small><b>Purchasing From*:</b></small>
            </label>
        </div>
    <div class="col-12 col-sm-6 col-lg-4">
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="gp" value="Geniune" name="PurchasingFrom" groupid="SparePartInventoryForm" argumentid="PurchasingFrom">
            <label class="form-check-label" for="gp">GP</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="lc" value="China" name="PurchasingFrom" groupid="SparePartInventoryForm" argumentid="PurchasingFrom">
            <label class="form-check-label" for="lc">LC</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="lk" value="Kuwait" name="PurchasingFrom" groupid="SparePartInventoryForm" argumentid="PurchasingFrom">
            <label class="form-check-label" for="lk">LK</label>
        </div>
    </div>
</div>


        <!-- System ID -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="SystemId" placeholder="System ID" groupid="SparePartInventoryForm" argumentid="SystemId" disabled readonly>
                    <label for="SystemId">System ID*</label>
                </div>
            </div>
        </div>

        <!-- Item ID -->
    <div class="row mt-2 justify-content-md-center">
        <div class="col-12 col-sm-6 col-lg-4">
            <div class="form-floating">
                <input type="text" class="form-control form-control-sm" id="ItemId" placeholder="Item ID" groupid="SparePartInventoryForm" argumentid="ItemId">
                <label for="ItemId">Item ID*</label>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-lg-2">

            <button type="button" class="btn btn-secondary mt-2 GenerateItemIDBtn DataAction" ignorevalidate="ItemId SparePartSerialNo SparePartName SparePartQuantity BrandId ModelId StoreLocation" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{DBAction:'GenerateNewItemId'},Command:'SEL_iRental_SparePartInventory',HideOnSuccess:false,Requery:false,ShowActionMsg:false,GroupId:'SparePartInventoryForm'}">Generate ItemID</button>
        </div>
    </div>

        <!-- Item Code -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="ItemCode" placeholder="Item Code" groupid="SparePartInventoryForm" argumentid="SparePartSerialNo">
                    <label for="ItemCode">Item Code*</label>
                </div>
            </div>
        </div>

        <!-- Description -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="Description" placeholder="Description" groupid="SparePartInventoryForm" argumentid="SparePartName">
                    <label for="Description">Description*</label>
                </div>
            </div>
        </div>

        <!-- Brand -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  class="form-select form-control-sm" id="Brand" groupid="SparePartInventoryForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                        <option value="" selected>Select Brand</option>
                    </select>
                    <label for="Brand">Brand*</label>
                </div>
            </div>
        </div>

        <!-- Model -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  class="form-select form-control-sm" id="Model" groupid="SparePartInventoryForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                        <option value="" selected>Select Model</option>
                    </select>
                    <label for="Model">Model*</label>
                </div>
            </div>
        </div>

        <!-- Store -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select loadon="FirstVisible"  class="form-select form-control-sm" id="Store" groupid="SparePartInventoryForm" argumentid="StoreLocation" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}">
                        <option value="" selected>Select Store</option>
                    </select>
                    <label for="Store">Store*</label>
                </div>
            </div>
        </div>

        <!-- Rack No. -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="RackNo" placeholder="Rack No." groupid="SparePartInventoryForm" argumentid="SparePartRackfNo">
                    <label for="RackNo">Rack No.</label>
                </div>
            </div>
        </div>

        <!-- Shelf No. -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="ShelfNo" placeholder="Shelf No." groupid="SparePartInventoryForm" argumentid="SparePartShelfNo">
                    <label for="ShelfNo">Shelf No.</label>
                </div>
            </div>
        </div>

        <!-- Quantity -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="Quantity" placeholder="Quantity" groupid="SparePartInventoryForm" argumentid="SparePartQuantity">
                    <label for="Quantity">Quantity*</label>
                </div>
            </div>
        </div>

        <!-- Unit Price -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="UnitPrice" placeholder="Unit Price" groupid="SparePartInventoryForm" argumentid="SparePartUnitPrice">
                    <label for="UnitPrice">Unit Price*</label>
                </div>
            </div>
        </div>

        <!-- Cost Price -->
        <div class="row mt-2 justify-content-md-center" runat="server" roles="Show_SparePart_Cost_Price">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="CostPrice" placeholder="Cost Price" groupid="SparePartInventoryForm" argumentid="SparePartCostPrice">
                    <label for="CostPrice">Cost Price</label>
                </div>
            </div>
        </div>

        <!-- Search Order No. -->
        <div class="row mt-2 justify-content-md-center">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="SearchOrderNo" placeholder="Search Order No." groupid="SparePartInventoryForm" argumentid="SearchOrderNo">
                    <label for="SearchOrderNo">Search Order No.</label>
                </div>
            </div>
        </div>

         <div class="row mt-2 justify-content-md-center">
        <div class="col-12 col-sm-6 col-lg-3">
<%--            <label for="imageUpload" class="form-label">Image:</label>--%>
            <div class="input-group mb-3">
                <input type="file" class="form-control file-input" id="imageUpload" accept="image/png, image/jpeg, image/gif" groupid="SparePartInventoryForm" argumentid="SparePartImage">
                <button class="btn btn-outline-secondary upload-button CommonDisableClass" type="button">Upload</button>
            </div>
 
        </div>
                     <div class="col-12 col-sm-6 col-lg-3">

            <div class="image-container">
                <img height="130" class="thumbnail" src="../../../App_Themes/Blue/images/default_image.png" id="thumbnail" width="130" />
                <button type="button" class="btn btn-outline-danger btn-sm delete-button">X</button>
            </div>
        </div>
    </div>

    <!-- Buttons -->
    <div class="row mt-2 justify-content-md-center mb-2">
        <div class="col-12 col-sm-2 col-lg-2">
            <input type="text" style="display: none" groupid="SparePartInventoryForm" argumentid="action" value="new" class="noautoreset" />
            <button type="button" class="btn btn-secondary w-100 mb-2 EditInventory">Edit</button>
        </div>
        <div class="col-12 col-sm-2 col-lg-2">
            <button type="button" class="btn btn-primary w-100 mb-2 DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SparePartInventory',HideOnSuccess:true}">Save</button>
        </div>
        <div class="col-12 col-sm-2 col-lg-2">
            <button type="button" class="btn btn-secondary w-100 mb-2 CloseForm">Cancel</button>
        </div>
    </div>
</div>