<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.LedgerManagement_FrUc" %>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory

            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="RecId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="BenificiaryId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="AmountRecId"></span></div>
        </td>
    </tr>

    <%--    <tr>
        <td class="ftitle">
            <nobr>Total:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="GrandTotal" class="ftitle"></span></div>

        </td>
    </tr>--%>

    <tr class="trTransaction">
        <td class="ftitle">
            <nobr>Ledger ID:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="LedgerManagementRecCode" class="ftitle"></span></div>

        </td>
    </tr>

    <%--   <tr>
        <td class="ftitle">
            <nobr>Beneficiary Code:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="BeneficiaryCode" class="ftitle"></span></div>

        </td>
    </tr>--%>
    <tr>
        <td class="ftitle">
            <nobr>Ledger Date:</nobr>
        </td>
        <td width="100%">
            <input type="text" groupid="LedgerManagement_FrUc" maxlength="10" style="width: 150px;"
                class="text  date  " argumentid="TransactionDate" />
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>Title:</nobr>
        </td>
        <td width="100%">
            <input type="text" groupid="LedgerManagement_FrUc" maxlength="10" style="width: 150px;"
                class="text    " argumentid="LedgerTitle" />
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr class="CompanyTD">Beneficiary Code*:</nobr>
        </td>
        <td>
            <input type="text" style="text-align: center; width: 150px;" maxlength="30" class="LOVPopup required text ftitle"
                groupid="LedgerManagement_FrUc" lovpopupid="LedgerManagementPopup" argumentid="BeneficiaryCode" requirederr=' *Required' />

        </td>
    </tr>


    <tr>
        <td class="ftitle">
            <nobr>Beneficiary Type:</nobr>
        </td>
        <td width="100%">


            <div><span class="ftitle" groupid="LedgerManagement_FrUc" argumentid="BeneficiaryType"></span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Company Name:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="CompanyName" class="ftitle"></span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Person Name:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="PersonName" class="ftitle"></span></div>

        </td>
    </tr>






    <tr>
        <td class="ftitle">
            <nobr>National ID No.:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="NationalIDNo" class="ftitle"></span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Mobile Telephone:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="MobileTelephone1" class="ftitle"></span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Address:</nobr>
        </td>
        <td width="100%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="Address" class="ftitle"></span></div>

        </td>
    </tr>




    <tr class="HideOnNewForm">
        <td colspan="4">
            <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr class="LineOfItemRow HideOnNewForm">
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table" id="dynamicRows">
                            <tr>


                                <td class="ftitle" style="width: 50px">
                                    <label for="column3">Transaction Type</label></td>
                                <td class="ftitle" style="width: 50px">
                                    <label for="column4">Amount*</label></td>
                                <td class="ftitle" style="width: 50px">
                                    <label for="column5">Reason</label></td>

                                <td class="ftitle" style="width: 50px">
                                    <label for="column9">Actions</label></td>
                                <!-- Actions column -->

                            </tr>
                            <tr class="trNoDynamic">



                                <td>
                                    <input type="radio" class="Debit" checked="checked" default="default" value="D" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Debit</label>
                                    <input type="radio" class="Credit" value="C" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Credit</label>


                                </td>


                                <td>
                                    <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text number amountInput required "
                                        groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount" requirederr=' *Required' />

                                    <select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  " id="a" style="width: 145px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType" 
                                        storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}">
                                        <option value="" selected="selected">Select Payment Type</option>
                                    </select>
                                </td>
                                <td>

                                    <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text "
                                        groupid="LedgerManagement_FrUc" argumentid="LedgerManagementReason" />
                                </td>




                                <%--<td> display none </td>--%>
                                <td>
                                    <button type="button" recid="recId" class=" UPD_Row_Save_Btn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement_Amounts',Params:{DBAction:'UpdateRow'},HideOnSuccess:false,Requery:true}">Save</button>
                                    <button type="button" recid="recId" class=" INS_Row_Save_Btn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'INS_Account_LedgerManagement_Amounts',Params:{DBAction:'InsertRow'},HideOnSuccess:false,Requery:true}">Save</button>
                                </td>
                          
                                <!-- Delete button -->
                                
                            </tr>
            </table>


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
        <td colspan="4">



            <div style="width: 100%; padding: 4px;">

                <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="LedegerAmountsTable">
                    <thead>
                        <tr>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 100px;">Transaction ID</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 110px;">Transaction Date</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 90px;">Debit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 90px;">Credit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Reason</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 5px;"></th>


                            <%--                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Created By</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Date Created</th>--%>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr class="NoRecordsTR">

                            <td class="NoRecords w-grid-norecords-msg" colspan="7">
                                <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                            </td>
                        </tr>

                    </tfoot>

                </table>
            </div>



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
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount" class="DataAction ButtonStyle firstSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:true,Requery:true}" />
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount" class="DataAction ButtonStyle secondSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:false,Requery:true}" />

            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>
