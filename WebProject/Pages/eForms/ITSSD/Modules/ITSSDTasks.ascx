<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ITSSDTasks.ascx.cs" Inherits="WebProject.Pages.eForms.ITSSD.Modules.ITSSDTasks" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>

<uc5:Container ID="conITSSDTasks" Hidden="true" Caption="Tasks" runat="server">
    <Childern>
                <uc8:Form ID="frmITSSDTasks_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" AsyncForm="~/Pages/eForms/ITSSD/ITSSDTasks_ShUc.ascx">
            <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Search'
                        }
                    } 
                </script>
            </WidgetConfig>
                              <Scripts>
                <script>
                    var fn = function () {

                        $('[argumentid="SmartDate"]', t.el).click(function () {

                            var CurrentDate = new Date();
                            var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
                            var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
                            var cY = CurrentDate.getFullYear();
                            var dM = new Date(cY, cM, 0).getDate();

                            var YesterdayDate = new Date();
                            YesterdayDate.setDate(YesterdayDate.getDate() - 1);

                            var yD = YesterdayDate.getDate() < 10 ? '0' + YesterdayDate.getDate() : YesterdayDate.getDate();
                            var yM = (YesterdayDate.getMonth() + 1) < 10 ? '0' + (YesterdayDate.getMonth() + 1) : (YesterdayDate.getMonth() + 1);
                            var yY = YesterdayDate.getFullYear();

                            var CurrentDay = CurrentDate.getDay();
                            var FromDate = new Date();
                            var ToDate = new Date();

                            if (CurrentDay == 5) {
                                FromDate.setDate(FromDate.getDate() - 5);
                                //ToDate.setDate(ToDate.getDate() - 1);
                            }
                            else if (CurrentDay == 6) {
                                FromDate.setDate(FromDate.getDate() - 6);
                                //ToDate.setDate(ToDate.getDate() - 2);
                            }
                            else {
                                FromDate.setDate(FromDate.getDate() - CurrentDay);
                            }

                            var fD = FromDate.getDate() < 10 ? '0' + FromDate.getDate() : FromDate.getDate();
                            var fM = (FromDate.getMonth() + 1) < 10 ? '0' + (FromDate.getMonth() + 1) : (FromDate.getMonth() + 1);
                            var fY = FromDate.getFullYear();

                            var tD = ToDate.getDate() < 10 ? '0' + ToDate.getDate() : ToDate.getDate();
                            var tM = (ToDate.getMonth() + 1) < 10 ? '0' + (ToDate.getMonth() + 1) : (ToDate.getMonth() + 1);
                            var tY = ToDate.getFullYear();

                            if ($('[argumentid="SmartDate"]:checked', t.el).val() == '0') {
                                $('[argumentid="FromDate"]', t.el).val(yD + '/' + yM + '/' + yY);
                                $('[argumentid="ToDate"]', t.el).val(yD + '/' + yM + '/' + yY);
                            }
                            else if ($('[argumentid="SmartDate"]:checked', t.el).val() == '1') {
                                $('[argumentid="FromDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                                $('[argumentid="ToDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                            }
                            else if ($('[argumentid="SmartDate"]:checked', t.el).val() == '2') {
                                $('[argumentid="FromDate"]', t.el).val(fD + '/' + fM + '/' + fY);
                                $('[argumentid="ToDate"]', t.el).val(tD + '/' + tM + '/' + tY);
                            }
                            else if ($('[argumentid="SmartDate"]:checked', t.el).val() == '3') {
                                $('[argumentid="FromDate"]', t.el).val('01' + '/' + cM + '/' + cY);
                                $('[argumentid="ToDate"]', t.el).val(dM + '/' + cM + '/' + cY);

                            }
                        });
                    };
                </script>
            </Scripts>
        </uc8:Form>

                <uc8:Form ID="frmITSSDTasks_KPIUc" runat="server" Hidden="true" LoadOnInit="false"
                            ShowOnLoad="true" AsyncForm="~/Pages/Common/iDashboard/KPI_iDashboard.ascx">
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
                                                CallAjax('conITSSDTasks');
                                            }
                                        });
                                    };
                                </script>
                            </Scripts>
                        </uc8:Form>

                <uc6:DataGrid ID="grdTaskEffortsSummary" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmITSSDTasks_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="false" PageSize="10" DataSource="SEL_ITSSD_Tasks_Efforts_Summary"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Effort Details Summary - Click on the header to see efforts for the selected date..." ColLeftMargin="3"
            GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}">
            <GridConfig>
                <script>
                    cf = {
                        cols: {
                            Sequence: { width: '0px' },
                            DateYear: { width: '0px' },
                             DateMonth: { width: '0px' },
                             UserName: { width: '0px' },
                             1: { width: '28px' },
                             2: { width: '28px' },
                             3: { width: '28px' },
                             4: { width: '28px' },
                             5: { width: '28px' },
                             6: { width: '28px' },
                             7: { width: '28px' },
                             8: { width: '28px' },
                             9: { width: '28px' },
                             10: { width: '28px' },
                             11: { width: '28px' },
                             12: { width: '28px' },
                             13: { width: '28px' },
                             14: { width: '28px' },
                             15: { width: '28px' },
                             16: { width: '28px' },
                             17: { width: '28px' },
                             18: { width: '28px' },
                             19: { width: '28px' },
                             20: { width: '28px' },
                             21: { width: '28px' },
                             22: { width: '28px' },
                             23: { width: '28px' },
                             24: { width: '28px' },
                             25: { width: '28px' },
                             26: { width: '28px' },
                             27: { width: '28px' },
                             28: { width: '28px' },
                             29: { width: '28px' },
                             30: { width: '28px' },
                             31: { width: '28px' }
                        },
                        pager: {
                            Visible: false
                        },
                        header: {
                            Visible: true
                        }
                    };
                </script>
            </GridConfig>
                      <Scripts>
                                    <script>
                                        var fn = function () {

                                            t.on('rowsRendered', function () {

                                                $('td.w-grid-head-cell', t.el).unbind('click').click(function () {
                                                    var CurrentDate = new Date();
                                                    var cD = $(this).text();
                                                    var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
                                                    var cY = CurrentDate.getFullYear();
                                                    var cDate, colid;
                                                    cDate = cY + '-' + cM + '-' + cD;

                                                    colid = $(this).attr('colid');

                                                    $('.ItemTR > td > table > tbody [colid]').css({ 'background-color': 'transparent' });
                                                    $('.ItemTR > td > table > tbody [colid] div').css({ 'color': '#333333' });
                                                    $('.ItemTR > td > table > tbody [colid="' + colid + '"]').css({ 'background-color': '#602010' });
                                                    $('.ItemTR > td > table > tbody [colid="' + colid + '"] div').css({ 'color': '#FFFFFF' });

                                                    var frmITSSDTasks_ShUc = AsyncWidgets.get('frmITSSDTasks_ShUc');
                                                    $('.search', frmITSSDTasks_ShUc.el).click(function () {
                                                        AsyncWidgets.get('grdITSSDTasksEffortsDaily').hide();
                                                    });

                                                    AsyncWidgets.get('grdITSSDTasksEffortsDaily').search({ params: { AssignedTo: frmITSSDTasks_ShUc.GetArgVal('AssignedTo'), FromDate: cDate, ToDate: cDate} });
                                                });
                                            });
                                        };
                                    </script>
                                </Scripts>


            </uc6:DataGrid>

            <uc6:DataGrid ID="grdITSSDTasksEffortsDaily" LoadOnInit="false" ShowOnLoad="false" runat="server" Hidden="true" Columns="1" Forms=""
            EmptyHeight="201px" AllowNew="true" SelectableRow="false" PageSize="20" DataSource="SEL_ITSSD_Tasks_Efforts_Daily"
            ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI" GridHeadText="" ColLeftMargin="3"
            GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}">
            <GridConfig>
                <script>
                    cf = {
                        cols: {
                            Sequence: { width: '0px' },
                            RecCode: { caption: 'Code', width: '80px' },
                            EffortDate: { width: '0px' },
                            Entity: { width: '120px' },
                            EffortHrs: { caption: 'Hrs', width: '35px' }
                        },
                        pager: {
                            Visible: false
                        },
                        header: {
                            Visible: false
                        }
                    };
                </script>
            </GridConfig>
            </uc6:DataGrid>

        <uc6:DataGrid ID="grdITSSDTasks" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmITSSDTasks_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="20" DataSource="SEL_ITSSD_Tasks"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Tasks"
            GridButtons="{\'delete\':{conf:{Command:\'UPD_ITSSD_Tasks\',KeysCol:\'RecId\'}}}">
            <columntemplates>
                                <pre columnid="ProjectDetails" class="w-grid-head" >
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#008080;">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle smalltext" style="color:#602010">{Category}</nobr></div>
                                    <div class="ftitle StateName smalltext" style="color:#008080">{AssignedTo}</div>
                                </div>
                                </pre>
                                <pre columnid="ServiceDetails" >
                                      <div style="font-size:11px;"><nobr class="ftitle smalltext" style="color:#101080">Title:&nbsp;{TaskTitle}</nobr></div>
                                      <div style="font-size:11px;color:#602010"><b><nobr class="ftitle smalltext">{ReferenceNo}&nbsp;&nbsp;&nbsp;{ProjectCode}</nobr></b></div>
                                      <div style="font-size:11px;"><nobr class="ftitle smalltext" style="color:#008080">{Entity}&nbsp;&nbsp;&nbsp;{ProjectName}</nobr></div>
                                      
                                </pre>
                                   <pre columnid="Planning" >
                                     <div style="font-size:11px;"><b>Estimates:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{Estimates}</nobr></div>
                                     <div style="font-size:11px;"><b>P.Start:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{PlannedStartDate}</nobr></div>
                                     <div style="font-size:11px;"><b>P.End:</b>&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{PlannedEndDate}&nbsp;&nbsp;&nbsp;</nobr><nobr class="ftitle smalltext ActualDays" style="color:#101080">{ActualDays}</nobr></div>
                                   
                                </pre>
                                 <pre columnid="CreationDetails" >
                                     <div class="ftitle" style="color:#808000">{State}&nbsp;-&nbsp;<nobr class="ftitle" style="color:#602010">{TotalHrs}&nbsp;Hrs</nobr></div>
                                     <div class="ftitle" style="color:#101080">{AssignedBy}</div>
                                     <div style="font-size:11px;">{DateCreated}&nbsp;&nbsp;&nbsp;<nobr class="ftitle smalltext" style="color:#602010">{TotalDays}&nbsp;Day(s)</nobr></div>
                                </pre>

                                <pre columnid="RecId" >
                                {RecId}
                                </pre>
                                  <pre columnid="ParentRecId" >
                                {ParentRecId} 
                                </pre>
                                 <pre columnid="EntityId" >
                                {EntityId}
                                </pre>
                         </columntemplates>
                            <GridConfig>
                                <script>
                                    cf = {
                                        cols: {
                                            EditForm: { width: '0px' },
                                            Sequence: { width: '0px' },
                                            ProjectDetails: { caption: 'Task Details', width: '170px' },
                                            ServiceDetails: { caption: 'Service Details', width: '340px' },
                                            Planning: { caption: 'Planning', width: '165px' },
                                            CreationDetails: { caption: 'Creation Details' },
                                            RecId: { width: '0px' },
                                            ParentRecId: { width: '0px' },
                                            EntityId: { width: '0px' }
                                        },
                                        forms: {
                                            NewFormId: 'frmITSSDTasks',
                                            EditFormId: 'frmITSSDTasks',
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

                                                $('.ActualDays', t.el).each(function () {
                                                    if ($(this).text()!='' && parseInt($(this).text())>0) {
                                                        $(this).closest('tr').css('background', '#FDF5CF');
                                                        $(this).css('color', 'Red');
                                                    }
                                                });

                                            });
                                        };
                                    </script>
                                </Scripts>
                                 <RowDetail>
                            <pre class="" colindex="3" icon="./AsyncWidgets/widgets/resources/images/ChildGrid.png">
                                                 <uc5:Container ID="conEfforts_ITSSDTasks" Hidden="true" runat="server">
                                                     <Childern>
                                                         <div style="padding: 20px; background: #EEEEFF;">
                                                                                                        
                                                                   <uc6:DataGrid ID="grdEfforts_ITSSDTasks" AutoInstance="false" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                                 AllowNew="false" SelectableRow="true" AutoSearch="OnVisible" PageSize="20" DataSource="SEL_ITSSD_Tasks_Efforts"
                                                                 ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Actual Efforts"
                                                                 ColLeftMargin="3" RelativeKeys="ParentRecId,EntityId" Style="width: 100%" GridButtons="{\'delete\':{conf:{Command:\'UPD_ITSSD_Tasks_Efforts\',KeysCol:\'RecId\'}}}">
                                                                        <GridConfig>
                                                                            <script>
                                                                                cf = {
                                                                                    cols: {
                                                                                        Sequence: { width: '0px' },
                                                                                        RecId: { width: '0px' },
                                                                                        ParentRecId: { width: '0px' },
                                                                                        Entity: { width: '110px' },
                                                                                        EffortDate: { width: '120px' },
                                                                                        EffortHrs: { caption: 'Hrs',width: '35px' },
                                                                                        Comments: { caption: 'Comments' },
                                                                                        Flag: { width: '0px' },
                                                                                        WorkHome: { caption: '', width: '25px' },
                                                                                        DateCreated: { caption: 'Date Created', width: '0px' },
                                                                                        CreatedBy: { caption: 'Created By', width: '0px' }
                                                                                    }
                                                                                };
                                                                            </script>
                                                                        </GridConfig>
                                                                                <Scripts>
                                                                                <script>
                                                                                    var fn = function () {
                                                                              
                                                                                        t.on('rowsRendered', function () {
                                                                                            $('[colid="Flag"]:not(".w-grid-head-cell")').each(function () {
                                                                                                var ptr = $(this).closest('tr');
                                                                                                if ($(this).text().toLowerCase() == "1") {
                                                                                                    ptr.css('background', '#FDF5CF');
                                                                                                  
                                                                                                }
                                                                                            });

                                                                                        });
                                                                                    };
                                                                                </script>
                                                                            </Scripts>
                                                                                                 <GridForms>
                                                                     <uc8:Form ID="frmEfforts_ITSSDTasks_New" Hidden="true" AutoInstance="false" runat="server"
                                                                         AsyncForm="~/Pages/eForms/ITSSD/ITSSDTasks_Efforts_FrUc.ascx">
                                                                         <Scripts>
                                                                             <script>
                                                                                 fn = function () {
                                                                                     t.on('show', function () {
                                                                                         t.setParams({ reset: true });

                                                                                         if (!!t.parent) {
                                                                                             t.SetArgVal('ParentRecId', t.parent.rowDetail.getValues("ParentRecId")['ParentRecId']);
                                                                                         }

                                                                                         var CurrentDate = new Date();
                                                                                         var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
                                                                                         var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
                                                                                         var cY = CurrentDate.getFullYear();

                                                                                         $('[argumentid="EffortDate"]', t.el).val(cD + '/' + cM + '/' + cY);

                                                                                         $('[argumentid="Entity"]', t.el).removeAttr('disabled');
                                                                                     });

                                                                                     t.on('onComboFilled', function () {
                                                                                         if (!!t.parent) {
                                                                                             if (jQuery.trim(t.parent.rowDetail.getValues("EntityId")['EntityId']) != "") {
                                                                                                 t.SetArgVal('Entity', jQuery.trim(t.parent.rowDetail.getValues("EntityId")['EntityId']));
                                                                                                 $('[argumentid="Entity"]', t.el).attr('disabled', 'disabled');
                                                                                             }
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
                                                                                         HeadText: 'Actual Efforts'
                                                                                     }
                                                                                 }
                                                                             </script>
                                                                         </WidgetConfig>
                                                                     </uc8:Form>
                                                                 </GridForms>
                                                                 <RowEditForm>
                                                                     <uc8:Form ID="frmEfforts_ITSSDTasks_Update" Hidden="true" AutoInstance="false" RelativeKeys="RecId"
                                                                         runat="server" AsyncForm="~/Pages/eForms/ITSSD/ITSSDTasks_Efforts_FrUc.ascx">
                                                                        <Scripts>
                                                                             <script>
                                                                                 fn = function () {
                                                                                   
                                                                                     t.on('onLoadedValues', function (args) {
                                                                                             if ($('[argumentid="Entity"]', t.el).val() != "") {
                                                                                                 $('[argumentid="Entity"]', t.el).attr('disabled', 'disabled');
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
                                                                                         HeadText: 'Actual Efforts'
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

        <br />
    </Childern>
</uc5:Container>
            <uc8:Form ID="frmITSSDTasks" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/ITSSD/ITSSDTasks_FrUc.ascx" >
                            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Tasks'
                        }
                    }
                    </script>
                </WidgetConfig>
                  <Scripts>
                <script>
                    var fn = function () {

                        t.on('show', function (args) {

                            $('.OnLoadHide', t.el).hide();

                            $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).val('');
                            $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).next('img').removeAttr('disabled').removeClass('ElemDisabled');
                            $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');

                        });

                        t.on('onLoadedValues', function (args) {

                            $('.OnLoadHide', t.el).show();

                            if ($('[argumentid="Monthly"]:checked', t.el).val() == 'on') {

                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).attr('disabled', 'disabled');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).next('img').attr('disabled', 'disabled');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).addClass('ElemDisabled');
                            }

                        });

                        $('[argumentid="Monthly"]', t.el).click(function () {

                            var CurrentDate = new Date();
                            var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
                            var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
                            var cY = CurrentDate.getFullYear();
                            var dM = new Date(cY, cM, 0).getDate();

                            if ($('[argumentid="Monthly"]:checked', t.el).val() == 'on') {

                                $('[argumentid="PlannedStartDate"]', t.el).val('01' + '/' + cM + '/' + cY);
                                $('[argumentid="PlannedEndDate"]', t.el).val(dM + '/' + cM + '/' + cY);

                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).attr('disabled', 'disabled');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).next('img').attr('disabled', 'disabled');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).addClass('ElemDisabled');
                            }
                            else {
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).val('');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).next('img').removeAttr('disabled').removeClass('ElemDisabled');
                                $('[argumentid="PlannedStartDate"],[argumentid="PlannedEndDate"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                            }
                        });

                    };
                </script>
            </Scripts>
            </uc8:Form>