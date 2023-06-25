<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewButtonChild.ascx.cs" Inherits="WebProject.Pages.Common.Administration.AddNewButtonChild" %>

<div style="text-align: center; margin: 0; background: #EEEEFF; padding: 10px;">
    <center>
        <table cellspacing="2" style="width: 100%" class="w-form-table">
            <tbody>
                <tr>
                    <td style="width: 25%; white-space: nowrap;" class="ftitle">City Name:</td>
                    <td style="width: 75%">
                        <input type="text" groupid="AddNewButtonChild" argumentid="CityName" style="width: 225px;"
                            class="text required" alt="" />
                        <div style="display: none">
                            <span groupid="AddNewButtonChild" argumentid="CityId"></span>
                            <span groupid="AddNewButtonChild" argumentid="CountryId"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="2" class="w-form-button-panel">
                        <div class="bgdiv">
                            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'Test_City'}" />
                            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle " />
                            <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm" />
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</div>