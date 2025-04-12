<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarAndCustomerDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarAndCustomerDetails_FrUc" %>

<script src="../../../Scripts/eForms/iRental/frmCarAndServiceDetails.js"></script>



<%--<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="CarAndCustomersDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">


                <tr>
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                            <tr class="StatusTR">
                                <td class="ftitle" style="width: 20%">
                                    <nobr>Contract No.:</nobr>
                                </td>
                                <td class="ftitle" style="width: 30%">
                                    <span class="ftitle" style="color: red;" groupid="CarAndCustomersDetails" argumentid="RecCode">New contract no. will be generated on saving</span>
                                </td>
                                <td class="ftitle" style="width: 20%">
                            
                                </td>
                                <td class="ftitle" style="width: 30%">


                                    <div style="display: none">
                                        <span groupid="CarAndCustomersDetails" argumentid="StateId"></span>

                                    </div>

                                </td>
                            </tr>

                            <tr>

                                <td class="ftitle" style="width: 20%">
                                    <nobr>Car For*:</nobr></td>
                                <td class="ftitle RadioButtons" style="width: 30%">

                                    <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Sales " default="default" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" /><label>Sales</label>
                                    <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Rental" value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" /><label>Rental</label>
                                    <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Lease " value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" /><label>Lease</label>


                                </td>
                                <td style="width: 20%"></td>
                                <td style="width: 30%"></td>
                            </tr>

                            <tr>
                                <td class="ftitle">
                                    <nobr>Car No.:</nobr>
                                </td>
                                <td>
                                    <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="RecId" />
                                    <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="CsRecId" />

                                    <input type="hidden" name="CarAndCustomersDetailsRecId" groupid="CarAndCustomersDetails" argumentid="CarAndCustomersDetailsRecId" />




                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required  CommonDisableCarNumber "
                                        groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForSales" argumentid="CarNumber" />

                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display: none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                        groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForRental" argumentid="CarNumber" />

                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display: none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                        groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForLease" argumentid="CarNumber" />



                          
         
                                </td>
                                <td class="ftitle" style="width: 140px">
                                    <nobr>Customer Code*:</nobr></td>
                                <td>
                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text   CommonDisableCarNumber"
                                        groupid="CarAndCustomersDetails" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr=' *Required' />

                                </td>
                            </tr>






                            <tr>
                                <td class="ftitle">
                                    <nobr>Chassis No.:</nobr>
                                </td>
                                <td>

                                    <span class="ftitle CommonDisable ChassisNo" groupid="CarAndCustomersDetails" argumentid="ChassisNo"></span>


                                </td>
                                <td class="ftitle">
                                    <nobr>Name:</nobr>
                                </td>
                                <td style="text-align: center">
                                    <span class="ftitle CommonDisable" style="font-size: 16px;" groupid="CarAndCustomersDetails" argumentid="CustomerName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Brand:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Brand"></span>

                                </td>
                                <td class="ftitle">
                                    <nobr>Nationality:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="Nationality"></span>
                                    <input type="hidden" groupid="CarAndCustomersDetails" argumentid="NationalityID" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Model:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Model"></span>
                           
                                </td>
                                <td class="ftitle">
                                    <nobr>National ID No.:</nobr>
                                </td>
                                <td>
                                    <div style="float: left; width: 135px" class="ftitle CommonDisable NationalIDNo" groupid="CarAndCustomersDetails" argumentid="NationalIDNo"></div>
                                    <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="NationalIDExpiryDate"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Year:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="CarYear"></span>
                           
                                </td>
                                <td class="ftitle">
                                    <nobr>Gender:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="Gender"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Color:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Color"></span>
                           
                                </td>
                                <td class="ftitle">
                                    <nobr>Mobile Telephone:</nobr>
                                </td>
                                <td class="ftitle">
                                    <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="MobileTelephone1"></span>

                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Type:</nobr>
                                </td>
                                <td class="">
                                    <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Type"></span>

                                </td>
                                <td class="ftitle"></td>
                                <td></td>



                            </tr>

                        </table>
                    </td>
                </tr>


                <tr class="hideTr">
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">



                            <tr class="hideTr">

                                <td class="ftitle" style="width: 20%">
                                    <nobr>Full Insurance:</nobr></td>
                                <td style="width: 30%">
                                    <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="FullInsuranceCompanyId"></span>
                                </td>
                                <td style="width: 20%"></td>
                                <td style="width: 30%"></td>
                            </tr>



                            <tr class="hideTr">
                                <td>

                                    <nobr class="ftitle">Policy No.</nobr>
                                </td>

                                <td>
                                    <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="FullInsurancePolicyNo"></span>
                                </td>

                                <td></td>
                                <td></td>
                            </tr>

                            <tr class="hideTr">
                                <td>
                                    <nobr class="ftitle ">Expiry Date (dd/mm/yyyy)</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsuranceExpiry"></span>
                                </td>
                                <td></td>
                                <td></td>

                            </tr>

                           

                        </table>
                    </td>
                </tr>

                <tr class="hideOnSales">
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                            <tr>


                                <td class="ftitle">
                                    <nobr>Contract Date:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="ContractDate"></span>

                                <td class="ftitle">

                                </td>
                                <td>



                                </td>
                            </tr>

                                        <tr>
                                            <td class="ftitle" style="width: 20%">
                                                <nobr>Engine Warranty - KM:</nobr></td>
                                            <td style="width: 30%">
                                             
                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="EngineWarranty"></span>
                                            </td>
                                            <td class="ftitle" style="width: 20%">
                                                <nobr>Years: </nobr>
                                            </td>
                                            <td style="width: 30%">
                                               

                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="EnginYearsWarranty"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="ftitle">
                                                <nobr>Gear Warranty - KM:</nobr>
                                            </td>
                                            <td>
                                           

                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="GearWarranty"></span>
                                            </td>
                                            <td class="ftitle">
                                                <nobr>Years:</nobr>
                                            </td>
                                            <td>
                                              
                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="GearYearsWarranty"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="ftitle">
                                                <nobr>Car Warranty - KM:</nobr>
                                            </td>
                                            <td>
                                         

                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="CarWarranty"></span>
                                            </td>
                                            <td class="ftitle">
                                                <nobr>Years:</nobr>
                                            </td>
                                            <td>
                                          
                                                <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="CarYearsWarranty"></span>
                                            </td>
                                        </tr>




                                    </table>
                             
                </tr>



                <tr>
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
                            <tr>
                                <td colspan="4">



                                    <div style="width: 100%;">

                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="CustomerModifyListt">
                                            <thead>
                                                <tr>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Code</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 30%">Customer Name</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Nationality</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">National ID No</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Mobile</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Created Date</th>
                                                    <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Created By</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr class="ItemTRR">
                                                </tr>

                                            </tbody>
                                            <tfoot>
                                                <tr class="NoRecordsTR">

                                                    <td class="NoRecords w-grid-norecords-msg" colspan="7">
                                                        <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                                    </td>
                                                </tr>

                                            </tfoot>

                                        </table>
                                    </div>



                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>

 

                <tr>
                    <td colspan="4" style="text-align: center;">



                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:true, Requery:true,GroupId:'CarAndCustomersDetails'}" />
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:false, Requery:false,GroupId:'CarAndCustomersDetails'}" />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>



</table>--%>
