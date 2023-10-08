<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintOpenSalesContractFrPage1.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintOpenSalesContractFrPage1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <table>
          <tr>
             <td style="height: 21px;">
              &nbsp;</td>

              <td style="height: 21px" align="center" valign="top">
                  &nbsp;<CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true"  HasCrystalLogo="False" Height="1039px" ReportSourceID="CrystalReportSource2" 
                      HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                    Width="901px"/>

                  <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                  SelectCommand="RNTRentalContract_Print_Contract_SP" SelectCommandType="StoredProcedure">

                      <SelectParameters>
                          <asp:QueryStringParameter   DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String"/>
                      </SelectParameters>

                  </asp:SqlDataSource>

                  <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
                      
                      <Report FileName="PrintOpenSalesContract.rpt">
                          <DataSources>
                              <CR:DataSourceRef DataSourceID="SqlDataSource2" TableName="RNTRentalContract_Print_Contract_SP" />
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
