<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.SearchForms.LedgerManagement_ShUc" %>

<div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">

                    <span class="  ink-bar">Ledger Management</span>
                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                        onmouseover="this.style.color='red';"
                        onmouseout="this.style.color='black';"></i>
                </div>
            </div>
        </div>

                <%--        -------------------------------------------------------------------Start Search Form---------------------------------------------------------------------------%>
        <table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Ledger Code</span></td>
        <td style="text-align: left;" class="ftitle">
            <span>Beneficiary Type</span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Company Name</span></td>




        <td style="text-align: left;"></td>
    </tr>
    <tr>
        <td style="text-align: left;">
            <input type="text" class="text"
                argumentid="LedgerManagementRecCode" groupid="schLedgerManagement"></td>
        <td style="text-align: left;">

            <select class="dropdownlist" style="width: 160px;"
                groupid="schLedgerManagement" argumentid="BeneficiaryType" name="D4">
                <option value="" selected="selected">Select Beneficiary Type</option>

                <option value="C">Company</option>
                <option value="I">Individual</option>

            </select>

        </td>

        <td style="text-align: left;">
            <input type="text" class="text"
                argumentid="CompanyName" groupid="schLedgerManagement"></td>



        <td style="text-align: left; padding-bottom: 0px">
            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a></td>
    </tr>
</table>
                <%--        -------------------------------------------------------------------End Search Form---------------------------------------------------------------------------%>


        </div>
    </div>

