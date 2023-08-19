<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_OC_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_OC_FrUc" %>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                        <tr>
                              <td width="20%" class="ftitle" valign="top">
                              <nobr>Description*:</nobr>
                            </td>
                            <td width="80%">
                             <div style="display:none"><span groupid="Rental_OtherCharges" argumentid="RecId"></span></div>
                                    <div style="display:none"><span groupid="Rental_OtherCharges" argumentid="ParentRecId"></span></div>
                              <textarea class="textarea" rows="6" wrap="1" cols="60" argumentid="Description" groupid="Rental_OtherCharges" ></textarea></td>
                        </tr>

                       <tr>
                              <td class="ftitle" >
                              <nobr>Amount*:</nobr>
                            </td>
                            <td>
                            <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text number"
                                    groupid="Rental_OtherCharges" alphconf="{allow:'.'}"  argumentid="Charges" />
                                </td>
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
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_OtherCharges',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>
                    </table>