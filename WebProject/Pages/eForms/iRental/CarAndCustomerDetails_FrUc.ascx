<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarAndCustomerDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarAndCustomerDetails_FrUc" %>

<script src="../../../Scripts/eForms/iRental/frmCarAndServiceDetails.js"></script>

<%-- <style>
        .hidden {
            display: none;
        }
    </style>--%>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="CarAndCustomersDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>

        

                          <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Car For*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="CommonDisableClass ElemDisabled Sales " default="default" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" /><label>Sales</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled  Rental" value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Rental</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled Lease " value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Lease</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled Other " value="Other" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Other</label>


    <%--                    
     <input type="radio" class="CommonDisableClass ElemDisabled Sales" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Sales</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Rental" value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Rental</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Lease" value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Lease</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Other" value="Other" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Other</label>--%>

                    </td>
                              <td></td>
                              <td></td>
                              </tr>

                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Car No.:</nobr>
                    </td>
                    <td >
                        <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="RecId" />

<%--    <div class="carPopupCutomerAndCarDetails hidden"></div>--%>
                   
                      
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber "
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForSales" argumentid="CarNumberdu" />
            
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForRental" argumentid="CarNumber" />
                     
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForLease" argumentid="CarNumber" />
                 
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForOther" argumentid="CarNumber" />

                          
         
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                     <td style="text-align: center">
                         <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text  CommonDisable"
                            groupid="CarAndCustomersDetails" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr=' *Required'  />
                        
<%--                         <span class="ftitle" style="font-size: 12px;" groupid="CarAndCustomersDetails" argumentid="CustomerRecCode"></span>--%>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td >
<%--                        <span class="ftitle" groupid="CarAndCustomersDetails" argumentid="CarNumber"></span>--%>
                     <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="ChassisNo"></span>

                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="CarAndCustomersDetails" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td >
                        <span class="ftitle " groupid="CarAndCustomersDetails" argumentid="BrandId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle " groupid="CarAndCustomersDetails" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="CarAndCustomersDetails" argumentid="ModelId"></span>
                    </td>
                   <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle " groupid="CarAndCustomersDetails" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="CarAndCustomersDetails" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="Color"></span>
                    </td>
                     <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td class="" >
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="TypeId"></span>
                    </td>
                      <td class="ftitle">
                                <nobr></nobr>
                            </td>
                            <td>
                                
                                 
                                  
                                </td>

                 
                  
                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>


                <tr>
                    <td>  <nobr class="ftitle "><nobr>Full Insurance:</nobr> 
</td>
                    <td>
                         <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsuranceCompanyId"></span>
                    </td>
                    <td>
                        
                          
                    </td>
                    <td>
                 
                    </td>
                </tr>
         
                      <tr>
                     <td>
                        
                          <nobr class="ftitle">Policy No.</nobr> 
                    </td>
                   
                     <td>
                      <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsurancePolicyNo"></span>
                    </td>

                    <td>
                        
                          
                    </td>
                    <td>
                     
                    </td>
                </tr>

                <tr>
                         <td>  <nobr class="ftitle ">Expiry Date (dd/mm/yyyy)</nobr> 
                        </td>
                       <td>
                         <span class="ftitle v" groupid="CarAndCustomersDetails" argumentid="FullInsuranceExpiry"></span>
                    </td>

                </tr>

              <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                       
                       
                    
                        <div style="padding-top: 10px; padding-bottom: 10px">
                             <%--<input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle SalesButton_Edit" />--%>
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:true, Requery:true,GroupId:'CarAndCustomersDetails'}" />
                             

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>



</table>
