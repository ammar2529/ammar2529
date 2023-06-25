<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KPI_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.KPI_FrUc" %>

<div style="text-align:center;margin:0; background:#EEEEFF;padding:10px;">
<center>
                    <table cellspacing="2" style="width: 100%" class="w-form-table">
					<tbody>
                        <tr>
                            <td style="width:25%; white-space:nowrap;" class="ftitle">KPI Name:</td>
                            <td style="width:75%">
                            <input type="text" groupid="KPI" argumentid="KPIName" style="width: 225px;"
                            class="text required" alt="" />
                              <div style="display: none">
                            <span groupid="KPI" argumentid="RecId"></span>
                        </div>
                            </td>
                        </tr>

                                                                     <tr>
                    <td class="ftitle">
                        <nobr>Container Name:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="KPI" argumentid="ContainerName" style="width: 225px;"
                            class="text required" alt="" />
                    </td>
                </tr>

                                        <tr>
                    <td class="ftitle">
                        <nobr>Query Type:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="P" name="QueryType"
                                            groupid="KPI" argumentid="QueryType"><label>Common</label>
                                        <input type="radio" value="C" name="QueryType" groupid="KPI" argumentid="QueryType"><label>Custom SP</label>
                                        <input type="radio" value="Q" name="QueryType" groupid="KPI" argumentid="QueryType"><label>Query</label>


                                       
                    </td>
                </tr>

                             <tr>
                    <td class="ftitle">
                        <nobr>Query:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="KPI" argumentid="Query" style="width: 425px;"
                            class="text required" alt="" />
                    </td>
                </tr>

                            <tr>
                    <td class="ftitle">
                        <nobr>Table Name:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="KPI" argumentid="TableName" style="width: 225px;"
                            class="text" alt="" />
                    </td>
                </tr>

                         <tr>
                    <td class="ftitle">
                        <nobr>Column Name:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="KPI" argumentid="ColumnName" style="width: 225px;"
                            class="text" alt="" />
                    </td>
                </tr>

                                         <tr>
                    <td class="ftitle">
                        <nobr>Is Column Ref:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="N" name="IsColumnRef"
                                            groupid="KPI" argumentid="IsColumnRef"><label>No</label>
                                        <input type="radio" value="Y" name="IsColumnRef" groupid="KPI" argumentid="IsColumnRef"><label>Yes</label>
                    </td>
                </tr>

                                                        <tr>
                    <td class="ftitle">
                        <nobr>Chart Width:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="304" name="ChartWidth"
                                            groupid="KPI" argumentid="ChartWidth"><label>304px</label>
                                        <input type="radio" value="613" name="ChartWidth" groupid="KPI" argumentid="ChartWidth"><label>613px</label>
                    </td>
                </tr>

                  <tr>
                    <td class="ftitle">
                        <nobr>Order ID:</nobr>
                    </td>
                    <td class="ftitle">
                       <input type="text" groupid="KPI" argumentid="OrderId" style="width: 225px;"
                            class="text required number" alt="" />
                    </td>
                </tr>

                                        <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="KPI" argumentid="IsDisabled"><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="KPI" argumentid="IsDisabled"><label>Yes</label>
                    </td>
                </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2" class="w-form-button-panel">
							<div class="bgdiv">
                                <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',HideOnSuccess:true,RequeryParent:true,ResetOnSuccess:true,Command:'FX_UPD_KPI'}">
                                <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                                <input type="button" value="  Cancel  " class="ButtonStyle WidgetAction" conf="{ActionId:'HideForm'}">
							</div>
                            </td>
                        </tr>
                                                                                                                                                                        
                                     </tbody></table>


    </center>
</div>