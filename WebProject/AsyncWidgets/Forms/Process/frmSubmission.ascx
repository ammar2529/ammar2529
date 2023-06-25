<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSubmission.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmSubmission" %>

<table style="width: 98%; height: 100%; margin-left: 7px" border="0">
    <tr>
        <!-- ,Params:[{Name:'OrganizationId'},{Name:'FormType'}] -->
        <td valign="top" style="height: 20px">
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                <tr class="AgilityRowSpacerTop">
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr class="IsCond">
                    <td style="white-space: nowrap" colspan="3">
                        <%-- <input  type="checkbox"  argumentid="IsCommonInfo" groupid="ProcessGS"  />
                        &nbsp;<span class="PWCLabel">Common Profile</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        --%>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="N" />&nbsp;<span class="PWCLabel">Normal Submission</span>
                                </td>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="I" />&nbsp;<span class="PWCLabel">Logged User</span>
                                </td>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="D" />&nbsp;<span class="PWCLabel">AD Direct Manager</span>
                                </td>
                                <td style="white-space: nowrap">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="DR" />&nbsp;<span class="PWCLabel">AD Direct Manager of Requestor</span>
                                </td>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="R" />&nbsp;<span class="PWCLabel">Rule Based</span>
                                </td>
                                <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="Y" />&nbsp;<span class="PWCLabel">Logical Actor</span>
                                </td>
                                 <td style="white-space: nowrap">
                                    <input argumentid="IsConditional" groupid="SubmissionService" name="IsConditional"
                                        type="radio" value="Other" />&nbsp;<span class="PWCLabel">Other</span>
                                </td>
                            </tr>
                        </table>
                        <center><div style="width:98%"><hr noshade="noshade" style="height:1px;" /></div></center>
                    </td>
                </tr>
<%--                <tr>
                    <td class="AgilityRowSpacer" colspan="3">
                    </td>
                </tr>--%>
                <tr class="IsCondOther" style="display:none">
                    <td style="white-space: nowrap;padding-bottom:4px;" colspan="3">
                        <div class="PWCLabel" style="width: 75px;display:inline-block">Is Conditional</div>
                        <input type="text" groupid="SubmissionService"
                            argumentid="IsConditionalOther" style="width: 175px;" 
                            requirederr="&amp;nbsp;*" class="PWCTextBox required"
                            alt="">
                    </td>

                </tr>
                <tr class="ActorStepId" style="display:none;">
                    <td style="white-space: nowrap"  colspan="3">
                        <div class="PWCLabel"  style="width: 75px;display:inline-block">Actor Step Id</div>
                        <input type="text" groupid="SubmissionService"
                            argumentid="ActorStepId" style="width: 175px;" requirederr="&amp;nbsp;*" 
                            class="PWCTextBox required" alt="">
                    </td>

                </tr>
                <tr>
                    <td class="AgilityRowSpacer">
                        &nbsp;
                    </td>
                    <td style="white-space: nowrap">
                        &nbsp;
                    </td>
                    <td style="white-space: nowrap">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <input type="button" value="     Save     " class="PWCButton DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_NewProcessRole',ActionType:'RowIns',ResetOnSuccess:true}" />
                        <select argumentid="SubmissionId" groupid="SubmissionService" valtype="val" name="ddlRoles"
                            class="PWCListBox" size="5" style="width: 200px; height: 325px; display: none;"
                            storeinfo="{Command:'ADM_Sel_SubmissionServices',TextCol:'CalledActionId',ValCol:'SubmittionServiceId',ItemExtraAttrs:['ActorStepId','IsConditional','IsOrganizationDependent']}">
                        </select>
                    </td>
                    <td style="white-space: nowrap">
                        &nbsp;
                    </td>
                    <td style="white-space: nowrap">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>