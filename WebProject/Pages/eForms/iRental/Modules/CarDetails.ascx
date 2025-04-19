<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarDetails.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CarDetails" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc5" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>
<uc5:Container ID="conCarDetails" Hidden="true" Caption="Car Details" runat="server">
    <Childern>
        <uc8:Form ID="frmCarDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" DataSource="SEL_iRental_Cars" AsyncForm="~/Pages/eForms/iRental/CarDetails_ShUc.ascx">
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

                        <span class=" h5 fw-bold ink-bar">Car Details</span>
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
                            <uc5:DataGrid ID="grdCarDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="10" DataSource="SEL_iRental_Cars"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" 
            GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Cars\',KeysCol:\'RecId\'}}}">
            <GridConfig>
                <script>
                    cf = {
                        cols: {
                            Sequence: { width: '0px' },
                            RecId: { width: '0px' },
                            RecCode: { width: '0px' },
                            CarNumber: { caption: 'Car No.', width: '80px' },
                            CarFor: { width: '70px' },
                            BrandId: { caption: 'Brand', width: '120px' },
                            ModelId: { caption: 'Model', width: '140px' },
                            TypeId: { caption: 'Type', width: '80px' },
                            CarYear: { caption: 'Year', width: '55px' },
                            CurrentMileage: { caption: 'Mileage', width: '75px' },
                            CarLocationId: { caption: 'Car Location', width: '105px' },
                            CarStatusId: { caption: 'Status' }
                        },
                        forms: {
                            //NewFormId: 'frmCarDetails',
                            //EditFormId: 'frmCarDetails',
                            NewFormId: 'frmCarForSalesDetails',
                            EditFormId: 'frmCarForSalesDetails',
                            Keys: 'RecId'
                        }
                    };
                </script>
            </GridConfig>
        </uc5:DataGrid>
                </div>
            </div>
        </div>
    </div>
</div>



      
    </Childern>
</uc5:Container>
<uc8:Form ID="frmCarForSalesDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
    AsyncForm="~/Pages/eForms/iRental/CarDetails_FrUc2.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Car Details'
                }
            }
        </script>
    </WidgetConfig>
         <Scripts>
                    <script>
                        var fn = function () {
                            t.on('show', function (args) {
                                $('.ElemDisabled', t.el).removeClass('ElemDisabled');
                                $('[argumentid="CarLocationId"],[argumentid="CarStatusId"],[argumentid="CurrentMileage"]', t.el).removeAttr('disabled');
                            });

                            t.on('onLoadedValues', function (args) {
                                $('[argumentid="action"]', t.el).val("update");
                                if ($('[argumentid="ContractNo"]', t.el).text() != '') {
                                    $('[argumentid="CarLocationId"],[argumentid="CarStatusId"],[argumentid="CurrentMileage"]', t.el).attr('disabled', 'disabled');
                                }
                            });

                            t.on('onComboFilled', function () {
                                $('.ElemDisabled', t.el).removeClass('ElemDisabled');
                                $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
                             });
                        }
                    </script>
                </Scripts>

</uc8:Form>
