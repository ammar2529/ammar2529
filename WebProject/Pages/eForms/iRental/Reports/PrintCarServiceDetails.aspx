﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintCarServiceDetails.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintCarServiceDetails" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
       
            <table border="0" width="100%">
               
                <tr>
                    <td style="height: 21px" align="center" valign="top"">
                        &nbsp;

                        <CR:CrystalReportViewer ID="CarServiceDetails" runat="server" AutoDataBind="true" HasCrystalLogo="False" Height="1039px" 
                            ReportSourceID="CrystalReportSource12" 
                               HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                        Width="901px"/>

                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                            SelectCommand="RNTGarageCarServiceDetails_Print_CarServiceDetails_SP" SelectCommandType="StoredProcedure"  >
                            <SelectParameters>
                                <asp:QueryStringParameter  DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <CR:CrystalReportSource ID="CrystalReportSource12" runat="server">
                         
                             <Report FileName="PrintCarServiceDetailsReport.rpt">
                                <DataSources>
                                    <CR:DataSourceRef DataSourceID="SqlDataSource12" TableName="RNTGarageCarServiceDetails_Print_CarServiceDetails_SP"/>
                                    
                                </DataSources>
                            </Report>
                        </CR:CrystalReportSource>

                    </td>
                  
                </tr>
            </table>
    </form>
</body>
</html>
