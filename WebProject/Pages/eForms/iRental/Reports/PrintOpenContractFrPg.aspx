<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintOpenContractFrPg.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintOpenContractFrPg" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title>Contract</title>
</head>
<body>
<form id="form2" runat="server">
      <table border="0" width="100%">
        <tr>
          <td style="height: 21px;">
              &nbsp;</td>
          <td style="height: 21px" align="center" valign="top">
              &nbsp; <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"
                 HasCrystalLogo="False" Height="1039px" ReportSourceID="CrystalReportSource1" HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                  Width="901px" />
              
              <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                  SelectCommand="RNTRentalContract_Print_Contract_SP" SelectCommandType="StoredProcedure" >
                   <SelectParameters>
                      <asp:QueryStringParameter  DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String" />
                  </SelectParameters>

              </asp:SqlDataSource>
              <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                   <Report FileName="PrintOpenContract.rpt">
                      <DataSources>
                          <CR:DataSourceRef DataSourceID="SqlDataSource1" TableName="RNTRentalContract_Print_Contract_SP" />
                      </DataSources>
                  </Report>
              </CR:CrystalReportSource>
              
          </td>
          <td style="height: 21px">
              &nbsp;</td>
        </tr>
      </table>
    </form>
</body>
</html>
