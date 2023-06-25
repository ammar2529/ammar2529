<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewBoutton.ascx.cs" Inherits="WebProject.Pages.Common.Administration.AddNewBoutton" %>

<div>
<center>
<table>
<tr>
    <td style="width: 25%; white-space: nowrap;" class="ftitle">Country Name:</td>
    <td style="width: 75%">
        <input type="text" groupid="AddNewButton" argumentid="CountryName" style="width: 225px;"
            class="text required" alt="" />
        <div style="display: none">
            <span groupid="AddNewButton" argumentid="CountryId"></span>
        </div>
    </td>
</tr>

<tr>
    <td style="width: 25%; white-space: nowrap;" class="ftitle">a:</td>
    <td style="width: 75%">
        <input type="text" groupid="AddNewButton" argumentid="Num1" style="width: 225px;"
            class="text required" alt="" />
        <div style="display: none">
        </div>
    </td>
</tr>
<tr>
    <td style="width: 25%; white-space: nowrap;" class="ftitle">b:</td>
    <td style="width: 75%">
        <input type="text" groupid="AddNewButton" argumentid="Num2" style="width: 225px;"
            class="text required" alt="" />
        <div style="display: none">
        </div>
    </td>
</tr>
<tr>
    <td style="width: 25%; white-space: nowrap;" class="ftitle">Result:</td>
    <td style="width: 75%">
        <input type="text" groupid="AddNewButton" argumentid="Result" style="width: 225px;"
            class="text required" alt="" />

    </td>
</tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Installmnent Date:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="FirstInstallmentDate" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Total Price:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="TotalPrice" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Total Installments:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="TotalInstallments" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Paid Amount:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="PaidAmount" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Total Installments Due:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="TotalInstallmentsDue" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>
    <tr>
        <td style="width: 25%; white-space: nowrap;" class="ftitle">Installments Paid:</td>
        <td style="width: 75%">
            <input type="text" groupid="AddNewButton" argumentid="InstallmentsPaid" style="width: 225px;"
                class="text required" alt="" />

        </td>
    </tr>






    <tr>
    <td style="text-align: center;" colspan="2" class="w-form-button-panel">
        <div class="bgdiv">
            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'Test_Country'}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
            <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}" />
        </div>
    </td>
</tr>
</table>
</center>
</div>