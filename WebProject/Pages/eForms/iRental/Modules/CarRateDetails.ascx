<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CarRateDetails" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

              <uc5:Container ID="conCarRateDetails" Hidden="true" Caption="Car Rate Details" runat="server">
              <Childern>
                <uc8:Form ID="frmCarRateDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Cars_Rates" AsyncForm="~/Pages/eForms/iRental/CarRateDetails_ShUc.ascx" >
                <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: false,
                            Collapsed: false,
                            HeadText: 'Search'
                        }
                    }
                    </script>
                </WidgetConfig>
                </uc8:Form>

                  <div class="mt-2">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Rate Management</span>
						                    <i class="fa-regular fa-rectangle-xmark "
                        tabid="CloseBtn" title="Close Grid"
                        style="font-size: 20px; color: black; cursor: pointer; 
                               transition: color 0.3s ease; position: absolute; 
                               right: 10px;"
                        onmouseover="this.style.color='red';" 
                        onmouseout="this.style.color='black';" returntype="true" showwidget="frmInbox">
                    </i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <uc6:DataGrid ID="grdCarRateDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarRateDetails_ShUc"
                        EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                        PageSize="10" DataSource="SEL_iRental_Cars_Rates" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
                         GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Cars_Rates\',KeysCol:\'RecId\'}}}">

                        <GridConfig>
                            <script>
                                cf = {
                                    cols: {
                                        Sequence: { width: '0px' },
                                        RecId: { width: '0px' },
                                        RateTypeId: { caption: 'Rate Type', width: '130px' },
                                        BrandId: { caption: 'Brand', width: '130px' },
                                        ModelId: { caption: 'Model', width: '150px' },
                                        CarYear: { caption: 'Year', width: '55px' },
                                        Rate: { caption: 'Daily Rate', width: '95px' },
                                        AllowedKM: { caption: 'Daily KM Limit', width: '125px' },
                                        ExtraKMRate: { caption: 'Rate/KM', width: '85px' },
                                        GridButtons:
                                        {
                                            'delete': {
                                                conf: {
                                                    Action: 'DeleteRows',
                                                    Command: 'UPD_iRental_Cars_Rates',
                                                    KeysCol: 'RecId'
                                                }
                                            }
                                        }
                                    },
                                    forms: {
                                        NewFormId: 'frmCarRateDetails',
                                        EditFormId: 'frmCarRateDetails',
                                        Keys: 'RecId'
                                    }
                                };
                            </script>
                        </GridConfig>
                    </uc6:DataGrid>

                </div>
            </div>
        </div>
    </div>
</div>


        
           </Childern>
            </uc5:Container>

           <uc8:Form ID="frmCarRateDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarRateDetails_FrUc2.ascx" >
                            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: false,
                            Collapsed: false,
                            HeadText: 'Rate Management'
                        }
                    }
                </script>
                </WidgetConfig>
            </uc8:Form>
