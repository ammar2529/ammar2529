<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_CS_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_CS_FrUc2" %>

<div class=" mt-3">

                    <div class="card">
                    <div class="card-body">
                        <div class="row mb-2">
                            <div class="col-sm-12 ">
                                <div class="form-header">

                                    <span class=" h5 fw-bold ink-bar">Search</span>
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


    <!-- Comments Field -->
    <div class="row mb-3">
        <label for="Comments" class="col-md-2 col-form-label">Comments *</label>
        <div class="col-md-10">
            <!-- Hidden Fields -->
            <div style="display: none;">
                <span groupid="Rental_Comments" argumentid="RecId"></span>
            </div>
            <div style="display: none;">
                <span groupid="Rental_Comments" argumentid="ParentRecId"></span>
            </div>
            <!-- Textarea -->
            <textarea id="Comments" class="form-control" rows="6" groupid="Rental_Comments" argumentid="Comments"></textarea>
        </div>
    </div>

    <!-- Spacer -->
    <div class="row mb-3">
        <div class="col-12">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" alt="">
        </div>
    </div>

    <!-- Buttons -->
    <div class="row mb-3">
        <div class="col-md-10 offset-md-2">
            <button type="button" class="btn btn-primary DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts_Comments',HideOnSuccess:true}">
                Save
            </button>
            <button type="button" class="btn btn-secondary CloseForm ButtonStyle">
                Cancel
            </button>
        </div>
    </div>
                            </div>
                        </div>
                    </div>
                </div>
    <!-- Note Section -->

</div>
