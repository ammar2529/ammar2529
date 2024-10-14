<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Invoice_ItemCode_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_Cars_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Chassis No.</span>--%>
            <span style="white-space: nowrap">Item ID</span>
        </td>
        <td style="text-align: left;" class="ftitle">
       <span style="white-space: nowrap">Item Code</span>

            <%--<span style="white-space: nowrap">Car No.</span>--%>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Description</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Purchasing</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Store</span></td>
       
        <td style="text-align: left;" class="ftitle"></td>
    </tr>
    <tr>
        
        <td style="text-align: left;">
                        <input type="text" style="width: 115px;" class="text" argumentid="ItemId" groupid="schInvoice_ItemCode_ShUc" />
<%--            <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo" groupid="schInvoice_ItemCode_ShUc" />--%>

        </td>
        <td style="text-align: left;">

<%--            <input type="text" style="width: 115px;" class="text" argumentid="CarNumber" groupid="schInvoice_ItemCode_ShUc" />--%>
                        <input type="text" style="width: 115px;" class="text" argumentid="SparePartSerialNo" groupid="schInvoice_ItemCode_ShUc" />

        </td>
        <td style="text-align: left;">

                        <input type="text" style="width: 115px;" class="text" argumentid="SparePartName" groupid="schInvoice_ItemCode_ShUc" />

        </td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width:120px" argumentid="PurchasingFrom"  groupid="schInvoice_ItemCode_ShUc" name="D1">
            <option value="" >Select Purchasing From</option>
            <option value="Geniune">Geniune Parts</option>
             <option value="China">Local China</option>
                <option value="Kuwait">Local kuwait</option>
            
        </select></td>
        <td style="text-align: left;">
        
           <select loadon="FirstVisible" class="dropdownlist  " style="width: 120px;"
    groupid="schInvoice_ItemCode_ShUc" argumentid="StoreLocation" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}">
    <option value="" selected="selected">Select Store</option>
</select>
        </td>
       
        <td style="text-align: left; padding-bottom: 0px">

            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>

            <a href="javascript:void(0);" class="ClosePopup CloseLOVPopup">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/Close.gif" border="0" /></a>

        </td>
    </tr>
</table>
