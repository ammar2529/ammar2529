<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_PD_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_PD_FrUc" %>


<style type="text/css">
    .auto-style1 {
        float: left;
        width: 194px;
    }
    .auto-style2 {
        float: left;
        width: 290px;
    }
</style>


<script type="text/javascript" src="../../../Scripts/eForms/iRental/SalesContracts.js">

</script>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>
    <tr>
        <td width="20%" class="ftitle" valign="top">
            <nobr>System ID</nobr>
        </td>
        <td width="80%">
            <div style="float: left; width: 300px">
                <input type="text" style="text-align: center; width: 150px; font-weight: bold; background-color: #F1F1F1" maxlength="50" class="text AlwaysDisable"
                    groupid="Sales_Payments" argumentid="LocationReceiptId" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <nobr style="font-style: italic; font-weight: bold; float: right">Manual ID:</nobr>
            </div>
            &nbsp;
                                 <input type="text" style="text-align: center; width: 150px; font-weight: bold" maxlength="10" class="text number"
                                     groupid="Sales_Payments" argumentid="ReceiptId" />


            <div style="display: none">
                <span groupid="Sales_Payments" argumentid="ParentRecId"></span>
                <span groupid="Sales_Payments" argumentid="RecId"></span>
            </div>


        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Date*:</nobr>
        </td>
        <td>
            <input type="text" groupid="Sales_Payments" maxlength="10"
                style="width: 150px;" class="text date" argumentid="PaymentDate" />
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Type*:</nobr>
        </td>
        <td class="ftitle">
            <input type="radio" checked="checked" default="default" value="0" name="PaymentType" groupid="Sales_Payments" argumentid="PaymentType"/><label>Receipt</label>
            <input type="radio" value="1" name="PaymentType" groupid="Sales_Payments" argumentid="PaymentType"/><label>Return</label>
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Mode*:</nobr>
        </td>
        <td>
            <div class="auto-style1">
                <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                    groupid="Sales_Payments" argumentid="PaymentMode" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                    <option value="" selected="selected">Select Payment Mode</option>
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;

                                   

            </div>
             
            &nbsp;
            
              <div class="auto-style2 a">
                  
            <nobr style="font-style: italic; font-weight: bold;" float="left" class="BankName">Bank:</nobr>
                  
            <select loadon="FirstVisible" class="dropdownlist BankName" style="width: 155px; margin-left: 5px;"
                groupid="Sales_Payments" requirederr='*' argumentid="BankName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'43'}]}">
                <option value="" selected="selected"  >Select Bank</option>
                
            </select>
                  <nobr style="font-style: italic; font-weight: bold; class="ChequeNo a">Cheque No:</nobr></div>
            
            <div style="float: left;">
                  &nbsp;<input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number ChequeNo"
                                                     groupid="Sales_Payments" argumentid="ChequeNo"  requirederr='*'/>
            </div>

              

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Amount*:</nobr>
        </td>
        <td>
            <div style="float: left; width: 300px">
                <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number reqField"
                    groupid="Sales_Payments" alphconf="{allow:'.'}" requirederr='*' argumentid="PaymentAmount" />
                &nbsp;&nbsp;&nbsp;&nbsp;

                                    <nobr style="font-style: italic; font-weight: bold; float: right">Amount In Words:</nobr>
            </div>
            &nbsp;
                                      <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable" />

            <%--                                <input type="hidden" name="ParentRecId"  groupid="Sales_Payments" argumentid="ParentRecId"  />--%>
            <%--                                        <input type="hidden" name="RecId"  groupid="Sales_Payments" argumentid="RecId"  />--%>
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>
    <tr>
        <td class="ftitle" valign="top">
            <nobr>Comments:</nobr>
        </td>
        <td>
            <textarea class="textarea" rows="4" wrap="1" style="width: 707px" argumentid="PaymentComments" groupid="Sales_Payments"></textarea></td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif"/>
        </td>
        <td>
            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_Payments',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>



</table>


