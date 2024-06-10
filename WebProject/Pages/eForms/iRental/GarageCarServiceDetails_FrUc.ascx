<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GarageCarServiceDetails_FrUc" %>

<style type="text/css">
    . {
        height: 21px;
    }
</style>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="GarageCarServiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>

                      <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Service No:</nobr>
                    </td>
                    <td class="" >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="text-align: center; width: 75px;"  disabled="disabled" readonly="readonly" class="text   CommonDisableClass AlwaysDisable ElemDisabled "  argumentid="ServiceNo" />
                    </td>
                    <td class="ftitle" style="width: 170px">Invoice No.:</td>
                       <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass AlwaysDisable ElemDisabled "
                            groupid="GarageCarServiceDetails" disabled="disabled" readonly="readonly" argumentid="InvoiceNo" />
                    </td>
                  
                </tr>
            
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Date[Car Recived]:</nobr>
                    </td>
                    <td  >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarRecivedDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Engine No.:</td>
                             <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass  "
                            groupid="GarageCarServiceDetails" argumentid="EngineNo" />
                    </td>
                  
                </tr>


                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td >
                        <input type="hidden" name="RecId" groupid="GarageCarServiceDetails" argumentid="RecId" />

                   
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="30" class="LOVPopup text  CommonDisableClass  "
                                groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="ChassisNo"   />
                        </div>
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                     <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="GarageCarServiceDetails" argumentid="CustomerRecCode"></span>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Car No:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarNumber"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="GarageCarServiceDetails" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="BrandId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="ModelId"></span>
                    </td>
                   <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Color"></span>
                    </td>
                     <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type</nobr>
                    </td>
                    <td class="" >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="TypeId"></span>
                    </td>
                    <td class="ftitle"></td>
                             <td style="text-align: center" class="">
                        <span class="ftitle" style="font-size: 16px;" groupid="GarageCarServiceDetails" argumentid="CarOwnerName"></span>
                    </td>
                  
                </tr>

             
                   <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Last Service Date:</nobr>
                    </td>
                    <td  >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="LastServiceDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Last Service KM.:</td>
                             <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass  "
                            groupid="GarageCarServiceDetails" argumentid="LastServiceKM" />
                    </td>
                  
                </tr>

                
                   <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Date[Car to be Deliverd]:</nobr>
                    </td>
                    <td  >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarToBeDeliverdDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Date[Car Deliverd]:</td>
                             <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarDeliverdDate" />
                    </td>
                  
                </tr>
               
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>
               
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Problem:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;" argumentid="Problem" groupid="GarageCarServiceDetails"></textarea>
                       </td>
       
    </tr>

                   
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Action Taken:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;" argumentid="ActionTaken" groupid="GarageCarServiceDetails"></textarea>
                       </td>
       
    </tr>

                        
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Car Condition:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;" argumentid="CarCondition" groupid="GarageCarServiceDetails"></textarea>
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
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:true, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                             

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>



</table>
