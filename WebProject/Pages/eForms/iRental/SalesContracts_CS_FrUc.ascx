<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_CS_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_CS_FrUc" %>



<div class=" mt-5">
    <div class="row justify-content-center">
<%--        <div class="col-lg-12 col-md-10 col-sm-12 p-4 bg-light shadow rounded">--%>
            <!-- Instructional Note -->
            <div class="alert alert-info text-center mb-4">
                Use the form below to update the details. Fields marked with an asterisk (*) are mandatory.
            </div>

            <!-- Comments Field -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <label for="comments" class="fw-bold">Comments*:</label>
                </div>
                <div class="col-md-9">
                    <textarea id="comments" class="form-control" rows="6" groupid="Sales_Comments" argumentid="Comments"></textarea>
                    <!-- Hidden fields -->
                    <div style="display:none">
                        <span groupid="Sales_Comments" argumentid="RecId"></span>
                        <span groupid="Sales_Comments" argumentid="ParentRecId"></span>
                    </div>
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
<%--</div>--%>


<%-- <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                        <tr>
                              <td width="20%" class="ftitle" valign="top">
                              <nobr>Comments*:</nobr>
                            </td>
                            <td width="80%">
                             <div style="display:none"><span groupid="Sales_Comments" argumentid="RecId"></span></div>
                                    <div style="display:none"><span groupid="Sales_Comments" argumentid="ParentRecId"></span></div>
                              <textarea class="textarea" rows="6" wrap="1" cols="60" argumentid="Comments" groupid="Sales_Comments" ></textarea></td>
                        </tr>
                     
                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td>
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_Comments',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm CSCloseForm ButtonStyle">
                            </td>
                        </tr>
                    </table>--%>