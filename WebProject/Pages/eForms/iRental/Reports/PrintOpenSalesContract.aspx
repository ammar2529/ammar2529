<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintOpenSalesContract.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintOpenSalesContract1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Contract</title>
</head>
<body>
    <form id="form1" runat="server">
       
            <table border="0" width="100%">
                <a href="PrintOpenSalesContract.aspx">PrintOpenSalesContract.aspx</a>
                <tr>
                    <td style="height: 21px" align="center" valign="top"">
                        &nbsp;<CR:CrystalReportViewer ID="SalesContractReport" runat="server" AutoDataBind="true" HasCrystalLogo="False" Height="1039px" 
                            ReportSourceID="CrystalReportSource12" 
                               HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                        Width="901px"/>

                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                            SelectCommand="RNTSalesContract_Print_SalesContract_SP" SelectCommandType="StoredProcedure"  >
                            <SelectParameters>
                                <asp:QueryStringParameter  DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <CR:CrystalReportSource ID="CrystalReportSource12" runat="server">
                            <Report FileName="PrintOpenSalesContract - Copy.rpt">
                                <DataSources>
                                    <CR:DataSourceRef DataSourceID="SqlDataSource12" TableName="RNTSalesContract_Print_SalesContract_SP"/>
                                    
                                </DataSources>
                            </Report>
                        </CR:CrystalReportSource>

                    </td>
                  
                </tr>
            </table>
    </form>
</body>
</html>
