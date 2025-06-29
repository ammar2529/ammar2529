<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.LedgerManagement_FrUc" %>



<table cellspacing="2" cellpadding="0" style="width: 100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory

            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="RecId" ></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="BenificiaryId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="AmountRecId"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="DueDateSetInCtrl"></span></div>

<%--                        <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="BankNameAMT2" ></span></div>--%>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeFromAMT"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT"></span></div>
            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeDateAMT"></span></div>
        </td>
    </tr>




<tr class="LineOfItemTestRow testTR removeOnEditMode" style="display: none">
    <td colspan="8">
        <div></div>
        <table cellspacing="2" cellpadding="0" style="width: 99%; margin:5px" class="w-form-table" id="dynamicRowss">
            <tr>
                <td class="ftitle CloseTableEditForm"  colspan="4" style="background: #d6e4e7; border:1px solid #adc4ce;color:black">
                    <span>Edit Transection Detail</span>
                    <i class="fa-solid fa-rectangle-xmark cross-icon" style="float: right; cursor: pointer; margin-right: 10px; font-size: 16px;margin-top: 1.5px;" title="Close Edit Form"></i>
                </td>
            </tr>
            <tr>
                <td class="ftitle">Transaction ID</td>
                <td class="ftitle" colspan="3">
                    <div><span groupid="LedgerManagement_FrUc" argumentid="TransactionID2" class="ftitle"></span></div>
                </td>
            </tr>
            <tr>
                <td class="ftitle" style="width: 20%">Transaction Type:</td>
                <td class="ftitle" style="width: 30%">
                    <input type="radio" class="Debit" checked="checked" default="default" value="D" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2" ><label style="color:red">Debit</label>
                    <input type="radio" class="Credit" value="C" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2"><label style="color:green">Credit</label>
                </td>

                <td class="ftitle" style="width: 20%">Transaction Date:</td>
                <td class="ftitle" style="width: 30%">
<%--                    <input type="text" groupid="LedgerManagement_FrUc" maxlength="10"
                        style="width: 150px;" class="text  date   " argumentid="AccountTransactionDate2" />--%>

                    <div><span groupid="LedgerManagement_FrUc" argumentid="AccountTransactionDate2" class="ftitle"></span></div>

                </td>

            </tr>
            <tr>

                <td class="ftitle" style="width: 20%">Payment Type*:</td>
                <td class="ftitle" style="width: 30%">
                    <select loadon="FirstVisible"  class="dropdownlist requiredElem PaymentTypeDD" style="width: 145px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType2"
                        storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}" >
                        <option value="" selected="selected">Select Payment Type</option>
                    </select>
                </td>
                <td class="ftitle" style="width: 20%">Amount*:</td>
                <td class="ftitle" style="width: 30%">
                    <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text number amountInput requiredElem"
                        groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount2" requirederr='*' />
                </td>

            </tr>
            <tr class="show-on-service-select" style="display: none">
                <td class="ftitle" style="width: 20%">Due Date:</td>
                <td class="ftitle" style="width: 30%">
                    <input type="text" groupid="LedgerManagement_FrUc" maxlength="10"
                        style="width: 150px;" class="text  date   " argumentid="DueDate2" />
                </td>


                <td class="ftitle" style="width: 20%"></td>
                <td class="ftitle" style="width: 30%"></td>
            </tr>


                           <tr class="show-on-cheque-select" style="display: none">
                    <td class="ftitle" style="width: 20%">Bank*:</td>
                    <td class="ftitle" style="width: 30%">
                        <select loadon="FirstVisible" class="dropdownlist BankNameBankNameAMT2 CommonRequiredClass2 commonRemoveRequiredStaric2" style="width: 145px;"
                            groupid="LedgerManagement_FrUc" argumentid="BankNameAMT2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" >
                            <option value="" selected="selected">Select Bank</option>

                        </select>
                    </td>


                    <td class="ftitle" style="width: 20%">Cheque No.*</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number CommonRequiredClass2 commonRemoveRequiredStaric2 ChequeNoAMT2"
                            groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT2"  /></td>
                </tr>

                <tr class="show-on-cheque-select" style="display: none">
                    <td class="ftitle" style="width: 20%">Cheque From:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: center; width: 165px; margin-right: 4px" maxlength="100" class="text  ChequeFromAMT2"
                            groupid="LedgerManagement_FrUc" alphconf="{allow:'.'}" argumentid="ChequeFromAMT2" />
                    </td>


                    <td class="ftitle" style="width: 20%">Cheque Date*:</td>
                    <td class="ftitle" style="width: 30%">
                        <input argumentid="ChequeDateAMT2" class="text CommonRequiredClass2 date ChequeDateAMT2 commonRemoveRequiredStaric2 " groupid="LedgerManagement_FrUc" maxlength="10"  style="width: 75px;" type="text" />
                    </td>
                </tr>

            <tr>
                <td class="ftitle" style="width: 20%">Description:</td>
                <td class="ftitle" style="width: 30%" colspan="3">
                    <textarea class="textarea" style="width: 85.5%; height: 50px; box-sizing: border-box; resize: none; vertical-align: middle;"
                        argumentid="LedgerManagementReason2" groupid="LedgerManagement_FrUc"></textarea>
                </td>
            </tr>
            <tr>
                <td style="width: 20%;"></td>
                <td style="width: 30%;" colspan="8">
                    <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType" class="UPD_Row_Save_Btn ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement_Amounts',Params:{DBAction:'UpdateRow'},HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}">
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

    <tr class="HideOnNewForm ">
        <td style="width: 100%; background-color:#e1e9ec;" colspan="4">


            <span class="new-wrap">
                <i class="fa-solid fa-plus Plus-Icon"></i>
                <span class="new-text" title="New Form">New</span>
            </span>


        </td>

    </tr>



    <tr class="LineOfItemRow  ShowOnNewClickButton" style="display:none">
        <td colspan="4" style="background:#fdf5cf">
            <table cellspacing="2" cellpadding="0" style="width: 100%" border="0" class="w-form-table" id="dynamicRows">
                            <tr>
                <td class="ftitle CloseTableNewForm"  colspan="4" style="background: #d6e4e7; border:1px solid #adc4ce;color:black">
                    <span></span>
                    <i class="fa-solid fa-rectangle-xmark cross-icon" style="float: right; cursor: pointer; margin-right: 10px; font-size: 16px;margin-top: 1.5px;" title="Close Edit Form"></i>
                </td>
            </tr>
                <tr>
                    <td class="ftitle" style="width: 20%">Transaction Type:</td>
                  
                    <td class="ftitle" style="width: 30%">
                        <input type="radio" class="Debit TransactionType" checked="checked" default="default" value="D" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label style="color:red">Debit</label>
                        <input type="radio" class="Credit TransactionType" value="C" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType"><label style="color:green">Credit</label>
                    </td>

                                    <td class="ftitle" style="width: 20%">Transaction Date:</td>
                <td class="ftitle" style="width: 30%">
                    <input type="text" groupid="LedgerManagement_FrUc" maxlength="10"
                        style="width: 150px;" class="text  date  required " argumentid="AccountTransactionDate2" />
                </td>

                </tr>

                <tr>


                    <td class="ftitle" style="width: 20%">Payment Type*:</td>
                    <td class="ftitle" style="width: 30%">
                        <select loadon="FirstVisible" valtype="value" class="dropdownlist  commonRemoveRequiredStaric " style="width: 145px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}" >
                            <option value="" selected="selected">Select Payment Type</option>
                        </select>
                    </td>

                    
                    <td class="ftitle" style="width: 20%">Amount*:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: left; width: 150px;" maxlength="199" class="text number commonRemoveRequiredStaric amountInput  "
                            groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount"  /></td>
                </tr>

                <tr class="show-on-service-select" style="display:none">
                    <td class="ftitle" style="width: 20%">Due Date:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" groupid="LedgerManagement_FrUc" maxlength="10"
                            style="width: 150px;" class="text  date   " argumentid="DueDate" />
                    </td>


                    <td class="ftitle" style="width: 20%"></td>
                    <td class="ftitle" style="width: 30%"></td>
                </tr>

                <tr class="show-on-cheque-select" style="display: none">
                    <td class="ftitle" style="width: 20%">Bank*:</td>
                    <td class="ftitle" style="width: 30%">
                        <select loadon="FirstVisible" class="dropdownlist BankNameBankNameAMT CommonRequiredClass commonRemoveRequiredStaric" style="width: 145px;"
                            groupid="LedgerManagement_FrUc" argumentid="BankNameAMT" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" >
                            <option value="" selected="selected">Select Bank</option>

                        </select>
                    </td>


                    <td class="ftitle" style="width: 20%">Cheque No.*</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number CommonRequiredClass commonRemoveRequiredStaric ChequeNoAMT"
                            groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT"  /></td>
                </tr>

                <tr class="show-on-cheque-select" style="display: none">
                    <td class="ftitle" style="width: 20%">Cheque From:</td>
                    <td class="ftitle" style="width: 30%">
                        <input type="text" style="text-align: center; width: 165px; margin-right: 4px" maxlength="100" class="text  ChequeFromAMT"
                            groupid="LedgerManagement_FrUc" alphconf="{allow:'.'}" argumentid="ChequeFromAMT" />
                    </td>


                    <td class="ftitle" style="width: 20%">Cheque Date*:</td>
                    <td class="ftitle" style="width: 30%">
                        <input argumentid="ChequeDateAMT" class="text CommonRequiredClass date ChequeDateAMT commonRemoveRequiredStaric " groupid="LedgerManagement_FrUc" maxlength="10"  style="width: 75px;" type="text" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle" style="width: 20%">Description:</td>
                    <td class="ftitle" style="width: 30%" colspan="3">


                        <textarea class="textarea" style="width: 85.5%; height: 50px; box-sizing: border-box; resize: none; vertical-align: middle;"
                            argumentid="LedgerManagementReason" groupid="LedgerManagement_FrUc"></textarea>
                    </td>


                </tr>

                <tr>


                    <td style="width: 20%;"></td>

                    <td style="width: 30%;" colspan="3">
                        <input type="button" value="  Save  " class=" INS_Row_Save_Btn ButtonStyle" ignorevalidate="LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'INS_Account_LedgerManagement_Amounts',Params:{DBAction:'InsertRow'},HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}">
                        <input type="button" value="  Cancel  " class="CloseNewForm ButtonStyle" />
                    </td>
                    <!-- Delete button -->

                </tr>

            </table>


        </td>



    </tr>





    <tr class="HideOnNewForm trTableItemRow">
        <td colspan="4">



            <div style="width: 100%; padding: 4px;">

                <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="LedegerAmountsTable">
                    <thead>
                        <tr>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 100px;">Transaction ID</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 110px;">Transaction Date</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: red; width: 90px;">Debit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: green; width: 90px;">Credit</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 95px;">Payment Type</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Status</th>
                            <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Description</th>

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
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="TotalDebitAmount" class="ftitle tofix" style="color:red"></span></td>
    </tr>
    <tr class="HideOnNewForm">
        <td class="ftitle">Total Credit:</td>
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="TotalCreditAmount" class="ftitle tofix" style="color:green"></span></td>
    </tr>
    <tr class="HideOnNewForm">
        <td class="ftitle">Diffrence:</td>
        <td colspan="3"><span groupid="LedgerManagement_FrUc" argumentid="DebitCreditDifference" class="ftitle tofix"></span></td>
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
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2" class="DataAction ButtonStyle firstSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}" />
            <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2" class="DataAction ButtonStyle secondSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}" />

            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>
