<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiaryManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.BeneficiaryManagement_FrUc" %>

<div class="card">
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-sm-12">
                <div class="form-header">

                    <span class="  ink-bar">Beneficiary Management</span>
                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                        onmouseover="this.style.color='red';"
                        onmouseout="this.style.color='black';"></i>
                </div>
            </div>
        </div>

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
                <td class="ftitle">

                    <input type="radio" class="Company" checked="checked" default="default" value="C" name="BeneficiaryType" groupid="Beneficiary" argumentid="BeneficiaryType"><label>Company</label>
                    <input type="radio" class="Individual" value="I" name="BeneficiaryType" groupid="Beneficiary" argumentid="BeneficiaryType"><label>Individual</label>
                </td>
            </tr>

            <tr>
                <td class="ftitle">
                    <nobr class="CompanyTD">Company Name:</nobr>
                </td>
                <td class="ftitle">
                    <input type="text" style="text-align: center; width: 150px;" maxlength="199" class="text required"
                        groupid="Beneficiary" argumentid="CompanyName" />

                </td>
            </tr>

            <tr>
                <td class="ftitle">
                    <nobr class="PersonTD">Person Name:</nobr>
                </td>
                <td class="ftitle">
                    <input type="text" style="text-align: center; width: 150px;" maxlength="199" class="text "
                        groupid="Beneficiary" argumentid="PersonName" />

                </td>
            </tr>


            <tr>
                <td class="ftitle">
                    <nobr>National ID No:</nobr>
                </td>
                <td class="ftitle">
                    <asp:TextBox ID="txtNationalIDNo" runat="server" groupid="Beneficiary" MaxLength="13"
                        Width="150px" class="text alphanumericspacedot" argumentid="NationalIDNo" />

                </td>
            </tr>

            <tr>
                <td class="ftitle">
                    <nobr>Mobile Telephone:</nobr>
                </td>
                <td class="ftitle">
                    <asp:TextBox ID="MobileTelephone1" runat="server" groupid="Beneficiary" MaxLength="8"
                        Width="150px" class="text number" argumentid="MobileTelephone1"></asp:TextBox>


                </td>
            </tr>



            <tr>
                <td class="ftitle">Address:</td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">

                        <tr>
                            <td style="width: 50%" class="ftitle">
                                <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="Address" style="width: 54%" groupid="Beneficiary"></textarea>
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
                    <input type="button" value="  Save  " class="DataAction ButtonStyle " conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_BeneficiaryManagement',HideOnSuccess:true,Requery:true}" />

                    <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
                </td>
            </tr>
        </table>


    </div>
</div>

