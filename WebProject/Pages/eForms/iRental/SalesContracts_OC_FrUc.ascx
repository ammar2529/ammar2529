<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_OC_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_OC_FrUc" %>

<div class="mt-2" style="border: 0.5px solid #ede5e5; border-radius: 7px;">
    <div class="card" >
        <div class="card-body">


            <div class="row">
                <div class="col-sm-12">

                    <!-- Description Field -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-floating mb-3">
                                <textarea id="descriptioninsalespayment" class="form-control" rows="6" groupid="Sales_OtherCharges" argumentid="Description" placeholder="Description*"></textarea>
                                <label for="descriptioninsalespayment">Description*</label>
                            </div>
                            <div style="display: none">
                                <span groupid="Sales_OtherCharges" argumentid="RecId"></span>
                            </div>
                            <div style="display: none">
                                <span groupid="Sales_OtherCharges" argumentid="ParentRecId"></span>
                            </div>
                        </div>
                    </div>

                    <!-- Amount Field -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-floating mb-3">
                                <input id="chargesinsalespayment" type="text" class="form-control  number" maxlength="100" groupid="Sales_OtherCharges" alphconf="{allow:'.'}" argumentid="AdditionalAmount" placeholder="Amount*">
                                <label for="chargesinsalespayment">Amount*</label>
                            </div>
                        </div>
                    </div>



                    <!-- Action Buttons -->
                    <div class="row justify-content-center">
                        <!-- Save Button -->
                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 mb-2">
                            <button type="button" class="btn btn-primary SaveBtn DataAction w-100" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_AdditionalAmount',HideOnSuccess:true}">
                                Save
                            </button>
                        </div>

                        <!-- Cancel Button -->
                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 mb-2">
                            <button type="button" class="btn btn-secondary CloseForm w-100">
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>









