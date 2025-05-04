<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.LedgerManagement_FrUc" %>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Code:</nobr>
        </td>
        <td width="100%">

            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="RecId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="CustomerRecCode"></span></div>
            <div><span groupid="LedgerManagement_FrUc" argumentid="LedgerManagementRecCode" style="font-style: italic; font-weight: bold">New customer code will be generated on saving</span></div>

        </td>
    </tr>


    <tr>
        <td class="ftitle">
            <nobr class="CompanyTD">Customer Name:</nobr>
        </td>
        <td>
            <input type="text" style="text-align: center; width: 300px; font-weight: bold;" maxlength="30" class="LOVPopup required text"
                groupid="LedgerManagement_FrUc" lovpopupid="LedgerManagementPopup" argumentid="CustomerName" requirederr=' *Required' />

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Transaction Type:</nobr>
        </td>
        <td>

            <input type="radio" class="Debit" checked="checked" default="default" value="D" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Debit</label>
            <input type="radio" class="Credit" value="C" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Credit</label>
        </td>
    </tr>

        <tr>
        <td class="ftitle">
            <nobr class="PersonTD">Amount:</nobr>
        </td>
        <td>
            <input type="text"  style="text-align: center;  width: 300px;" maxlength="199" class="text number amountInput"
                groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount" />

        </td>
    </tr>
                                             

    <tr>
        <td class="ftitle">Reason:</td>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">

                <tr>
                    <td style="width: 50%">
                        <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="LedgerManagementReason" style="width:54%" groupid="LedgerManagement_FrUc"></textarea>
                    </td>

                </tr>

            </table>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif">
        </td>
        <td>
            <input type="button" value="  Save  " class="DataAction ButtonStyle " conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:true,Requery:true}" />

            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>
