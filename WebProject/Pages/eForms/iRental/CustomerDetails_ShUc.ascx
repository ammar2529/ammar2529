<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CustomerDetails_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
            <span>Code</span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle">
            <span>Status</span></td>
        <td style="text-align: left;"></td>
    </tr>
    <tr>
        <td style="text-align: left;">

            <input type="text" class="text"
                argumentid="RecCode" groupid="schCustomerManagement"></td>
        <td style="text-align: left;">
            <input type="text" class="text"
                argumentid="CustomerName" groupid="schCustomerManagement"></td>
        <td style="text-align: left;">
            <input type="text" class="text"
                argumentid="NationalIDNo" groupid="schCustomerManagement"></td>
        <td style="text-align: left;">
            <input type="text" class="text"
                argumentid="MobileTelephone1" groupid="schCustomerManagement"></td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 125px" argumentid="CustomerStatus"
                groupid="schCustomerManagement" name="D1">
                <option value="">Select Status</option>
                <option value="Active">Active</option>
                <option value="Blacklisted">Blacklisted</option>
            </select></td>
        <td style="text-align: left; padding-bottom: 0px">
            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
    </tr>
</table>
