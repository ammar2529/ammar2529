﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.SalesCarPrice" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

              <uc5:Container ID="conSalesCarPriceDetails" Hidden="true" Caption="Car Price Details" runat="server">
              <Childern>
                <uc8:Form ID="frmSaleCarPriceDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_SalesCarPrice" AsyncForm="~/Pages/eForms/iRental/SalesCarPrice_ShUc.ascx" >
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
                <uc6:DataGrid ID="grdSalesCarRatePriceDetails" LoadOnInit="false" ShowOnLoad="true"  runat="server" Hidden="true" Columns="1" Forms="frmSaleCarPriceDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_SalesCarPrice" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Sales Car Price"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesCarPrice\',KeysCol:\'RecId\'}}}">
          
            <GridConfig>
            <script>
               var cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        BrandId: { caption: 'Brand', width: '130px' },
                        ModelId: { caption: 'Model', width: '150px' },
                        YearId: { caption: 'Year', width: '55px' },
                        Price: { caption: 'Price', width: '95px' },
                        Comments: { caption: 'Comments', width: '95px' },
                      
                    },
                    forms: {
                        NewFormId: 'frmSaleCarPriceDetails',
                        EditFormId: 'frmSaleCarPriceDetails',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
            </uc6:DataGrid>
            <br />
           </Childern>
            </uc5:Container>

  <uc8:Form ID="frmSaleCarPriceDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesCarPrice_FrUc.ascx" >
              <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Sales Car Price'
                        }
                    }
                </script>
                </WidgetConfig>
            </uc8:Form>
