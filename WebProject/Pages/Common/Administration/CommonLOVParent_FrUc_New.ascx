<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonLOVParent_FrUc_New.ascx.cs" Inherits="WebProject.Pages.Common.Administration.CommonLOVParent_FrUc_New" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                        <tr>
                            <td style="width:25%; white-space:nowrap;" class="PWCLabel">Type Name</td>
                            <td style="width:75%">
                            <input type="text" groupid="NewCommonLOVParent" argumentid="TypeName" style="width: 225px ;display:"
                            class="PWCTextBox required" alt="" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_INS_Common_LOV_Parent'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>