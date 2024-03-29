﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_PD_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_PD_FrUc" %>

<script>
// American Numbering System
var th = ['','thousand','million', 'billion','trillion'];
// uncomment this line for English Number System
// var th = ['','thousand','million', 'milliard','billion'];

    var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
    var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
    function toWords(s) {
        s = s.toString(); s = s.replace(/[\, ]/g, '');
        if (s != parseFloat(s)) return 'not a number'; var x = s.indexOf('.');
        if (x == -1) x = s.length; if (x > 15) return 'too big'; var n = s.split(''); var str = '';
        var sk = 0;
        for (var i = 0; i < x; i++)
        {
            if ((x - i) % 3 == 2)
            {
                if (n[i] == '1')
                { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; }
                else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; }
            } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; }
            if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; }
        }
        if (x != s.length)
        { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; }
        return str.replace(/\s+/g, ' ');
    }
</script>

  <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                        <tr>
                              <td width="20%" class="ftitle" valign="top">
                              <nobr>System ID</nobr>
                            </td>
                            <td width="80%">
                            <div style="float:left;width:300px"> 
                              <input type="text" style="text-align:center; width:150px; font-weight:bold; background-color:#F1F1F1"  maxlength="50" class="text AlwaysDisable"
                                    groupid="Rental_Payments" argumentid="LocationReceiptId" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <nobr style="font-style:italic; font-weight:bold; float:right">Manual ID:</nobr></div>
                                    &nbsp;
                                 <input type="text" style="text-align:center; width:150px; font-weight:bold"  maxlength="10" class="text number"
                                    groupid="Rental_Payments" argumentid="ReceiptId" />

                                    <div style="display:none"><span groupid="Rental_Payments" argumentid="ParentRecId"></span>
                                    <span groupid="Rental_Payments" argumentid="RecId"></span>
                                    
                                    </div>

                              
                                    </td>
                        </tr>

                                                                    <tr>
                            <td class="ftitle">
                                <nobr>Payment Date*:</nobr>
                            </td>
                            <td>
                                  <input type="text" groupid="Rental_Payments" maxlength="10"
                                   style="width:150px;"  class="text date" argumentid="PaymentDate" /> 
                            </td>
                        </tr>

                                                                    <tr>
                            <td class="ftitle">
                                <nobr>Payment Type*:</nobr>
                            </td>
                            <td class="ftitle">
                               <input type="radio" checked="checked" default="default" value="0" name="PaymentType" groupid="Rental_Payments" argumentid="PaymentType"><label>Receipt</label>
                               <input type="radio" value="1" name="PaymentType" groupid="Rental_Payments" argumentid="PaymentType"><label>Return</label>
                            </td>
                        </tr>

                        <tr>
                            <td class="ftitle">
                                <nobr>Payment Mode*:</nobr>
                            </td>
                            <td>
                             <div style="float:left;width:300px">
                                        <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="Rental_Payments" argumentid="PaymentMode" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                            <option value="" selected="selected">Select Payment Mode</option>
                    </select>
                     &nbsp;&nbsp;&nbsp;&nbsp;

                                    <nobr style="font-style:italic; font-weight:bold;float:right" class="ChequeNo">Cheque No:</nobr></div>
                                     &nbsp;
                                                 <input type="text" style="text-align:center;width:150px;"  maxlength="50" class="text number ChequeNo"
                                    groupid="Rental_Payments" argumentid="ChequeNo" />
                            </td>
                        </tr>

                                                <tr>
                            <td class="ftitle">
                                <nobr>Payment Amount*:</nobr>
                            </td>
                            <td>
                                    <div style="float:left;width:300px"> <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text number"
                                    groupid="Rental_Payments" alphconf="{allow:'.'}"  argumentid="PaymentAmount" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                    <nobr style="font-style:italic; font-weight:bold;float:right">Amount In Words:</nobr></div>
                                    &nbsp;
                                      <input type="text" style="text-align:center;width:400px; background-color:#F1F1F1"  maxlength="255" class="text AlwaysDisable"
                                    groupid="Rental_Payments" argumentid="AmountInWords" />
                            </td>
                        </tr>
                     
                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                                   <tr>
                              <td class="ftitle" valign="top">
                              <nobr>Comments:</nobr>
                            </td>
                            <td >
                              <textarea class="textarea" rows="4" wrap="1" style="width:707px" argumentid="PaymentComments" groupid="Rental_Payments" ></textarea></td>
                        </tr>

                               <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td>
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts_Payments',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>
                    </table>


