<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebProject.WebForm3" %>

<%@ Register Src="~/Pages/eForms/iRental/SalesContracts_PD_FrUc.ascx" TagPrefix="uc1" TagName="SalesContracts_PD_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/SalesContracts_ShUc.ascx" TagPrefix="AW" TagName="SalesContracts_ShUc" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--        <script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>--%>
<%--    <script type="text/javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>--%>


             
          <AW:Form ID="frmSalesCarPrice" Hidden="true" LoadOnInit="true" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesCarPrice_FrUc.ascx">
                  <WidgetConfig>
                    <script type="text/javascript">
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Car Price'
                            }
                        }
                        
                    </script>
                </WidgetConfig>

                <Scripts>
                  <script type="text/javascript">

   
                  </script>
                </Scripts>
            </AW:Form>


</asp:Content>
