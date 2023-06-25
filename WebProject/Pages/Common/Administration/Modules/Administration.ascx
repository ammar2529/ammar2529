<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administration.ascx.cs" Inherits="WebProject.Pages.Common.Administration.Modules.Administration" %>

<%@ Register Src="~/Pages/Common/Administration/Administration_Menu.ascx" TagName="Administration_Menu" TagPrefix="uc1" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

                <uc5:Container ID="conAdministration" Hidden="true" Caption="Administration" runat="server">
                <Childern>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td valign="top" style="width: 220px">
                                <uc1:Administration_Menu ID="Administration_Menu" runat="server" />
                            </td>
                            <td style="background-image: url(App_Themes/eForms_Theme/Images/i/vdiv.gif); background-repeat: repeat-y;width: 9px;" valign="top">
                                <img alt="" src="App_Themes/eForms_Theme/Images/t5b.gif" />
                            </td>
                            <td valign="top" style="padding:15px">
                                <uc5:Container ID="conAdministration_Controls" Hidden="false" Caption="Administration Controls"
                                    runat="server">
                                    <Childern>
                                        <center>
                                            <uc8:Form ID="frmMyProfile" Hidden="true" LoadOnInit="false" ShowOnLoad="false" runat="server"
                                                DataSource="FX_SEL_Users_MyProfile" AsyncForm="~/Pages/Common/Administration/MyProfile_FrUc.ascx">
                                                <WidgetConfig>
                                                    <script>
                                                        cf = {
                                                            header: {
                                                                Style: {},
                                                                Visible: true,
                                                                Collapsed: false,
                                                                HeadText: 'MY PROFILE'
                                                            }
                                                        }
                                                    </script>
                                                </WidgetConfig>
                                                <Scripts>
                                                    <script>
                                                        fn = function () {
                                                            t.on('show', function () {
                                                                if (!t.__valuesLoaded) {
                                                                    $(t.el).mask('Please wait while loading ...');
                                                                    t.loadValues();

//                                                                            AsyncWidgets.get('grdProxyUsers').show();
//                                                                            AsyncWidgets.get('grdProxyUsers').Requery();

                                                                    $(t.el).unmask('Please wait while loading ...');
                                                                    t.__valuesLoaded = true;
                                                                }
                                                            });
                                                        }
                                                    </script>
                                                </Scripts>
                                            </uc8:Form>


                                            <uc6:DataGrid ID="grdProxyUsers" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" PageSize="20" DataSource="FX_SEL_Users_MyProfile_Proxy"
                                                ContainerMargin="0px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Proxy Access"
                                                ColLeftMargin="3" GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_Users_MyProfile_Proxy\',KeysCol:\'RecId\'}}}"
                                                Style="width: 100%;">
                                                   <GridForms>
                                                    <uc8:Form ID="frmNewProxyUsers" Hidden="true" AutoInstance="false" runat="server"
                                                        AsyncForm="~/Pages/Common/Administration/MyProfile_Proxy_FrUc.ascx">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Proxy Access'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                         <scripts>
                                                                 <script>
                                                                     var fn = function () {
                                                                         t.on('show', function (args) {
                                                                             t.setParams({ reset: true });
                                                                         });
                                                                     };
                                                                    </script>
                                                            </scripts>
                                                    </uc8:Form>
                                                </GridForms>
                                                 <RowEditForm>
                                                    <uc8:Form ID="frmUpdateProxyUsers" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/MyProfile_Proxy_FrUc.ascx"
                                                        Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Proxy Access'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                            <scripts>
                                                                 <script>
                                                                     var fn = function () {
                                                                         t.on('onLoadedValues', function (args) {
                                                                             $('[argumentid="Name"]', t.el).attr('disabled', 'disabled');

                                                                         });
                                                                     };
                                                                    </script>
                                                            </scripts>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                RecId: { width: '0px' },
                                                                IsDisabled: { caption: 'Is Disabled', width: '100px' },
                                                                DateCreated: { caption: 'Date Created', width: '120px' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                            </uc6:DataGrid>

                                            <uc6:DataGrid ID="grdListofValues" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" AutoSearch="OnLoad" PageSize="20" DataSource="FX_SEL_Common_LOV_Parent"
                                                ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="List of Values" ColLeftMargin="3"
                                                GridButtons="{\'delete\':{visible:false},\'Disable\':{conf:{text:\'Disable\',Action:\'DeleteRows\',Command:\'FX_DEL_Common_LOV_Parent\',KeysCol:\'TypeId\',HideIcon:true}} ,\'Enable\':{conf:{text:\'Enable\',Action:\'DeleteRows\',Command:\'FX_DEL_Common_LOV_Parent\',KeysCol:\'TypeId\',HideIcon:true}}}"
                                                Style="width: 100%;">
                                                <Scripts>
                                                    <script>
                                                        fn = function () {
                                                            t.on('beforeRowDelete', function (args) {

                                                                if (args.cf.ButtonId)
                                                                    if (args.cf.ButtonId == 'Disable')
                                                                        args.cf["Disable"] = 1;
                                                                    else if (args.cf.ButtonId == 'Enable')
                                                                        args.cf["Disable"] = 0;
                                                            });
                                                        }


                                                    </script>
                                                </Scripts>
                                                <GridForms>
                                                    <uc8:Form ID="frmNewCommonLOVParent" Hidden="true" AutoInstance="false" runat="server"
                                                        AsyncForm="~/Pages/Common/Administration/CommonLOVParent_FrUc_New.ascx">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'List of Values - Parent Details'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </GridForms>
                                                <RowEditForm>
                                                    <uc8:Form ID="frmUpdateCommonLOVParent" Hidden="true" AutoInstance="false" RelativeKeys="TypeId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/CommonLOVParent_FrUc_Update.ascx"
                                                        Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'List of Values - Parent Details'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                Sequence: { width: '0px' },
                                                                TypeId: { width: '0px' },
                                                                Disabled: { width: '90px' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        }
                                                    </script>
                                                </GridConfig>
                                                <RowDetail>
                                                    <pre class="" colindex="3" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                     <uc5:Container ID="conLOVChild" Hidden="true" runat="server">
                                         <Childern>
                                             <div style="padding: 30px; background: #EEEEFF;">
                                                 <uc6:DataGrid ID="grdChildLOV" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                     AllowNew="false" SelectableRow="true" AutoSearch="OnVisible" PageSize="20" DataSource="FX_SEL_Common_LOV_Child"
                                                     ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="List of Values - Child"
                                                     ColLeftMargin="3" RelativeKeys="TypeId" Style="width: 99%" GridButtons="{\'delete\':{visible:false},\'Disable\':{conf:{text:\'Disable\',Action:\'DeleteRows\',Command:\'FX_DEL_Common_LOV_Child\',KeysCol:\'ChildId\',HideIcon:true}} ,\'Enable\':{conf:{text:\'Enable\',Action:\'DeleteRows\',Command:\'FX_DEL_Common_LOV_Child\',KeysCol:\'ChildId\',HideIcon:true}}}">
                                                     <GridConfig>
                                                         <script>
                                                             cf = {
                                                                 cols: {
                                                                     Sequence: { width: '0px' },
                                                                     ChildId: { width: '0px' },
                                                                     Description: { width: '0px' },
                                                                     Code: { width: '0px' },
                                                                     Name: { width: '222px' },
                                                                     Disabled: { width: '90px' }
                                                                 },
                                                                 pager: {
                                                                     PageSizeType: 'Dropdown'
                                                                 }
                                                             }
                                                         </script>
                                                     </GridConfig>
                                                     <Scripts>
                                                         <script>
                                                             fn = function () {
                                                                 t.on('beforeRowDelete', function (args) {
                                                                     if (args.cf.ButtonId)
                                                                         if (args.cf.ButtonId == 'Disable')
                                                                             args.cf["Disable"] = 1;
                                                                         else if (args.cf.ButtonId == 'Enable')
                                                                             args.cf["Disable"] = 0;
                                                                 });
                                                             }
                                                         </script>
                                                     </Scripts>
                                                     <GridForms>
                                                         <uc8:Form ID="frmNewCommonLOVChild" Hidden="true" AutoInstance="false" runat="server"
                                                             AsyncForm="~/Pages/Common/Administration/CommonLOVChild_FrUc_New.ascx">
                                                             <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                                         t.on('show', function () {
                                                                             //debugger;
                                                                             if (!!t.parent) {
                                                                                 t.SetArgVal('ParentTypeId', t.parent.rowDetail.getValues("TypeId")['TypeId']);
                                                                             }
                                                                         });
                                                                         $('[argumentid="SubChildName"]', t.el).blur(function () {

                                                                             if ($(this).val() == '')
                                                                                 t.SetArgVal('SubParentTypeId', '');
                                                                         });
                                                                     }
                                                                
                                                                 </script>
                                                             </Scripts>
                                                             <WidgetConfig>
                                                                 <script>
                                                                     cf = {

                                                                         header: {
                                                                             Style: {},
                                                                             Visible: true,
                                                                             Collapsed: false,
                                                                             HeadText: 'List of Values - Child Details'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </uc8:Form>
                                                     </GridForms>
                                                     <RowEditForm>
                                                         <uc8:Form ID="frmUpdateCommonLOVChild" Hidden="true" AutoInstance="false" RelativeKeys="ChildId"
                                                             runat="server" AsyncForm="~/Pages/Common/Administration/CommonLOVChild_FrUc_Update.ascx">
                                                             <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                                         $('[argumentid="SubChildName"]', t.el).blur(function () {

                                                                             if ($(this).val() == '')
                                                                                 t.SetArgVal('SubParentTypeId', '');
                                                                         });
                                                                         t.on('onLoad', function () {
                                                                             //   t.LoadCombo(t, $('select[argumentid="SubChildName"]', t.el), undefined, { params: { Description: 'Nationality'} });
                                                                             //alert('hi!');
                                                                         });

                                                                     }
                                                                 </script>
                                                             </Scripts>
                                                             <WidgetConfig>
                                                                 <script>
                                                                     cf = {

                                                                         header: {
                                                                             Style: {},
                                                                             Visible: true,
                                                                             Collapsed: false,
                                                                             HeadText: 'List of Values - Child Details'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </uc8:Form>
                                                     </RowEditForm>
                                                 </uc6:DataGrid>
                                             </div>
                                         </Childern>
                                     </uc5:Container>
                                   </pre>
                                                </RowDetail>
                                            </uc6:DataGrid>

                                            <uc6:DataGrid ID="grdKPI" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" PageSize="20" DataSource="FX_SEL_KPI" ContainerMargin="0px"
                                                AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="KPI Setup" ColLeftMargin="3"
                                                GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_KPI\',KeysCol:\'RecId\'}}}"
                                                Style="width: 100%;">
                                                  <GridForms>
                                                    <uc8:Form ID="frmNewKPI" Hidden="true" AutoInstance="false" runat="server"
                                                        AsyncForm="~/Pages/Common/Administration/KPI_FrUc.ascx">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'KPI Setup'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </GridForms>
                                                <RowEditForm>
                                                    <uc8:Form ID="frmUpdateKPI" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/KPI_FrUc.ascx"
                                                        Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'KPI Setup'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                Sequence: { width: '0px' },
                                                                RecId: { width: '0px' },
                                                                ContainerName: { width: '180px' },
                                                                KPIName: { caption: 'KPI Name', width: '250px' },
                                                                QueryType: { caption: 'Type', width: '75px' },
                                                                ChartWidth: { caption: 'Width', width: '50px' },
                                                                ChartHeight: { caption: 'Height', width: '0px' },
                                                                ChartType: { width: '0px' },
                                                                OrderId: { caption: 'Order' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                            </uc6:DataGrid>

                                            <uc6:DataGrid ID="grdOrganizations" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" PageSize="20" DataSource="FX_SEL_Organizations"
                                                ContainerMargin="0px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Organization Setup"
                                                ColLeftMargin="3" GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_Organizations\',KeysCol:\'RecId\'}}}"
                                                Style="width: 100%;">
                                                <GridForms>
                                                    <uc8:Form ID="frmNewOrganizations" Hidden="true" AutoInstance="false" runat="server"
                                                        AsyncForm="~/Pages/Common/Administration/Organizations_FrUc.ascx">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Organization Setup'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </GridForms>
                                                <RowEditForm>
                                                    <uc8:Form ID="frmUpdateOrganizations" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/Organizations_FrUc.ascx"
                                                        Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Organization Setup'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                Sequence: { width: '0px' },
                                                                RecId: { caption: 'System ID', width: '100px' },
                                                                Name: { caption: 'Organization Name', width: '380px' },
                                                                IsDisabled: { width: '100px' },
                                                                OrgId: { width: '0px' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                                <RowDetail>
                                                    <pre class="" colindex="3" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                     <uc5:Container ID="conOrganizations_Units" Hidden="true" runat="server">
                                         <Childern>
                                             <div style="padding: 30px; background: #EEEEFF;">
                                                 <uc6:DataGrid ID="grdOrganizations_Units" runat="server" Hidden="true" Columns="1"
                                                     EmptyHeight="201px" AllowNew="false" SelectableRow="true" AutoSearch="OnVisible"
                                                     PageSize="20" DataSource="FX_SEL_Organizations_Units" ContainerMargin="0px" GridTemplate="jQueryUI"
                                                     GridHeadText="Departments" ColLeftMargin="3" RelativeKeys="OrgId" Style="width: 100%"
                                                     GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_Organizations_Units\',KeysCol:\'RecId\'}}}">
                                                     <GridConfig>
                                                         <script>
                                                             cf = {
                                                                 cols: {
                                                                     Sequence: { width: '0px' },
                                                                     RecId: { caption: 'System ID', width: '100px' },
                                                                     Name: { caption: 'Department Name', width: '350px' },
                                                                     IsDisabled: { width: '100px' },
                                                                     OrgId: { width: '0px' }
                                                                 },
                                                                 pager: {
                                                                     PageSizeType: 'Dropdown'
                                                                 }
                                                             }
                                                         </script>
                                                     </GridConfig>
                                                     <GridForms>
                                                         <uc8:Form ID="frmNewOrganizations_Units" Hidden="true" AutoInstance="false" runat="server"
                                                             AsyncForm="~/Pages/Common/Administration/Organizations_Units_FrUc.ascx">
                                                             <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                                         t.on('show', function () {
                                                                             if (!!t.parent) {
                                                                                 t.SetArgVal('OrgId', t.parent.rowDetail.getValues("OrgId")['OrgId']);
                                                                             }
                                                                         });
                                                                     }
                                                                
                                                                 </script>
                                                             </Scripts>
                                                             <WidgetConfig>
                                                                 <script>
                                                                     cf = {
                                                                         header: {
                                                                             Style: {},
                                                                             Visible: true,
                                                                             Collapsed: false,
                                                                             HeadText: 'Departments'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </uc8:Form>
                                                     </GridForms>
                                                     <RowEditForm>
                                                         <uc8:Form ID="frmUpdateOrganizations_Units" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                             runat="server" AsyncForm="~/Pages/Common/Administration/Organizations_Units_FrUc.ascx">
                                                             <WidgetConfig>
                                                                 <script>
                                                                     cf = {

                                                                         header: {
                                                                             Style: {},
                                                                             Visible: true,
                                                                             Collapsed: false,
                                                                             HeadText: 'Departments'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </uc8:Form>
                                                     </RowEditForm>
                                                 </uc6:DataGrid>
                                             </div>
                                         </Childern>
                                     </uc5:Container>
                                   </pre>
                                                </RowDetail>
                                            </uc6:DataGrid>

                                            <uc6:DataGrid ID="grdRoleCategories" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="false" PageSize="20" DataSource="FX_SEL_Roles_Categories"
                                                ContainerMargin="0px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Role Management"
                                                ColLeftMargin="3" GridButtons="{\'refresh\':{visible:false},\'delete\':{visible:false},\'new\':{visible:false}}"
                                                Style="width: 100%;">
                                                <GridConfig> 
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                RecId: { caption: 'System ID', width: '0px' },
                                                                Name: { caption: 'Category Name', width: '190px' },
                                                                CategoryId: { width: '0px' },
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                                <RowDetail>
                                                    <pre class="" colindex="2" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                                      <uc5:Container ID="conRoles" Hidden="true" runat="server">
                                                        <Childern>
                                                            <div style="padding: 20px; background: #EEEEFF;">
                                                              <uc6:DataGrid ID="grdRoles" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" PageSize="20" DataSource="FX_SEL_Roles"
                                                ContainerMargin="0px" AutoSearch="OnVisible" GridTemplate="jQueryUI" GridHeadText="Role Management"
                                                ColLeftMargin="3" RelativeKeys="CategoryId" GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_Roles\',KeysCol:\'RecId\'}}}"
                                                Style="width: 100%;">
                                                <GridForms>
                                                    <uc8:Form ID="frmNewRoles" Hidden="true" AutoInstance="false" runat="server" AsyncForm="~/Pages/Common/Administration/Roles_FrUc.ascx">
                                                            <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                                         t.on('show', function () {
                                                                             if (!!t.parent) {
                                                                                 t.SetArgVal('CategoryId', t.parent.rowDetail.getValues("CategoryId")['CategoryId']);
                                                                             }
                                                                         });
                                                                     }
                                                                 </script>
                                                             </Scripts>
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Role Management'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </GridForms>
                                                <RowEditForm>
                                                    <uc8:Form ID="frmUpdateRoles" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/Roles_FrUc.ascx" Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Role Management'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {
                                                                Sequence: {width: '0px' },
                                                                RecId: { caption: 'System ID', width: '0px' },
                                                                ProcessName: {width: '170px' },
                                                                Name: { caption: 'Role Name', width: '205px' },
                                                                RoleId: { caption: 'Role ID', width: '170px' },
                                                                IsDisabled: { caption: '', width: '35px' },
                                                                CategoryId: { width: '0px' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                            </uc6:DataGrid>

                                                            </div>
                                                        </Childern>
                                                      </uc5:Container>
                                                    </pre>
                                                </RowDetail>
                                            </uc6:DataGrid>
                                            
                                            <uc6:DataGrid ID="grdSimpleMenu" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                AllowNew="true" SelectableRow="true" PageSize="20" DataSource="FX_SEL_SimpleMenu_Parent"
                                                ContainerMargin="0px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Menu Configuration"
                                                ColLeftMargin="3" GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_SimpleMenu_Parent\',KeysCol:\'MenuId\'}}}"
                                                Style="width: 100%;">
                                                <GridForms>
                                                    <uc8:Form ID="frmNewSimpleMenu" Hidden="true" AutoInstance="false" runat="server"
                                                        AsyncForm="~/Pages/Common/Administration/SimpleMenu_Parent_FrUc.ascx">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Menu Configuration'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </GridForms>
                                                <RowEditForm>
                                                    <uc8:Form ID="frmUpdateSimpleMenu" Hidden="true" AutoInstance="false" RelativeKeys="MenuId"
                                                        runat="server" AsyncForm="~/Pages/Common/Administration/SimpleMenu_Parent_FrUc.ascx"
                                                        Style="text-align: center;">
                                                        <WidgetConfig>
                                                            <script>
                                                                cf = {
                                                                    header: {
                                                                        Style: {},
                                                                        Visible: true,
                                                                        Collapsed: false,
                                                                        HeadText: 'Menu Configuration'
                                                                    }
                                                                }
                                                            </script>
                                                        </WidgetConfig>
                                                    </uc8:Form>
                                                </RowEditForm>
                                                <GridConfig>
                                                    <script>
                                                        cf = {
                                                            cols: {

                                                                MenuId: { caption: 'Menu ID', width: '0px' },
                                                                OrderId: { caption: 'Order ID', width: '0px' },
                                                                ParentMenuId: { width: '0px' },
                                                                ChildId: { width: '0px' },
                                                                Role: { width: '0px' },
                                                                ShowWidget: { width: '0px' },
                                                                MenuName: { caption: 'Menu Name' },
                                                                IsDisabled: { width: '100px' }
                                                            },
                                                            pager: {
                                                                PageSizeType: 'Dropdown'
                                                            }
                                                        };
                                                    </script>
                                                </GridConfig>
                                                <RowDetail>
                                                    <pre class="" colindex="3" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                                         <uc5:Container ID="Container1" Hidden="true" runat="server">
                                                             <Childern>
                                                                 <div style="padding: 30px; background: #EEEEFF;">
                                                                     <uc6:DataGrid ID="grdSimpleMenuChild" runat="server" Hidden="true" Columns="1"
                                                                         EmptyHeight="201px" AllowNew="false" SelectableRow="true" AutoSearch="OnVisible"
                                                                         PageSize="20" DataSource="FX_SEL_SimpleMenu_Child" ContainerMargin="0px" GridTemplate="jQueryUI"
                                                                         GridHeadText="Menu Configuration" ColLeftMargin="3" RelativeKeys="ChildId" Style="width: 100%"
                                                                         GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_SimpleMenu_Child\',KeysCol:\'MenuId\'}}}">
                                                                         <GridConfig>
                                                                            <script>
                                                                                cf = {
                                                                                    cols: {
                                                                                        MenuId: { caption: 'Menu ID', width: '0px' },
                                                                                        OrderId: { caption: 'Order ID', width: '0px' },
                                                                                        ParentMenuId: { width: '0px' },
                                                                                        RoleId: { width: '0px' },
                                                                                        ShowWidget: { caption: 'Show Widget', width: '200px' },
                                                                                        MenuName: { caption: 'Menu Name' },
                                                                                        IsDisabled: { width: '100px' }
                                                                                    },
                                                                                    pager: {
                                                                                        PageSizeType: 'Dropdown'
                                                                                    }
                                                                                };
                                                                            </script>
                                                                        </GridConfig>
                                                                         <GridForms>
                                                                             <uc8:Form ID="frmNewSimpleMenuChild" Hidden="true" AutoInstance="false" runat="server"
                                                                                 AsyncForm="~/Pages/Common/Administration/SimpleMenu_Child_FrUc.ascx">
                                                                                 <Scripts>
                                                                                     <script>
                                                                                         fn = function () {
                                                                                             t.on('show', function () {
                                                                                                 if (!!t.parent) {
                                                                                                     t.SetArgVal('ParentMenuId', t.parent.rowDetail.getValues("MenuId")['MenuId']);
                                                                                                 }
                                                                                                 t.LoadCombo(t, $('[argumentid="RoleId"]', t.el));
                                                                                             });
                                                                                         }
                                                                                     </script>
                                                                                 </Scripts>
                                                                                 <WidgetConfig>
                                                                                     <script>
                                                                                         cf = {
                                                                                             header: {
                                                                                                 Style: {},
                                                                                                 Visible: true,
                                                                                                 Collapsed: false,
                                                                                                 HeadText: 'Menu Configuration'
                                                                                             }
                                                                                         }
                                                                                     </script>
                                                                                 </WidgetConfig>
                                                                             </uc8:Form>
                                                                         </GridForms>
                                                                         <RowEditForm>
                                                                             <uc8:Form ID="frmUpdateSimpleMenuChild" Hidden="true" AutoInstance="false" RelativeKeys="MenuId"
                                                                                 runat="server" AsyncForm="~/Pages/Common/Administration/SimpleMenu_Child_FrUc.ascx">
                                                                                     <Scripts>
                                                                                     <script>
                                                                                         fn = function () {
                                                                                             t.on('onLoadedValues', function () {
                                                                                                 t.LoadCombo(t, $('[argumentid="RoleId"]', t.el));
                                                                                             });
                                                                                         }
                                                                                     </script>
                                                                                 </Scripts>
                                                                                 <WidgetConfig>
                                                                                     <script>
                                                                                         cf = {

                                                                                             header: {
                                                                                                 Style: {},
                                                                                                 Visible: true,
                                                                                                 Collapsed: false,
                                                                                                 HeadText: 'Menu Configuration'
                                                                                             }
                                                                                         }
                                                                                     </script>
                                                                                 </WidgetConfig>
                                                                             </uc8:Form>
                                                                         </RowEditForm>
                                                                     </uc6:DataGrid>
                                                             </Childern>
                                                         </uc5:Container>
                                                    </pre>
                                                </RowDetail>
                                            </uc6:DataGrid>

                                        </center>
                                    </Childern>
                                </uc5:Container>
                            </td>
                        </tr>
                    </table>
                </Childern>
            </uc5:Container>