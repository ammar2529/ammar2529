<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDProjects.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.Modules.ITSSDProjects" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<AW:Container ID="conITSSDProjects" Hidden="true" Caption="Projects" runat="server">
    <Childern>
        <AW:Form ID="frmITSSDProjects_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true"  AsyncForm="~/Pages/eForms/ITSSD/ITSSDProjects_ShUc.ascx">
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
        <AW:DataGrid ID="grdITSSDProjects" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmITSSDProjects_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="20" DataSource="SEL_ITSSD_Projects"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Projects"
            GridButtons="{\'delete\':{conf:{Command:\'UPD_ITSSD_Projects\',KeysCol:\'RecId\'}}}">
                        <columntemplates>
                                <pre columnid="ProjectDetails" class="w-grid-head" >
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#008080;">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#602010">{Entity}</nobr></div>
                                    <div class="ftitle StateName" style="color:#008080">{Category}<nobr class="smalltext" style="color:#602010">&nbsp;-&nbsp;<i>{ReferenceNo}</i></nobr></div>
                                </div>
                                </pre>
                                <pre columnid="ServiceDetails" >
                                     <div class="ftitle" style="font-size:11px;color:#101080">{ServiceType}</div>
                                    <div style="font-size:11px;"><nobr class="ftitle" style="color:#602010">{ProjectName}</nobr></div>
                                      <div style="font-size:11px;"><b>Title:</b>&nbsp;{ProjectTitle}</div>
                                </pre>
                                   <pre columnid="Planning" >
                                     <div style="font-size:11px;"><b>Estimates:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{Estimates}</nobr></div>
                                     <div style="font-size:11px;"><b>P.Start:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{PlannedStartDate}</nobr></div>
                                     <div style="font-size:11px;"><b>P.End:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{PlannedEndDate}</nobr></div>
                                   
                                </pre>
                                 <pre columnid="CreationDetails" >
                                     <div class="ftitle" style="color:#808000">{State}</div>
                                     <div class="ftitle" style="color:#101080">{AssignedTo}</div>
                                     <div style="font-size:11px;">{DateCreated}</div>
                                </pre>

                                <pre columnid="RecId" >
                                {RecId}
                                </pre>
                                  <pre columnid="ModuleRecId" >
                                {ModuleRecId}
                                </pre>
                         </columntemplates>
                        <GridConfig>
                            <script>
                                cf = {
                                    cols: {
                                        EditForm: { width: '0px' },
                                        Sequence: { width: '0px' },
                                        ProjectDetails: { caption: 'Project Details', width: '210px' },
                                        ServiceDetails: { caption: 'Service Details', width: '340px' },
                                        Planning: { caption: 'Planning', width: '155px' },
                                        CreationDetails: { caption: 'Creation Details'},
                                        RecId: { width: '0px' },
                                        ModuleRecId: { width: '0px' }
                                    },
                                    forms: {
                                        NewFormId: 'frmITSSDProjects',
                                        EditFormId: 'frmITSSDProjects',
                                        Keys: 'RecId'
                                    }
                                };
                            </script>
                        </GridConfig>
                                  <Scripts>
                                    <script>
                                        var fn = function () {
                                                var ColClick = function () {
                                                    $('.EditForm.ColValue', $(this).closest('tr')).trigger('click');
                                                    return false;
                                                };
                                                t.on('rowsRendered', function () {
                                                    var cols = $('table[itemno] td:not(.RowSelect,.EditForm,.RowDetail)', t.el).css('cursor', 'pointer').click(ColClick);
                                                    $('.ColValue', cols).css('cursor', 'pointer').click(ColClick);
                                                });
                                        };
                                    </script>
                                </Scripts>
                                    <RowDetail>
                <pre class="" colindex="3" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                     <AW:Container ID="conCommonComments_ITSSDProjects" Hidden="true" runat="server">
                                         <Childern>
                                             <div style="padding: 20px; background: #EEEEFF;">
                                                                                                        
                                                       <AW:DataGrid ID="grdCommonComments_ITSSDProjects" AutoInstance="false" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                     AllowNew="false" SelectableRow="true" AutoSearch="OnVisible" PageSize="20" DataSource="FX_SEL_Common_Comments"
                                                     ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Comments"
                                                     ColLeftMargin="3" RelativeKeys="ModuleRecId" Style="width: 100%" GridButtons="{\'delete\':{conf:{Command:\'FX_UPD_Common_Comments\',KeysCol:\'RecId\'}}}">
                                                            <GridConfig>
                                                                <script>
                                                                    cf = {
                                                                        cols: {
                                                                            Sequence: { width: '0px' },
                                                                            RecId: { width: '0px' },
                                                                            ModuleId: { width: '0px' },
                                                                            ModuleRecId: { width: '0px' },
                                                                            Comments: { caption: 'Comments' },
                                                                            Flag: { width: '0px' },
                                                                            DateCreated: { caption: 'Date Created', width: '130px' },
                                                                            CreatedBy: { caption: 'Created By', width: '150px' }
                                                                        }
                                                                    };
                                                                </script>
                                                            </GridConfig>
                                                            <Scripts>
                                                                <script>
                                                                    var fn = function () {
                                                                        t.on('beforeSearchGetForm', function (P) {
                                                                            P.ModuleId = 'ITSSDProjects';
                                                                        });

                                                                        t.on('rowsRendered', function () {
                                                                            $('[colid="Flag"]:not(".w-grid-head-cell")').each(function () {
                                                                                var ptr = $(this).closest('tr');
                                                                                if ($(this).text().toLowerCase() == "1") {
                                                                                    ptr.css('background', '#FDF5CF');

                                                                                }
                                                                            });

                                                                        });
                                                                    }
                                                                </script>
                                                            </Scripts>
                                                                                     <GridForms>
                                                         <AW:Form ID="frmCommonComments_ITSSDProject_New" Hidden="true" AutoInstance="false" runat="server"
                                                             AsyncForm="~/Pages/Common/Administration/CommonComments_FrUc.ascx">
                                                             <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                                         t.on('show', function () {
                                                                             t.setParams({ reset: true });

                                                                             if (!!t.parent) {
                                                                                 t.SetArgVal('ModuleRecId', t.parent.rowDetail.getValues("ModuleRecId")['ModuleRecId']);
                                                                                 t.SetArgVal('ModuleId','ITSSDProjects');
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
                                                                             HeadText: 'Comments'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </AW:Form>
                                                     </GridForms>
                                                     <RowEditForm>
                                                         <AW:Form ID="frmCommonComments_ITSSDProject_Update" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                             runat="server" AsyncForm="~/Pages/Common/Administration/CommonComments_FrUc.ascx">
                                                             <Scripts>
                                                                 <script>
                                                                     fn = function () {
                                                           
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
                                                                             HeadText: 'Comments'
                                                                         }
                                                                     }
                                                                 </script>
                                                             </WidgetConfig>
                                                         </AW:Form>
                                                     </RowEditForm>
                                                        </AW:DataGrid>
                                             </div>
                                         </Childern>
                                     </AW:Container>
                                   </pre>
            </RowDetail>
        </AW:DataGrid>
        <br />
    </Childern>
</AW:Container>
            <AW:Form ID="frmITSSDProjects" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/ITSSD/ITSSDProjects_FrUc.ascx" >
                            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Projects'
                        }
                    }
                    </script>
                </WidgetConfig>
                  <Scripts>
                <script>
                    var fn = function () {

                        t.on('show', function (args) {
                            $('.OnLoadHide', t.el).hide();
                            $('[argumentid="Category"]', t.el).removeAttr('disabled');
                        });

                        t.on('onLoadedValues', function (args) {
                            $('.OnLoadHide', t.el).show();

                            t.on('onComboFilled', function () {
                                $('[argumentid="Category"]', t.el).attr('disabled', 'disabled');
                            });


                        });

                    };
                </script>
            </Scripts>
            </AW:Form>