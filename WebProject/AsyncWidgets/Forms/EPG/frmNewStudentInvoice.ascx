<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmNewStudentInvoice.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.EPG.frmNewStudentInvoice" %>

<style>
    table.FormCellPadding td
    {
        padding-top:5px;
    }
.FormTable td
{
    border: 1px solid #B4B7D9;

    position: relative;
    text-align: left;   
    padding-left:4px;
        padding-right: 2px;
        padding-top: 2px;
        padding-bottom: 2px;
    }
.FormLabel
{
        color: #333333;
    font-family: Calibri;
    font-size: 12px;
        font-weight:bold;
    }
</style>
<div style="width: 100%; vertical-align: middle; text-align: center; padding-top: 4px;
    padding-bottom: 4px;">


    
                    <table class="FormTable" style=" width: 100%" cellspacing="1" >
                      <tr>
                            <td style="width:25%">
                             <span class="FormLabel">Branch</span>  
                             
                            </td>
                            <td style="width:25%;">
                               
                             <span class="FormLabel">Payment Type</span></td>
                            <td  style="width:25%">
                                <span class="FormLabel">Payment Method</span>  
                             
                            </td>
                            <td  style="width:25%;">
                                <span class="FormLabel">Amount</span></td>
                        </tr>
                      <tr>
                            <td style="width:25%">
                            <select class="PWCListBox required" requirederr="&amp;nbsp;*"  style="width: 150px ;"   groupid="StudentInvoice" argumentid="Branch">
							    <option value="" selected="selected"  valtype="val" >Select Branch</option>
                                <option value="31"  >Hawali</option>
                                <option value="32"  >Jahra</option>
                                <option value="33" >Salawa</option>
						    </select>

                          </td>
                            <td style="width:25%;">
                            <select class="PWCListBox required" requirederr="&amp;nbsp;*" style="width: 150px ;"  groupid="StudentInvoice" 
                                    argumentid="PaymentType"  valtype="val" >
							    <option value="" selected="selected" >Select Payment Type</option>
                                <option value="1">Registration Fee</option>
                                <option value="2">School Fee</option>
                               <option value="3">Books Fee</option>
						    </select></td>
                            <td  style="width:25%">
                            <select class="PWCListBox required" requirederr="&amp;nbsp;*" style="width: 150px;"   groupid="StudentInvoice" 
                                    argumentid="PaymentMethod"  >
							    <option value="" selected="selected" valtype="val">Select Method</option>
                                <option value="1">Cash</option>
                                <option value="2">KNet</option>
                               
						    </select></td>
                            <td  style="width:25%;">
                            <input type="text" groupid="StudentInvoice" argumentid="Amount" style="width: 150px ;display:"
                            class="PWCTextBox required" requirederr="&amp;nbsp;*" alt="" />
                            <input type="text"  style="width: 150px ;display:none"
                            class="PWCTextBox StudentFormId" alt="" value="1"  /></td>
                        </tr>
                         <tr>
                            <td >
                             <span class="FormLabel">Note</span>  
                             
                            </td>
                            <td style="" colspan="3">
                         <textarea  groupid="StudentInvoice" argumentid="Notes"  style="width:450px;display:"" 
                                class="PWCTextBox" cols="20" rows="3" ></textarea>
                            </td>
                        </tr>
                                                <tr>
                            <td colspan="4" style="text-align:center;">
                                  <input type="button" conf="{ActorId:'DataHelper',ActionId:'DataAction',ResetOnSuccess:true,Command:'EPG_INS_StudentInvoice'}" class="DataAction PWCButton" value="  Save  ">
                             <input type="button" class="CloseForm PWCButton" value="  Cancel  ">
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </table>


    
</div>