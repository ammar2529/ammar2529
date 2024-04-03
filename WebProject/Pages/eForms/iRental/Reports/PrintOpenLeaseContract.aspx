<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintOpenLeaseContract.aspx.cs" Inherits="WebProject.Pages.eForms.iRental.Reports.PrintOpenLeaseContract1" %>

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
       
          <td style="height: 21px" align="center" valign="top">
              &nbsp;

              <CR:CrystalReportViewer ID="PrintLeaseContracts" runat="server" AutoDataBind="True"
                 HasCrystalLogo="False" Height="1039px" ReportSourceID="CrystalReportSource1" HasToggleGroupTreeButton="false" HasToggleParameterPanelButton="false"
                  Width="901px" />
              
              <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                  SelectCommand="RNTLeaseContract_Print_LeaseContract_SP" SelectCommandType="StoredProcedure" >
                   <SelectParameters>
                      <asp:QueryStringParameter  DefaultValue="" Name="FormCode" QueryStringField="FormCode"
                          Type="String" />
                  </SelectParameters>

              </asp:SqlDataSource>
              <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                   <Report FileName="PrintLeaseContracts2.rpt">
                      <DataSources>
                          <CR:DataSourceRef DataSourceID="SqlDataSource1" TableName="RNTLeaseContract_Print_LeaseContract_SP" />
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
