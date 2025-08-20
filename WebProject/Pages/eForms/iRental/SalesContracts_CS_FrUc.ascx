<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_CS_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_CS_FrUc" %>




<div class="mt-2" style="border: 0.5px solid #ede5e5; border-radius: 7px;">
    <div class="card">
        <div class="card-body">


            <div class="row">
                <div class="col-sm-12">
                    <!-- Comments Field -->


                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Comments" id="paymentCommentscmt" rows="4"
                                    groupid="Sales_Comments" argumentid="Comments"></textarea>
                                <label for="paymentCommentscmt">Comments*</label>
                            </div>
                        </div>

                        <!-- Hidden fields -->
                        <div style="display: none">
                            <span groupid="Sales_Comments" argumentid="RecId"></span>
                            <span groupid="Sales_Comments" argumentid="ParentRecId"></span>
                        </div>
                    </div>


                    <!-- Action Buttons -->
                    <div class="row justify-content-center">
                        <!-- Save Button -->
                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 d-flex justify-content-end mb-3">
                            <button type="button" class="btn btn-primary DataAction w-100"
                                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_Comments',HideOnSuccess:true}">
                                Save
                            </button>
                        </div>

                        <!-- Cancel Button -->
                        <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3  d-flex justify-content-start mb-3">
                            <button type="button" class="btn btn-secondary CloseForm CSCloseForm w-100">
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


