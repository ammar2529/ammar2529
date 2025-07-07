<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintLedgerManagmentReport.aspx.cs" Inherits="WebProject.Pages.eForms.Accounts.AccountReports.PrintLedgerManagmentReport1" %>

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
                        &nbsp;  <CR:CrystalReportViewer ID="LedgerManagmentReport" runat="server" AutoDataBind="true" HasCrystalLogo="False" Height="1039px" 
                            ReportSourceID="CrystalReportSource13" 
                               HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                        Width="901px" />
                        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                            SelectCommand="RNT_Account_LedgerManagment_SP" SelectCommandType="StoredProcedure"  >
                            <SelectParameters>
                                <asp:QueryStringParameter  DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="Int64" />
<%--                                <a href="PrintLedgerManagmentReport.aspx">PrintLedgerManagmentReport.aspx</a>--%>

                            </SelectParameters>
                        </asp:SqlDataSource>

                        <CR:CrystalReportSource ID="CrystalReportSource13" runat="server">
                            <Report FileName="PrintLedgerManagmentReport.rpt">
                                <DataSources>
                                    <CR:DataSourceRef DataSourceID="SqlDataSource13" TableName="RNT_Account_LedgerManagment_SP"/>
                                    <%--SalesContractsBill--%>
                                </DataSources>
                            </Report>
                        </CR:CrystalReportSource>
                    </td>
                  
                </tr>
            </table>
    </form>
</body>
</html>
