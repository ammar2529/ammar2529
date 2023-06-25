<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CustomerDetails" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

            <uc5:Container ID="conCustomerManagement" Hidden="true" Caption="Customer Management" runat="server">
              <Childern>
                <uc8:Form ID="frmCustomerDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Customers" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_ShUc.ascx" >
                <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: true,
                            HeadText: 'Search'
                        }
                    }
                    </script>
                </WidgetConfig>
                </uc8:Form> 
                <uc6:DataGrid ID="grdCustomerDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCustomerDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_Customers" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Customer Management"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Customers\',KeysCol:\'RecId\'}}}">
          
            <GridConfig>
            <script>
                cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RecCode: { caption: 'Code', width: '90px' },
                        NationalIDNo: { caption: 'National ID No.' },
                        MobileTelephone1: { caption: 'Mobile Telephone' },
                        CustomerStatus: { caption: 'Status' }
                    },
                    forms: {
                        NewFormId: 'frmCustomerDetails',
                        EditFormId: 'frmCustomerDetails',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
            </uc6:DataGrid>
                <%--<uc8:Form ID="frmCustomerDetails_KPIUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" AsyncForm="~/Pages/Common/iDashboard/KPI_iDashboard.ascx">
                 <WidgetConfig>
                     <script>
                         cf = {

                             header: {
                                 Style: {},
                                 Visible: true,
                                 Collapsed: true,
                                 HeadText: 'KPI - Key Performance Indicator (s)'
                             }
                         }
                    </script>
                </WidgetConfig>
                 <Scripts>
                    <script>
                        var fn = function () {
                            var LoadChart = function (msg) {
                                var strChart;
                                if (!msg.text) {
                                    if (!!msg.childNodes[0])
                                        strChart = msg.childNodes[0].textContent;
                                }
                                else
                                    strChart = msg.text;


                                $('#dvContainer').html('');
                                $('.dvContainer', t.el).append(strChart);

                            };
                            var CallAjax = function (param) {
                                $.ajax({
                                    type: "POST",
                                    url: "AsyncDashboards/WebServices/KPI.asmx/GetKPICharts",
                                    dataType: "",
                                    data: "ContainerName=" + param,
                                    success: function (msg) {
                                        LoadChart(msg);
                                    }
                                });
                            };
                            $('.w-ui-panel-icon-closed', t.el).click(function () {
                                if (!this.__ChartsLoaded) {
                                    this.__ChartsLoaded = true;
                                    CallAjax('conCustomerManagement');
                                }
                            });
                        };
                    </script>
                </Scripts>    
                </uc8:Form>--%>
                <br />
           </Childern>
            </uc5:Container>

            <uc8:Form ID="frmCustomerDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" >
                            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Customer Management'
                        }
                    }
                </script>
                </WidgetConfig>
            </uc8:Form>