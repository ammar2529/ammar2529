<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventoryInvoice_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventoryInvoice_FrUc" %>


<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<script src="../../../Scripts/eForms/iRental/frmInvoicePaymentDetails.js"></script>

<style>
    

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    text-align: center;
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>

          <!-- The Popup Modal -->
                <div id="popupModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>Functionality is still in progress.</p>
                    </div>
                </div>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTableInvoice">

       <tr>
        <td style="padding-top: 0px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="InvoiceDetails">
                    <div>Invoice Details </div>
                </li>
                <li tabid="InvoicePaymentDetails" style="border-right: 1px solid #8298B0;">
                    <div>Payment Details </div>
                </li>

            </ul>
        </td>
    </tr>
    <tr tabid="InvoiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

               <tr id="trNote">
             <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
             </tr>
               <%--  <tr class="hideCarandService">
                     <td class="ftitle">
                        <nobr>Service Status:</nobr>

                    </td>
                    <td>
                       
                      <span class="ftitle" style="font-size: 12px;" groupid="SparePartInventoryInvoice" argumentid="ServiceState"></span>
                        
                         
                 </td>

                      <td class="ftitle" width="20%">
                        <nobr>Date:</nobr>
                          </td>
                    <td class="ftitle" width="30%">
                        

                        
                        <input argumentid="InvoiceDate" class="text  date DisableOnClose CommonDisableClass  " groupid="SparePartInventoryInvoice" maxlength="10" style="width: 75px;" type="text" /></td>
                </tr>--%>

                                <tr class="StatusRow">
                     <td class="ftitle">
                        <nobr>Invoice No.:</nobr>

                    </td>
                    <td>
                       
                      <span class="ftitle" style="font-size: 12px;" groupid="SparePartInventoryInvoice" argumentid="InvRecCode"></span>
                         <input type="hidden" name="RecId" groupid="SparePartInventoryInvoice" argumentid="RecId" />
                           <input type="hidden" name="InvoiceRecId" groupid="SparePartInventoryInvoice" argumentid="InvoiceRecId" />
                        <%--<input type="hidden" name="InvRecId"  argumentid="InvRecId" groupid="SparePartInventoryInvoice"/>--%>
                       
                 </td>

                      <td class="ftitle" width="20%">
                        <nobr>Invoice Status:</nobr>
                    </td>
                    <td class="ftitle" width="30%">
                        <span class="ftitle" groupid="SparePartInventoryInvoice" argumentid="StateName"></span>

                        <div style="display: none">
                        <span groupid="SparePartInventoryInvoice" argumentid="StateId"></span>

                        </div>
                        </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Invoice For:</nobr>

                    </td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="   ServiceInvoice  " checked="checked" default="default" value="ServiceInvoice" name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails" /><label>Service Invoice</label>
                        <input type="radio" class="  PartsInvoice  " value="PartsInvoice" name="InvoiceDetails" groupid="SparePartInventoryInvoice" argumentid="InvoiceDetails" /><label>Parts Invoice </label>
                    </td>

                    <td class="ftitle" width="20%">
                        <nobr>Invoice Date:</nobr>

                    </td>
                    <td class="ftitle" width="30%">

                        <input argumentid="InvoiceDate" class="text  date DisableOnClose CommonDisableClass  CommonDisableClasss" groupid="SparePartInventoryInvoice" maxlength="10" style="width: 75px;" type="text" /></td>

                </tr>

                <tr class="serv">
                    <td class="ftitle">
                        <nobr>Invoice Type:</nobr>

                    </td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="   CashInvoice  InvoiceTypeCommon" checked="checked" default="default" value="CashInvoice" name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType" /><label>Cash</label>
                        <input type="radio" class="  WarrentyInvoice InvoiceTypeCommon " value="WarrantyInvoice" name="InvoiceType" groupid="SparePartInventoryInvoice" argumentid="InvoiceType" /><label>Warranty </label>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                      <tr>
                    <td class="ftitle">
                        <nobr class="cust">Customer RecCode *:</nobr>
                        <nobr class="serv">Service No.*:</nobr>
                    </td>
                    <td>
                    
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text  CommonDisableClass CommonDisableClasss "
                            groupid="SparePartInventoryInvoice" lovpopupid="customerInvoicePopup" argumentid="CustomerRecCode" requirederr=' *Required'  />

                       <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisableClass  CommonDisableClasss"
                         groupid="SparePartInventoryInvoice" lovpopupid="carPopupGarageForInvoice" argumentid="ServiceNo"   requirederr=' *Required'/>

                    </td>
                         

                   
                    <td class="ftitle">
                        <nobr class="serv">Service Date:</nobr></td>
                    <td>
                        

                        <span class="ftitle serv" groupid="SparePartInventoryInvoice" argumentid="DateCreated"></span>
                    </td>

                </tr>
                            <tr class="hideCarandService">
   
                  <td class="ftitle">
      <nobr>Car No:</nobr>
  </td>
  <td >
      <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="CarNumber"></span>
  </td>

   
                <td class="ftitle">
          <nobr>Year:</nobr>
                    </td>
                  <td style="text-align: left">
                   <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="CarYear"></span>

                  </td>
            </tr>

                   <tr class="hideCarandService">

   
                       <td class="ftitle">
                <nobr>Brand:</nobr>
            </td>
            <td >
                <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="Brand"></span>
              
            </td>
   
    <td class="ftitle">
          <nobr>Model:</nobr></td>
   
       <td class="ftitle">
            
           <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="Model"></span>
   
</td>

    
</tr>

                <tr class="hideCarandService">
     <td colspan="4">
         <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
     </td>
 </tr>
                             

                <tr class="hideTrForINVCust">
                   
                     <td class="ftitle">
                      
                        <nobr class="serv">Customer RecCode</nobr></td>
                    <td class="ftitle">
                    

                       <input readonly type="text" class="ftitle CommonSPCust serv" style="display: inline-block;font-size: 15px;background: transparent;color: rgb(98, 130, 150);
                        outline: none;border: none;color: #628296;cursor: context-menu;font-size: 11px;font-weight: bold;"
                           groupid="SparePartInventoryInvoice" argumentid="SICustomerRecCode" />

                    </td>

                   
                      <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td class="ftitle">
                          <div style="float: left; width: 135px" class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="NationalIDNo"></div>
                    <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="NationalIDExpiryDate"></span>
               
                    </td>
                   
                   
                </tr>

                <tr class="hideTrForINVCust">

                     <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: left" >
                        <span class="ftitle CommonSPCust" style="font-size: 16px;" groupid="SparePartInventoryInvoice" argumentid="CustomerName"></span>
                    </td>

                   

                 <td  class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                        </td>
                    <td >
                                 <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="MobileTelephone1"></span>
       <%--  <nobr class="CommaM12">, </nobr>--%>
         <span class="ftitle CommonSPCust" groupid="SparePartInventoryInvoice" argumentid="MobileTelephone2"></span>
                        </td>
                        


                </tr>
           

              

             
                           
                


                <tr class="hideCarandService">

                    <td class="ftitle">
                        <nobr>In KM:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonSPINv" groupid="SparePartInventoryInvoice" argumentid="CurrentServiceKm"></span>
                    </td>


                    <td class="ftitle">
                        
                    </td>
                    <td style="text-align: left">
                        

                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <!-- New row with labels and 8 columns starts here -->
                <tr class="LineOfItemRow">
                    <td colspan="4">
                        <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table" id="dynamicRows">
                            <tr>
                                <td class="ftitle">
                                    <label for="column1">Item ID</label></td>
                                <td class="ftitle">
                                    <label for="column2">Item Code</label></td>
                                <td class="ftitle">
                                    <label for="column3">Description</label></td>
                                <td class="ftitle">
                                    <label for="column4">Qty'AVL</label></td>
                                <td class="ftitle">
                                    <label for="column5">QTY</label></td>
                                <td class="ftitle">
                                    <label for="column7">Unit Price</label></td>
                                <td class="ftitle">
                                    <label for="column8">Total Price</label></td>
                                 <td class="ftitle"><label for="column9">Actions</label></td> <!-- Actions column -->

                            </tr>
                            <tr class="trNoDynamic">

                                <td style="display: none">
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="InvRecId" disabled="disabled" />

                                </td>
                                <td>
                                   <%-- <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC ItemIdClass number CommonDisableClass  "
                                        groupid="SparePartInventoryInvoice" argumentid="ItemId" />--%>


                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text ItemIdClass  CommonDisableClass ElemDisabled "
                                    groupid="SparePartInventoryInvoice" lovpopupid="ItemCodePopup" argumentid="ItemId"   />
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartSerialNo" disabled="disabled" />

                                <%--    
                                <input type="text" style="text-align: center; width: 80px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text  CommonDisableClass ElemDisabled "
                                 groupid="SparePartInventoryInvoice" lovpopupid="ItemCodePopup" argumentid="SparePartSerialNo"  />--%>
                                </td>


                                <td>
                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text  ElemDisabled"
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartName"  disabled="disabled"/>
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text ElemDisabled number "
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" disabled="disabled"/>
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold; " maxlength="10" class="text CommonDisableClass SelectQuantity "
                                        groupid="SparePartInventoryInvoice" argumentid="SelectQuantity" />
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text ElemDisabled number CommonDisableClass "
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice" />
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold; " maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="TotalPrice" disabled="disabled"/>

                                </td>
                                <%--<td> display none </td>--%>
                                <td style="display:none">
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold; " maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="StoreLocationID" disabled="disabled"/>

                                </td>

                                <td style="display: none">
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartRackfNo" disabled="disabled" />

                                </td>

                                <td style="display: none">
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="SparePartShelfNo" disabled="disabled" />

                                </td>

                         
                                <td style="display: none">
                                    <input type="text" style="text-align: center; width: 80px; font-weight: bold;" maxlength="10" class="text ElemDisabled "
                                        groupid="SparePartInventoryInvoice" argumentid="PurchasingFrom" disabled="disabled" />

                                </td>


                                <%--<td> display none </td>--%>
                                 <td><button type = "button" recid="recId" class="SaveBtn">Save</button></td> <!-- Delete button -->

                            </tr>


                     
                        </table>


                    </td>

                  

                </tr>
           

                        <tr>
                    <td colspan="4">

                      
                      
               

                        <input type="hidden" groupid="SparePartInventoryInvoice" argumentid="FileGuid" readonly="readonly" />
                        <input type="hidden" groupid="SparePartInventoryInvoice" name="ChassisNo" argumentid="ChassisNo"  />

                        <%-- Data Grid  --%>
                        <%--<div style="width: 100%;" class=" CommonDisableClasss">
                        <table cellspacing:"0" cellpadding:"0" border="0" style: 5%; style="width:100%;"  text-align: left" class="uploadedItemList">
                            <tbody>
                                <tr class="HeaderTR">
                                    <td class="Header w-grid-border">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header">
                                            <tbody>
                                                <tr class="w-grid-head-back">

                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-3" colindex="3" colid="ItemId" style="padding-left: 0px; padding-right: 0px;width: 50px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px;">
                                                            <span href="#" class="w-grid-head ColName sort">Item ID</span>
                                                        </div>
                                                    </td>
                                                
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileType" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Item Code</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedBy" style="padding-left: 0px; padding-right: 0px; width: 110px; ">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Description</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedBy" style="padding-left: 0px; padding-right: 0px; width: 110px;display:none;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Qty'AVL</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px; ">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Qty</span>
                                                        </div>
                                                    </td>
                                                      <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Unit Price</span>
                                                        </div>
                                                    </td>
                                                      <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Total Price</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 45px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 35px;">
                                                            <span href="#" class="w-grid-head ColName sort"></span>
                                                        </div>
                                                    </td>


                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="ItemTR">
                                    <td class="Item w-grid-border">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; table-layout: fixed" itemno="10" class="w-grid-row-odd">
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="NoRecordsTR" style="display: none;">
                                    <td class="NoRecords w-grid-norecords-msg">
                                        <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                            </div>--%>

         <div style="width: 100%; padding:4px;" class="ItemListDiv">

      <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="uploadedItemList">
          <thead>
              <tr>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4 " style="padding-left: 5px; padding-right: 0px; color: black;width: 60px; ">Item ID</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 130px;">Item Code</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 270px;">Description</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">From</th>
              
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Rack</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Shelf</th>
                      <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Store</th>
                <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Qty</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Unit Price</th>
                  <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Total Price</th>
                   
                 <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border w-grid-cell-border-last colIndex-4" ></th>

              </tr>
          </thead>
          <tbody>

          </tbody>
          <tfoot>
              <tr class="NoRecordsTR">

                  <td class="NoRecords w-grid-norecords-msg" colspan="10">
                      <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                  </td>
              </tr>

          </tfoot>

      </table>
  </div>
                        <%--<%-- End Data Grid --%>
                   
                        
                    </td>
                </tr>

                 <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                     
                    </td>
                </tr>
                <%--<tr>
                    <td class="ftitle">
                        <nobr>SubTotal:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text "
                            groupid="SparePartInventoryInvoice" argumentid="SubTotal" /></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Discount:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text "
                            groupid="SparePartInventoryInvoice" argumentid="Discount" /></td>
                    <td></td>
                    <td></td>

                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Grand Total:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text "
                            groupid="SparePartInventoryInvoice" argumentid="GrandTotal" /></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Paid:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text "
                            groupid="SparePartInventoryInvoice" argumentid="Paid" /></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Balance:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text "
                            groupid="SparePartInventoryInvoice" argumentid="Balance" /></td>
                    <td></td>
                    <td></td>
                </tr>
                 <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>--%>

                       <tr>
                  
                     <td class="ftitle">
                        <nobr>SubTotal:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="100" class="text SubTotal ElemDisabled"
                            groupid="SparePartInventoryInvoice" argumentid="SubTotal" disabled="disabled"/>

                    </td>
                    <td colspan="2" class="ftitle" >
                        
                        <nobr>Comments:</nobr>
                    
                     </td>


                </tr>


                <tr>


                    <td class="ftitle">
                        <nobr>Discount:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="100" class="text Discount CommonDisableClass CommonDisableClasss"
                            groupid="SparePartInventoryInvoice" argumentid="Discount" /></td>
                                                                            
                    <%--<td colspan="2" rowspan="2" style="padding: 0; " >
                        </td>--%>
                   <td colspan="2" rowspan="2">
                       <textarea class="textarea CommonDisableClass  CommonDisableClasss" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;"
                            argumentid="Comments" groupid="SparePartInventoryInvoice"></textarea>
                   </td>

                </tr>


                <tr>

                 

                      <td class="ftitle">
                        <nobr>Grand Total:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="10" class="text GrandTotal ElemDisabled"
                            groupid="SparePartInventoryInvoice" argumentid="GrandTotal"  disabled="disabled"/></td>
                </tr>

                     <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                     
                    </td>
                </tr>
                
                <tr>
                    <td class="ftitle">
                        <nobr style="color: Green; font-size: 12px">Amount Received (KD):</nobr>
                    </td>
                    <td style="text-align: center;" >
                        <span class="ftitle Paid" style="color: Green; font-size: 12px" groupid="SparePartInventoryInvoice" argumentid="Paid"></span>
                    </td>
                    <td class="ftitle">

                        <nobr style="color: Red; font-size: 12px">Amount Due:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle AmountDueC" style="color: Red; font-size: 12px" groupid="SparePartInventoryInvoice" argumentid="Balance"></span>
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
                            <input type="button" style="width: 95px; color: blue;"  value="  Open  " class="DataAction ButtonStyle  InvoiceOpenBtn common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_Invoice',HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 95px; color: Green"  value="  Close " class="DataAction ButtonStyle   common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 95px; color: Red"  value="  Cancele  " class="DataAction ButtonStyle   common-button OnNewForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />

                        </div>
                    
                        <div style="padding-top: 10px; padding-bottom: 10px; height: 50px;">
                            <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle InvoiceButton_Edit OnNewForm" />
                            <input type="button" style="width: 100px" value="  Create Invoice  "  class="DataAction ButtonStyle btnSaveInvoice   common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:false, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                            <input type="button" style="width: 50px" value="  Save  "  class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Invoice',HideOnSuccess:true, Requery:false,GroupId:'SparePartInventoryInvoice'}" />
                             <input type="button" value="  Print Bill  " style="width: 102px" class="ButtonStyle PrintBill OnNewForm  common-button" />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel " />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>


    <script src="../../../Scripts/eForms/iRental/grdInvoicePaymentDetails.js"></script>

     <tr tabid="InvoicePaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdInvoicePaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_Invoice_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_Invoice_Payments\',KeysCol:\'RecId\'}}}">
                
     
 <GridConfig>
 <script>
     cf = {
         cols: {
             Sequence: { width: '0px' },
             RecId: { width: '0px', caption: 'ID' },
             LocationReceiptId: { width: '130px', caption: 'ID' },
             PrintId: { width: '30px', caption: '' },
             ParentRecId: { width: '0px' },
             PaymentType: { width: '65px', caption: 'Type' },
             PaymentDate: { caption: 'Date', width: '90px' },
             PaymentMode: { caption: 'Mode', width: '75px' },
             ChequeNo: { width: '0px' },
             PaymentAmount: { caption: 'Amount', width: '80px' },
             ReceiptId: { caption: 'Manual ID' },
             DateCreated: { caption: 'Date Created', width: '130px' },
             CreatedBy: { caption: 'Created By', width: '150px' },
             StateId: { width: '0px' }
         },
         forms: {
             NewFormId: 'frmInvoicePaymentDetails',
             EditFormId: 'frmInvoicePaymentDetails',
             Keys: 'RecId'
         }
     };
 </script>
 </GridConfig>
 <Scripts>
 <script>
     //var fn = Sales.SalesContracts.grdSalesContractsPaymentDetails;
 </script>
 </Scripts>
 <RowDetail>
 <pre class="" colindex="4">
                    <AW:container id="conInvoicePaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdInvoicePaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_Invoice_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Invoice Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '182px' },
                                RecId: { width: '0px', caption: 'System ID' },
                                ParentRecId: { width: '0px' },
                                PaymentType_Audit: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Action By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                    <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                   </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
 </RowDetail>


 </AW:DataGrid>

            <AW:Form ID="frmInvoicePaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/Invoice_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Invoice Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>


</script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>
</table>

