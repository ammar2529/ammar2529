<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintDeliveryNoteSalesContracts.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintDeliveryNoteSalesContracts1" %>

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
                         <CR:CrystalReportViewer ID="DeliveryNote" runat="server" AutoDataBind="true" HasCrystalLogo="False" Height="1039px" 
                            ReportSourceID="CrystalReportSource1" 
                               HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                        Width="901px" ToolPanelView="None" />
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReportConnection %>" 
                           SelectCommand="RNTSalesContract_DeliveryNote_SalesContract_SP" SelectCommandType="StoredProcedure"    ProviderName="<%$ ConnectionStrings:ReportConnection.ProviderName %>">
                             <SelectParameters>
                                 <asp:QueryStringParameter DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String"/>
                             </SelectParameters>
                         </asp:SqlDataSource>





                         <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                             <Report  FileName="PrintDeliveryNoteSalesContracts.rpt">
                                 <DataSources>
                                     <CR:DataSourceRef  DataSourceID="SqlDataSource1" TableName="RNTSalesContract_DeliveryNote_SalesContract_SP"/>
                                 </DataSources>
                             </Report>
                         </CR:CrystalReportSource>

                      </td>
            </tr>
        </table>

    </form>
</body>
</html>
