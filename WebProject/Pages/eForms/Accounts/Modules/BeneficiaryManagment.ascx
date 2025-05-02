<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiaryManagment.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.Modules.BeneficiaryManagment" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/Accounts/BeneficiaryManagement_FrUc.ascx" TagPrefix="AW" TagName="BeneficiaryManagement_FrUc" %>
<script src="../../../../Scripts/eForms/Accounts/frmBeneficiaryManagement.js"></script>

<AW:Container ID="conBeneficiary" Hidden="true" Caption="Beneficiary Management" runat="server">
              <Childern>
                <AW:Form ID="frmBeneficiaryManagement_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Customers" AsyncForm="~/Pages/eForms/Accounts/SearchForms/BeneficiaryManagement_ShUc.ascx" >
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
                </AW:Form> 
                <AW:DataGrid ID="grdBeneficiaryManagement" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmBeneficiaryManagement_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_Account_BeneficiaryManagement" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Beneficiary Management"  GridButtons="{\'delete\':{conf:{Command:\'UPD_Account_BeneficiaryManagement\',KeysCol:\'RecId\'}}}">
          
            <GridConfig>
            <script>
                cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RecCode: {  width: '0px' },
                        NationalIDNo: { caption: 'National ID No.' },
                        MobileTelephone1: { caption: 'Mobile Telephone' },
                        CustomerStatus: { caption: 'Status' }
                    },
                    forms: {
                        NewFormId: 'frmBeneficiaryManagement',
                        EditFormId: 'frmBeneficiaryManagement',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
            </AW:DataGrid>

                
           </Childern>
            </AW:Container>

            <AW:Form ID="frmBeneficiaryManagement" DataSource="SEL_Account_BeneficiaryManagement" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/Accounts/BeneficiaryManagement_FrUc.ascx" >
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Beneficiary Management'
                            }
                        }
                    </script>
                </WidgetConfig>
            </AW:Form>
