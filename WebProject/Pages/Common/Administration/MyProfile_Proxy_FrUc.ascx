<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyProfile_Proxy_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.MyProfile_Proxy_FrUc" %>

<div class="proxy-form">
    <form id="frmMyProfileProxy" class="w-form">
        <!-- Hidden Fields -->
        <div style="display: none;">
            <span groupid="MyProfile_Proxy" argumentid="RecId"></span>
            <span groupid="MyProfile_Proxy" argumentid="ProxyUserId"></span>
        </div>

        <!-- Proxy User -->
        <div class="form-floating">
            <input type="text" class="form-control text required AutoComplete" id="proxyUser" groupid="MyProfile_Proxy" argumentid="Name"
                conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_AutoComplete',QueryId:'Users',ACParams:{minChars:2,mustMatch:true,autoFill:false,width:225},ArgToSet:[{Index:1,Name:'ProxyUserId'}]}">
            <label for="proxyUser">Proxy User</label>
        </div>

        <!-- Is Disabled -->
        <div class="form-group row">
            <label class="col-sm-3 col-form-label form-label">Is Disabled:</label>
            <div class="col-sm-9">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="IsDisabled" id="isDisabledNo" value="0" checked="checked" groupid="MyProfile_Proxy" argumentid="IsDisabled">
                    <label class="form-check-label" for="isDisabledNo">No</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="IsDisabled" id="isDisabledYes" value="1" groupid="MyProfile_Proxy" argumentid="IsDisabled">
                    <label class="form-check-label" for="isDisabledYes">Yes</label>
                </div>
            </div>
        </div>

        <!-- Buttons -->
        <div class="form-group row">
            <div class="col-sm-12 text-center">
                <input type="button" value="Save" class="DataAction ButtonStyle"
                    conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_Users_MyProfile_Proxy'}">
                <input type="button" value="Cancel" class="CloseForm ButtonStyle">
                <input type="button" value="Cancel" class="ButtonStyle WidgetAction"
                    conf="{ActionId:'HideForm'}">
            </div>
        </div>
    </form>
</div>

<%--<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                        <tr>
                            <td style="width: 25%; white-space: nowrap;" class="ftitle">
                                Proxy User:
                            </td>
                            <td style="width: 75%">
                                <input type="text" groupid="MyProfile_Proxy" argumentid="Name" style="width: 225px;"
                                    class="text required AutoComplete" alt=""  conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_AutoComplete',QueryId:'Users',ACParams:{minChars:2,mustMatch:true,autoFill:false,width:225},ArgToSet:[{Index:1,Name:'ProxyUserId'}]}"/>

                                <div style="display: none">
                                    <span groupid="MyProfile_Proxy" argumentid="RecId"></span>
                                    <span groupid="MyProfile_Proxy" argumentid="ProxyUserId"></span>
                                </div>
                                
                            </td>
                        </tr>

                                         <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="MyProfile_Proxy" argumentid="IsDisabled"><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="MyProfile_Proxy" argumentid="IsDisabled"><label>Yes</label>
                    </td>
                </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                             <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_Users_MyProfile_Proxy'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>--%>