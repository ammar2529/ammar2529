<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.LedgerManagement_FrUc" %>

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


            <div id="trNote">
<%--                <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory--%>

            <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="RecId"></span></div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="BenificiaryId"></span></div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="AmountRecId"></span></div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="DueDateSetInCtrl"></span></div>

                    <div style="display: none">
                        <input groupid="LedgerManagement_FrUc" argumentid="BankNameAMT2">
                    </div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeFromAMT"></span></div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT"></span></div>
                    <div style="display: none"><span groupid="LedgerManagement_FrUc" argumentid="ChequeDateAMT"></span></div>
              <%--  </td>--%>
            </div>


            <div class="row mb-2  trTransaction">
                <!-- Contract No. -->
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 mb-2 mb-md-0">
                    <div class="form-floating">
                        <input type="text" class="form-control-plaintext text-danger " id="LedgerID" groupid="LedgerManagement_FrUc"
                            argumentid="LedgerManagementRecCode" value="New contract no. will be generated on saving" placeholder="Ledger ID" readonly>
                        <label for="LedgerID">Ledger ID:</label>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="date" class="form-control  date " id="LedgerDate" groupid="LedgerManagement_FrUc" argumentid="TransactionDate">
                        <label for="LedgerDate">Ledger Date:</label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test" groupid="LedgerManagement_FrUc" argumentid="test" disabled="disabled">
                        <label for="test"></label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test2" groupid="LedgerManagement_FrUc" argumentid="test2" disabled="disabled">
                        <label for="test2"></label>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control required validateunique" id="LedgerTitle" primarykey="RecId"
                        storeid="Account_LedgerManagement" uniquenotfound="{en:' Name is valid...',color:'green'}"
                        uniquefound="{en:' Duplicate Name...',color:'red'}" groupid="LedgerManagement_FrUc" argumentid="LedgerTitle" placeholder="Title">
                        <label for="LedgerTitle">Title:</label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test3" groupid="LedgerManagement_FrUc" argumentid="test4" disabled="disabled">
                        <label for="test3"></label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test4" groupid="LedgerManagement_FrUc" argumentid="" disabled="disabled">
                        <label for="test4"></label>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text  LOVPopup text text-danger required" id="BeneficiaryCode" groupid="LedgerManagement_FrUc" lovpopupid="LedgerManagementPopup"
                            argumentid="BeneficiaryCode" placeholder="Beneficiary Code*" requirederr=' *'>
                        <label for="BeneficiaryCode" class="CompanyTD">Beneficiary Code*</label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test5" groupid="LedgerManagement_FrUc" argumentid="test5" disabled="disabled">
                        <label for="test5"></label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="test6" groupid="LedgerManagement_FrUc" argumentid="test6" disabled="disabled">
                        <label for="test6"></label>
                    </div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="BeneficiaryType" groupid="LedgerManagement_FrUc" 
                            argumentid="BeneficiaryType" placeholder="Beneficiary Type" disabled="disabled">
                        <label for="BeneficiaryType" >Beneficiary Type</label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="NationalIDNo" groupid="LedgerManagement_FrUc" argumentid="NationalIDNo" disabled="disabled" placeholder="National ID No.">
                        <label for="NationalIDNo">National ID No.</label>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="CompanyName" groupid="LedgerManagement_FrUc" argumentid="CompanyName" placeholder="Company Name" disabled="disabled">
                        <label for="CompanyName">Company Name</label>
                    </div>
                </div>
            </div>


            <div class="row mb-2">
                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="MobileTelephone1" groupid="LedgerManagement_FrUc"
                            argumentid="MobileTelephone1" placeholder="Mobile Telephone" disabled="disabled">
                        <label for="MobileTelephone1">Mobile Telephone</label>
                    </div>
                </div>

                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="PersonName" groupid="LedgerManagement_FrUc" argumentid="PersonName" disabled="disabled" placeholder="Person Name">
                        <label for="PersonName">Person Name</label>
                    </div>
                </div>

                <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="Address" groupid="LedgerManagement_FrUc" argumentid="CompanyName" placeholder="Address" disabled="disabled">
                        <label for="Address">Address</label>
                    </div>
                </div>
            </div>
         
    <%--        
            <tr class="LineOfItemTestRow testTR removeOnEditMode" style="display: none">
                <td colspan="8">
                    <div></div>
                    <table cellspacing="2" cellpadding="0" style="width: 99%; margin: 5px" class="w-form-table" id="dynamicRowss">
                        <tr>
                            <td class="ftitle CloseTableEditForm" colspan="4" style="background: #d6e4e7; border: 1px solid #adc4ce; color: black">
                                <span>Edit Transection Detail</span>
                                <i class="fa-solid fa-rectangle-xmark cross-icon" style="float: right; cursor: pointer; margin-right: 10px; font-size: 16px; margin-top: 1.5px;" title="Close Edit Form"></i>
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
                                <input type="radio" class="Debit" checked="checked" default="default" value="D" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2"><label style="color: red">Debit</label>
                                <input type="radio" class="Credit" value="C" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2"><label style="color: green">Credit</label>
                            </td>

                            <td class="ftitle" style="width: 20%">Transaction Date:</td>
                            <td class="ftitle" style="width: 30%">
    

                                <div><span groupid="LedgerManagement_FrUc" argumentid="AccountTransactionDate2" class="ftitle"></span></div>

                            </td>

                        </tr>
                        <tr>

                            <td class="ftitle" style="width: 20%">Payment Type*:</td>
                            <td class="ftitle" style="width: 30%">
                                <select loadon="FirstVisible" class="dropdownlist requiredElem PaymentTypeDD" style="width: 155px;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType2"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}">
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
                                <select loadon="FirstVisible" class="dropdownlist BankNameBankNameAMT2 CommonRequiredClass2 commonRemoveRequiredStaric2" style="width: 155px;"
                                    groupid="LedgerManagement_FrUc" argumentid="BankNameAMT2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" name="D1">
                                    <option value="" selected="selected">Select Bank</option>

                                </select>
                            </td>


                            <td class="ftitle" style="width: 20%">Cheque No.*</td>
                            <td class="ftitle" style="width: 30%">
                                <input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number CommonRequiredClass2 commonRemoveRequiredStaric2 ChequeNoAMT2"
                                    groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT2" /></td>
                        </tr>

                        <tr class="show-on-cheque-select" style="display: none">
                            <td class="ftitle" style="width: 20%">Cheque From:</td>
                            <td class="ftitle" style="width: 30%">
                                <input type="text" style="text-align: center; width: 150px; margin-right: 4px" maxlength="100" class="text  ChequeFromAMT2"
                                    groupid="LedgerManagement_FrUc" alphconf="{allow:'.'}" argumentid="ChequeFromAMT2" />
                            </td>


                            <td class="ftitle" style="width: 20%">Cheque Date*:</td>
                            <td class="ftitle" style="width: 30%">
                                <input argumentid="ChequeDateAMT2" class="text CommonRequiredClass2 date ChequeDateAMT2 commonRemoveRequiredStaric2 " groupid="LedgerManagement_FrUc" maxlength="10" style="width: 150px;" type="text" />
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
            </tr>--%>



        <%-------------------------------------------------------------------------------------Edit Form---------------------------------------------------------------------------------------------------------%>
<div class="LineOfItemTestRow testTR removeOnEditMode p-3" style="display: none">
    <div class="container-fluid p-0">
        <div class="card w-form-table w-100 m-0" id="dynamicRowss">
            <div class="card-header ftitle CloseTableEditForm" style="background: #d6e4e7; border: 1px solid #adc4ce; color: black;">
                <span>Edit Transaction Detail</span>
                <i class="fa-solid fa-rectangle-xmark cross-icon" style="float: right; cursor: pointer; margin-right: 10px; font-size: 16px; margin-top: 1.5px;" title="Close Edit Form"></i>
            </div>
            <div class="card-body" style="background:white">
                <div class="row">
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" class="ftitle form-control" style="width: 100%;" groupid="LedgerManagement_FrUc" argumentid="TransactionID2" disabled />
                            <label>Transaction ID</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="ftitle col-12 col-lg-6">
                        <label>Transaction Type:</label>
                        <div class="form-check form-check-inline">
                            <input type="radio" class="Debit form-check-input" checked="checked" default="default" value="D" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2">
                            <label class="form-check-label" style="color: red">Debit</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="radio" class="Credit form-check-input" value="C" name="TransactionType2" groupid="LedgerManagement_FrUc" argumentid="TransactionType2">
                            <label class="form-check-label" style="color: green">Credit</label>
                        </div>
                    </div>
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" class="ftitle form-control" style="width: 100%;" groupid="LedgerManagement_FrUc" argumentid="AccountTransactionDate2" disabled />
                            <label>Transaction Date</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <select loadon="FirstVisible" class="dropdownlist requiredElem PaymentTypeDD form-select" style="width: 100%;" groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}">
                                <option value="" selected="selected">Select Payment Type</option>
                            </select>
                            <label>Payment Type*</label>
                        </div>
                    </div>
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" style="text-align: left; width: 100%;" maxlength="199" class="text number amountInput requiredElem form-control" groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount2" requirederr='*' />
                            <label>Amount*</label>
                        </div>
                    </div>
                </div>
                <div class="row show-on-service-select" style="display: none">
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" groupid="LedgerManagement_FrUc" maxlength="10" style="width: 100%;" class="text date form-control" argumentid="DueDate2" />
                            <label>Due Date</label>
                        </div>
                    </div>
                </div>
                <div class="row show-on-cheque-select" style="display: none">
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <select loadon="FirstVisible" class="dropdownlist BankNameBankNameAMT2 CommonRequiredClass2 commonRemoveRequiredStaric2 form-select" style="width: 100%;" groupid="LedgerManagement_FrUc" argumentid="BankNameAMT2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" name="D1">
                                <option value="" selected="selected">Select Bank</option>
                            </select>
                            <label>Bank*</label>
                        </div>
                    </div>
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" style="text-align: center; width: 100%;" maxlength="50" class="text number CommonRequiredClass2 commonRemoveRequiredStaric2 ChequeNoAMT2 form-control" groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT2" />
                            <label>Cheque No.*</label>
                        </div>
                    </div>
                </div>
                <div class="row show-on-cheque-select" style="display: none">
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" style="text-align: center; width: 100%; margin-right: 4px" maxlength="100" class="text ChequeFromAMT2 form-control" groupid="LedgerManagement_FrUc" alphconf="{allow:'.'}" argumentid="ChequeFromAMT2" />
                            <label>Cheque From</label>
                        </div>
                    </div>
                    <div class="ftitle col-12 col-lg-6">
                        <div class="form-floating">
                            <input type="text" argumentid="ChequeDateAMT2" class="text CommonRequiredClass2 date ChequeDateAMT2 commonRemoveRequiredStaric2 form-control" groupid="LedgerManagement_FrUc" maxlength="10" style="width: 100%;" />
                            <label>Cheque Date*</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="ftitle col-12 col-lg-6">
                        <label>Description:</label>
                        <textarea class="textarea form-control" style="width: 100%; height: 50px; box-sizing: border-box; resize: none; vertical-align: middle;" argumentid="LedgerManagementReason2" groupid="LedgerManagement_FrUc"></textarea>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-12">
                        <input type="button" value="  Save  " ignorevalidate="LedgerManagementAmount AccountsPaymentType" class="UPD_Row_Save_Btn ButtonStyle btn btn-primary" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement_Amounts',Params:{DBAction:'UpdateRow'},HideOnSuccess:false,Requery:true,GroupId:'LedgerManagement_FrUc'}">
                        <input type="button" value="  Cancel  " id="CloseTableEditForm" class="CloseTableEditForm ButtonStyle btn btn-secondary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <%-------------------------------------------------------------------------------------End of Edit Form---------------------------------------------------------------------------------------------------------%>



        <div class="card shadow-sm border-0 mb-3 mt-4">
            <div class="card-body bg-light p-3">
                <div class="row new-wrap HideOnNewForm col-12">
                    <div class="d-flex align-items-center gap-2">
                        <i class="fa-solid fa-plus Plus-Icon "></i>
                        <span class="new-text fw-bold" title="New Form">New</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="LineOfItemLedgerRow ShowOnNewClickButton   bg-warning-subtle p-3 rounded mb-3" style="display: none">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-3 ">
                    <div class="row mb-2">
                        <div class="col-12 ftitle CloseTableNewForm bg-info-subtle border border-info text-dark p-2 rounded">
                            <span></span>
                            <i class="fa-solid fa-rectangle-xmark cross-icon float-end" style="cursor: pointer; margin-right: 10px; font-size: 16px;" title="Close Edit Form"></i>
                        </div>
                    </div>

                    <!-- Transaction type and Date -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6  align-self-end">
                            <label for="floatingLimited" class="me-3">
                                <small>Transaction Type</small>
                            </label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input  Debit TransactionType" type="radio" checked="checked" default="default" id="Debit" value="D" name="TransactionType"
                                        groupid="LedgerManagement_FrUc" argumentid="TransactionType">
                                    <label class="form-check-label" for="Debit" style="color: red">Debit</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input Credit TransactionType" type="radio" value="C" id="Credit" name="TransactionType" groupid="LedgerManagement_FrUc" argumentid="TransactionType">
                                    <label class="form-check-label" for="Credit" style="color: green">Credit</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 ">
                            <div class="form-floating">
                                <input type="date" class="form-control  date required" id="TransactionDate" placeholder="Transaction Date"
                                    maxlength="10" groupid="LedgerManagement_FrUc" argumentid="AccountTransactionDate2" />
                                <label for="TransactionDate">Transaction Date</label>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Type -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 ">
                            <div class="form-floating">
                                <select loadon="FirstVisible" class="form-select dropdownlist commonRemoveRequiredStaric" id="PaymentType"
                                    groupid="LedgerManagement_FrUc" argumentid="AccountsPaymentType"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'46'}]}">
                                    <option value="" selected>Select Payment Type</option>
                                </select>
                                <label for="PaymentType">Payment Type</label>
                            </div>
                        </div>

                        <!-- Amount -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <input type="text" class="form-control text number commonRemoveRequiredStaric amountInput" id="Amount"
                                    placeholder="Amount" maxlength="199" groupid="LedgerManagement_FrUc" argumentid="LedgerManagementAmount" />
                                <label for="Amount">Amount</label>
                            </div>
                        </div>
                    </div>

                    <div class="row show-on-service-select" style="display: none">
                        <!-- Due Date -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <input type="date" class="form-control  date" id="DueDate" placeholder="Due Date"
                                    maxlength="10" groupid="LedgerManagement_FrUc" argumentid="DueDate" />
                                <label for="DueDate">Due Date</label>
                            </div>
                        </div>

                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <%--                            <div class="form-floating">
                                <input type="text" class="form-control  " id="ts" placeholder=""
                                    maxlength="10" groupid="LedgerManagement_FrUc" argumentid="" disabled="disabled" />
                                <label for="ts"></label>
                            </div>--%>
                        </div>

                    </div>

                    <div class="row show-on-cheque-select" style="display: none">
                        <!-- Bank -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <select loadon="FirstVisible" class="form-select dropdownlist BankNameBankNameAMT CommonRequiredClass commonRemoveRequiredStaric"
                                    id="BankName" groupid="LedgerManagement_FrUc" argumentid="BankNameAMT"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}">
                                    <option value="" selected>Select Bank</option>
                                </select>
                                <label for="BankName">Bank</label>
                            </div>
                        </div>

                        <!-- Cheque No -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <input type="text" class="form-control text number CommonRequiredClass commonRemoveRequiredStaric ChequeNoAMT"
                                    id="ChequeNoLDR" placeholder="Cheque No" maxlength="50" groupid="LedgerManagement_FrUc" argumentid="ChequeNoAMT" />
                                <label for="ChequeNoLDR">Cheque No</label>
                            </div>
                        </div>
                    </div>

                    <div class="row show-on-cheque-select" style="display: none">
                        <!-- Cheque From -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <input type="text" class="form-control text ChequeFromAMT" id="ChequeFrom" placeholder="Cheque From"
                                    maxlength="100" groupid="LedgerManagement_FrUc" alphconf="{allow:'.'}" argumentid="ChequeFromAMT" />
                                <label for="ChequeFrom">Cheque From</label>
                            </div>
                        </div>

                        <!-- Cheque Date -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-floating">
                                <input type="date" class="form-control  CommonRequiredClass date ChequeDateAMT commonRemoveRequiredStaric"
                                    id="ChequeDate" placeholder="Cheque Date" maxlength="10" groupid="LedgerManagement_FrUc" argumentid="ChequeDateAMT" />
                                <label for="ChequeDate">Cheque Date</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <!-- Description -->
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea class="form-control textarea" id="Description" placeholder="Description"
                                    style="height: 100px; resize: none;" argumentid="LedgerManagementReason" groupid="LedgerManagement_FrUc"></textarea>
                                <label for="Description">Description</label>
                            </div>
                        </div>
                    </div>


                    <!-- Buttons -->
                    <div class="row">
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary INS_Row_Save_Btn ButtonStyle w-100"
                                ignorevalidate="LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2">
                                <i class="fa fa-save me-1"></i>Save
       
                            </button>
                        </div>

                        <div class="col-6">
                            <button type="button" class="btn btn-secondary CloseNewForm ButtonStyle w-100">
                                <i class="fa fa-times me-1"></i>Cancel
       
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


  





        <div class="row HideOnNewForm trTableItemRow">


            <table class="table table-hover table-bordered shadow-sm rounded LedegerAmountsTable" >
                <thead class="table-dark">
                    <tr>
                        <th >Transaction ID</th>
                        <th >Transaction Date</th>
                        <th >Debit</th>
                        <th >Credit</th>
                        <th >Payment Type</th>
                        <th >Status</th>
                        <th >Description</th>
                        <th ></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                    <tr class="NoRecordsTR">
                        <td class="NoRecords w-grid-norecords-msg" colspan="8">
                            <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage alert alert-info">No records available.</div>
                        </td>
                    </tr>
                </tfoot>
            </table>


        </div>



        <div class="row HideOnNewForm mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating ">
                    <input type="text" class="form-control tofix " id="TotalDebitAmount" groupid="LedgerManagement_FrUc" argumentid="TotalDebitAmount" style="color: red" disabled>
                    <label for="TotalDebitAmount">Total Debit</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="testa" groupid="LedgerManagement_FrUc" argumentid="testa" disabled="disabled">
                    <label for="testa"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="testb" groupid="LedgerManagement_FrUc" argumentid="testb" disabled="disabled">
                    <label for="testb"></label>
                </div>
            </div>
        </div>

        <div class="row HideOnNewForm mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating ">
                    <input type="text" class="form-control tofix " id="TotalCreditAmount" groupid="LedgerManagement_FrUc" argumentid="TotalCreditAmount" style="color: green" disabled>
                    <label for="TotalCreditAmount">Total Credit</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="testc" groupid="LedgerManagement_FrUc" argumentid="testb" disabled="disabled">
                    <label for="testc"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="testd" groupid="LedgerManagement_FrUc" argumentid="testc" disabled="disabled">
                    <label for="testd"></label>
                </div>
            </div>
        </div>

        <div class="row HideOnNewForm mb-2">
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="form-floating ">
                    <input type="text" class="form-control tofix " id="DebitCreditDifference" groupid="LedgerManagement_FrUc" argumentid="DebitCreditDifference" style="color: green" disabled>
                    <label for="DebitCreditDifference">Diffrence</label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="teste" groupid="LedgerManagement_FrUc" argumentid="teste" disabled="disabled">
                    <label for="teste"></label>
                </div>
            </div>

            <div class="col-lg-4 col-xl-4 d-none d-lg-block">
                <div class="form-floating">
                    <input type="text" class="form-control" id="testf" groupid="LedgerManagement_FrUc" argumentid="testf" disabled="disabled">
                    <label for="testf"></label>
                </div>
            </div>
        </div>




            <tr>
                <td>
                    <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                </td>
                <td colspan="4">
                    <button type="button"  ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2" class="btn btn-primary DataAction ButtonStyle firstSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:true,Requery:false,GroupId:'LedgerManagement_FrUc'}">Save</button>
                    <input type="button" value="  Save  " style="width: 60px;" ignorevalidate="LedgerManagementAmount AccountsPaymentType LedgerManagementAmount2 AccountsPaymentType2 AccountTransactionDate2" class="DataAction ButtonStyle secondSaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_Account_LedgerManagement',HideOnSuccess:true,Requery:false,GroupId:'LedgerManagement_FrUc'}" />
                    <input type="button" value="  Print  " style="width: 60px; display: none" class="ButtonStyle PrintBtn  " />
                    <input type="button" value="  Cancel  " style="width: 60px;" class="CloseForm ButtonStyle" />
                </td>
            </tr>
        

    </div>
</div>

