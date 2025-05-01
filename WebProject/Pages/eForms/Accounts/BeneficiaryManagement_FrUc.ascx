<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiaryManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.BeneficiaryManagement_FrUc" %>

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

            <div style="display: none"><span groupid="Beneficiary" argumentid="RecId"></span></div>
            <div><span groupid="Beneficiary" argumentid="RecCode" style="font-style: italic; font-weight: bold">New customer code will be generated on saving</span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Beneficiary Type:</nobr>
        </td>
        <td>

            <input type="radio" checked="checked" default="default" value="Local" name="BeneficiaryType" groupid="Beneficiary" argumentid="BeneficiaryType"><label>Company</label>
            <input type="radio" value="International" name="BeneficiaryType" groupid="Beneficiary" argumentid="BeneficiaryType"><label>Individual</label>
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Company Name*:</nobr>
        </td>
        <td>
            <input type="text" style="text-align: center; font-size: 16px; font-weight: bold; width: 300px;" maxlength="199" class="text required"
                groupid="Beneficiary" argumentid="CompanyName" />

        </td>
    </tr>

        <tr>
        <td class="ftitle">
            <nobr>Person Name:</nobr>
        </td>
        <td>
            <input type="text" style="text-align: center; font-size: 16px; font-weight: bold; width: 300px;" maxlength="199" class="text "
                groupid="Beneficiary" argumentid="PersonName" />

        </td>
    </tr>
                                             

    <tr>
        <td class="ftitle">
            <nobr>National ID No:</nobr>
        </td>
        <td>
            <asp:TextBox ID="txtNationalIDNo" runat="server" groupid="Beneficiary" MaxLength="50"
                Width="300px" class="text alphanumericspacedot" argumentid="NationalIDNo" />

            <%--<asp:TextBox ID="txtNationalIDExpiryDate" runat="server" groupid="Beneficiary" MaxLength="50"
                Width="150px" class="date text" argumentid="NationalIDExpiryDate" />--%>
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Mobile Telephone:</nobr>
        </td>
        <td>
            <asp:TextBox ID="MobileTelephone1" runat="server" groupid="Beneficiary" MaxLength="8"
                Width="300px" class="text number" argumentid="MobileTelephone1"></asp:TextBox>

<%--            <asp:TextBox ID="MobileTelephone2" runat="server" groupid="Beneficiary" MaxLength="8"
                Width="150px" class="text number" argumentid="MobileTelephone2"></asp:TextBox>--%>
        </td>
    </tr>
    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif">
        </td>
        <td class="smalltext">Enter the phone number without country code, E.g. <b>24045607</b>
        </td>
    </tr>


    <tr>
        <td class="ftitle">Address:</td>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">

                <tr>
                    <td style="width: 50%">
                        <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="Address" style="width:54%" groupid="Beneficiary"></textarea>
                    </td>
<%--                    <td style="width: 50%; padding-left: 5px">
                        <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="CustomerNotes" groupid="Beneficiary"></textarea>
                    </td>--%>
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
            <input type="button" value="  Save  " style="display: none" class="DataAction ButtonStyle btnMainForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Customers',HideOnSuccess:true,Requery:false}" />
            <input type="button" value="  Save  " class="DataAction ButtonStyle btnPopupForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Customers',HideOnSuccess:true,Requery:true}" />

            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>

