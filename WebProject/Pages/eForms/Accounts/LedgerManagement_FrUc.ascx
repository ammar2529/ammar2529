<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.LedgerManagement_FrUc" %>



<table cellspacing="2" cellpadding="0" style="width: 100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory

            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="RecId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="BenificiaryId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="AmountRecId"></span></div>
        </td>
    </tr>




    <tr class="LineOfItemTestRow  testTR" style="display: none">
        <td colspan="8">
            <table cellspacing="2" cellpadding="0" style="width: 100%" border="0" class="w-form-table" id="dynamicRowss">

                <tr>
                    <td class="ftitle" style="width: 20%">Transaction Type:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="radio" class="Debit" checked="checked" default="default" value="D" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2"><label>Debit</label>
                        <input type="radio" class="Credit" value="C" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2"><label>Credit</label>
                    </td>

                    <td class="ftitle" style="width: 20%">Amount*:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text number amountInput required "
                            groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount2" requirederr='*' /></td>
                </tr>

                <tr>
                    <td class="ftitle" style="width: 20%">Payment Type*:</td>
                    <td class="ftitle" style="width: 30%">
                        <select loadon="FirstVisible" valtype="value" class="dropdownlist  required " style="width: 145px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType2"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}" requirederr='*'>
                            <option value="" selected="selected">Select Payment Type</option>
                        </select>
                    </td>

                    <td class="ftitle" style="width: 20%">Amount*:</td>
                    <td class="ftitle" style="width: 30%">test

                    </td>
                </tr>

                <tr>
                    <td class="ftitle" style="width: 20%">Reason:</td>
                    <td class="ftitle" style="width: 30%" colspan="3">


                        <textarea class="textarea" style="width: 85.5%; height: 50px; box-sizing: border-box; resize: none; vertical-align: middle;"
                            argumentid="LedgerManagementReason2" groupid="LedgerManagement_FrUc"></textarea>
                    </td>


                </tr>

                <tr>


                    <td style="width: 20%;"></td>

                    <td style="width: 30%;" colspan="8">
                        <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType" class=" UPD_Row_Save_Btn ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement_Amounts',Params:{DBAction:'UpdateRow'},HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}">
                        <input type="button" value="  Cancel  " id="CloseTableEditForm" class="CloseTableEditForm ButtonStyle" />
                    </td>


                </tr>
            </table>


        </td>



    </tr>


    <tr class="trTransaction">
        <td class="ftitle" style="width: 20%">
            <nobr>Ledger ID:</nobr>
        </td>
        <td style="width: 30%" colspan="3">


            <div><span groupid="LedgerManagement_FrUc" argumentid="LedgerManagementRecCode" class="ftitle"></span></div>

        </td>
    </tr>


    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr>Ledger Date:</nobr>
        </td>
        <td style="width: 30%" colspan="3">
            <input type="text" groupid="LedgerManagement_FrUc" maxlength="10" style="width: 150px;"
                class="text  date  " argumentid="TransactionDate" />
        </td>
    </tr>
    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr>Title:</nobr>
        </td>
        <td style="width: 30%" colspan="3">
            <input type="text" groupid="LedgerManagement_FrUc" maxlength="200" style="width: 300px;"
                class="text    " argumentid="LedgerTitle" />
        </td>
    </tr>
    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr class="CompanyTD">Beneficiary Code*:</nobr>
        </td>
        <td style="width: 30%" colspan="3">
            <input type="text" style="text-align: center; width: 150px;" maxlength="30" class="LOVPopup required text ftitle"
                groupid="LedgerManagement_FrUc" lovpopupid="LedgerManagementPopup" argumentid="BeneficiaryCode" requirederr=' *Required' />

        </td>

    </tr>


    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr>Beneficiary Type:</nobr>
        </td>
        <td style="width: 30%">


            <div><span class="ftitle" groupid="LedgerManagement_FrUc" argumentid="BeneficiaryType"></span></div>

        </td>

        <td class="ftitle" style="width: 20%">
            <nobr>National ID No.:</nobr>
        </td>
        <td style="width: 30%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="NationalIDNo" class="ftitle"></span></div>

        </td>

    </tr>

    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr>Company Name:</nobr>
        </td>
        <td style="width: 30%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="CompanyName" class="ftitle"></span></div>

        </td>

        <td class="ftitle" style="width: 20%">
            <nobr>Mobile Telephone:</nobr>
        </td>
        <td style="width: 30%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="MobileTelephone1" class="ftitle"></span></div>

        </td>
    </tr>

    <tr>
        <td class="ftitle" style="width: 20%">
            <nobr>Person Name:</nobr>
        </td>
        <td style="width: 30%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="PersonName" class="ftitle"></span></div>

        </td>

        <td class="ftitle" style="width: 20%">
            <nobr>Address:</nobr>
        </td>
        <td style="width: 30%">


            <div><span groupid="LedgerManagement_FrUc" argumentid="Address" class="ftitle"></span></div>

        </td>
    </tr>

    <tr class="">
        <td colspan="4">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr class="HideOnNewForm">
        <td style="width: 100%" colspan="4">


            <span class="new-wrap">
                <i class="fa-solid fa-plus Plus-Icon"></i>
                <span class="new-text" title="New Form">New</span>
            </span>


        </td>

    </tr>



    <tr class="LineOfItemRow HideOnNewForm ShowOnNewClickButton">
        <td colspan="4">
            <table cellspacing="2" cellpadding="0" style="width: 100%" border="0" class="w-form-table" id="dynamicRows">

                <tr>
                    <td class="ftitle" style="width: 20%">Transaction Type:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="radio" class="Debit TransactionType" checked="checked" default="default" value="D" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Debit</label>
                        <input type="radio" class="Credit TransactionType" value="C" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label>Credit</label>
                    </td>

                    <td class="ftitle" style="width: 20%">Amount*:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text number amountInput required "
                            groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount" requirederr='*' /></td>
                </tr>

                <tr>
                    <td class="ftitle" style="width: 20%">Payment Type*:</td>
                    <td class="ftitle" style="width: 30%">
                        <select loadon="FirstVisible" valtype="value" class="dropdownlist  required " style="width: 145px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}" requirederr='*'>
                            <option value="" selected="selected">Select Payment Type</option>
                        </select>
                    </td>

                    <td class="ftitle" style="width: 20%">Amount*:</td>
                    <td class="ftitle" style="width: 30%">test

                    </td>
                </tr>

                <tr>
                    <td class="ftitle" style="width: 20%">Reason:</td>
                    <td class="ftitle" style="width: 30%" colspan="3">


                        <textarea class="textarea" style="width: 85.5%; height: 50px; box-sizing: border-box; resize: none; vertical-align: middle;"
                            argumentid="LedgerManagementReason" groupid="LedgerManagement_FrUc"></textarea>
                    </td>


                </tr>

                <tr>


                    <td style="width: 20%;"></td>

                    <td style="width: 30%;" colspan="3">
                        <input type="button" value="  Save  " class=" INS_Row_Save_Btn ButtonStyle" ignorevalidate="LedgerManagementAmount2 AccountsPaymentType2" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'INS_Account_LedgerManagement_Amounts',Params:{DBAction:'InsertRow'},HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}">
                        <input type="button" value="  Cancel  " class="CloseNewForm ButtonStyle" />
                    </td>
                    <!-- Delete button -->

                </tr>
            </table>


        </td>



    </tr>


    <tr class="HideOnNewForm">
        <td colspan="4">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>


    <tr class="HideOnNewForm">
        <td colspan="4">



            <div style="width: 100%; padding: 4px;">

                <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="LedegerAmountsTable">
                    <thead>
                        <tr>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 100px;">Transaction ID</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 110px;">Transaction Date</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 90px;">Debit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 90px;">Credit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 95px;">Payment Type</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Status</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Reason</th>

                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 5px;"></th>


                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr class="NoRecordsTR">

                            <td class="NoRecords w-grid-norecords-msg" colspan="8">
                                <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                            </td>
                        </tr>

                    </tfoot>

                </table>
            </div>



        </td>
    </tr>





    <tr class="HideOnNewForm">
        <td class="ftitle">Total Debit:</td>
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="TotalDebit" class="ftitle"></span></td>
    </tr>
    <tr class="HideOnNewForm">
        <td class="ftitle">Total Credit:</td>
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="TotalCredit" class="ftitle"></span></td>
    </tr>
    <tr class="HideOnNewForm">
        <td class="ftitle">Total Balance:</td>
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="DebitCreditTotal" class="ftitle"></span></td>
    </tr>
    <tr>
        <td colspan="4">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif">
        </td>
        <td colspan="4">
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2" class="DataAction ButtonStyle firstSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:true,Requery:true,GroupId:'LedgerManagement_FrUc'}" />
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2" class="DataAction ButtonStyle secondSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}" />

            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>
