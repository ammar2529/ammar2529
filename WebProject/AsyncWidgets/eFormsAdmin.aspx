<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="eFormsAdmin.aspx.cs" Inherits="WebProject.AsyncWidgets.eFormsAdmin" %>

<%@ Register Src="Widgets/TabPanel.ascx" TagName="TabPanel" TagPrefix="uc1" %>
<%@ Register Src="Widgets/ItemRepeater.ascx" TagName="ItemRepeater" TagPrefix="uc2" %>
<%@ Register Src="Widgets/Form.ascx" TagName="Form" TagPrefix="uc3" %>
<%@ Register Src="Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0"
        class='setWidth'>
        <tr>
            <td style='vertical-align: top; width: 200px;background-color:#DFDFDF'>
                <div style="width: 200px;">
                    <table id="mnuTable" style="width: 100%;" runat="server">
                        <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left; padding-top:10px">

                                <span  style="margin: 5 5 5 5; font-weight:bold; font-size:12px" showwidget="{widgetId:'conGlobalInbox',parentId:'TabPanel1'}"
                                    class="PWCLabel">Global Inbox - Sample</span>
                            </td>
                        </tr>
                                         <tr  Roles="SysAdmin"><td>
                       -----------------------------
                        </td></tr>
                                 <tr  Roles="SysAdmin"><td class="PWCLabel" style="font-weight:bold">
                      eForms Administrator
                        </td></tr>

                        <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer" showwidget="{widgetId:'conOrgSetup',parentId:'TabPanel1'}"
                                    class="PWCLabel">Organization Setup</span>
                            </td>
                        </tr>
                        <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer" showwidget="{widgetId:'conManageUsers',parentId:'TabPanel1'}"
                                    class="PWCLabel">Manage Users</span>
                            </td>
                        </tr>
                        <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer" showwidget="{widgetId:'conRoles',parentId:'TabPanel1'}"
                                    class="PWCLabel">Manage Roles</span>
                            </td>
                        </tr>
                                                <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer" showwidget="{widgetId:'conProcessGeneralSettings',parentId:'TabPanel1'}"
                                    class="PWCLabel">Process General Settings</span>
                            </td>
                        </tr>
                        <tr  Roles="SysAdmin">
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer" showwidget="{widgetId:'conProcessRoleManagement',parentId:'TabPanel1'}"
                                    class="PWCLabel">Process Role Management</span>
                            </td>
                        </tr>

                                                                        <tr><td>
                       -----------------------------
                        </td></tr>
                                                                                            <tr>
                            <td style="white-space: nowrap; text-align: left">
                              &nbsp;&nbsp;--&nbsp;<span style="margin: 5 5 5 5;cursor:pointer; font-weight:bold; padding-right:0px" showwidget="{widgetId:'conMyeFormsSettings',parentId:'TabPanel1'}"
                                    class="PWCLabel">My eForms Settings</span>&nbsp;--&nbsp;
                            </td>
                        </tr>
                        <tr><td>
                       -----------------------------
                        </td></tr>

                                         <tr><td class="PWCLabel" style="font-weight:bold">
                      Process Administration
                        </td></tr>

                                    <tr>
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer;" showwidget="{widgetId:'conProcessGeneralSettings',parentId:'TabPanel1'}"
                                    class="PWCLabel">Process General Settings</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap; text-align: left">
                                &nbsp;-&nbsp;<span style="margin: 5 5 5 5;cursor:pointer;" showwidget="{widgetId:'conProcessManagement',parentId:'TabPanel1'}"
                                    class="PWCLabel">Process Role Management</span>
                            </td>
                        </tr>
                                                <tr><td>
                       -----------------------------
                        </td></tr>
                                                              <tr><td class="PWCLabel" style="font-weight:bold">
                      Process Admin Forms
                        </td></tr>
                                             <tr>
                            <td style="white-space: nowrap; text-align: left" >
                                &nbsp;-&nbsp;<span class="PWCLabel" >iExpense</span>   
                            </td>
                        </tr>
                                                                     <tr>
                            <td style="white-space: nowrap; text-align: left" >
                                &nbsp;-&nbsp;<span class="PWCLabel" style="cursor:pointer"  showwidget="{widgetId:'conEmployeeLogin',parentId:'TabPanel1'}">Employee Login Screen</span>   
                            </td>
                        </tr>
                                                                     <tr>
                            <td style="white-space: nowrap; text-align: left" >
                                &nbsp;-&nbsp;<span class="PWCLabel" style="cursor:pointer"   showwidget="{widgetId:'conParentLog',parentId:'TabPanel1'}">Parent Login Screen</span>   
                            </td>
                        </tr>
                                                                                             <tr>
                            <td style="white-space: nowrap; text-align: left" >
                                &nbsp;-&nbsp;<span class="PWCLabel" style="cursor:pointer"   showwidget="{widgetId:'conCommonLOV',parentId:'TabPanel1'}">Common LOV</span>   
                            </td>
                        </tr>
                    </table>
                    
                    <%--  <div id="logger" style="height:300px;overflow:scroll;border:1px solid black"></div>--%>
                </div>
            </td>
            <td style='vertical-align: top; border: 1px solid black; background-color: #F1EDED'>
                <uc1:TabPanel ID="TabPanel1" Tabs="[{widgetId:&quot;conWelcome&quot;,closeable:false}]"
                    runat="server" />
                <uc5:Container ID="conGlobalInbox" Hidden="true" Caption="Global Inbox" runat="server"
                    EmptyHeight="200px">
                    <Childern>
                        <uc6:DataGrid ID="grdGlobalInbox" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                            AutoSearch="OnLoad" PageSize="20" DataSource="ADM_GetAllOrganizations" ContainerMargin="5px">
                            <GridConfig>
                                { cols: { OrganizationId:{ width:'100px', caption:'hi! 10 < 20 & not good one^ %$' }, Name:{ width:'400px' } } }
                            </GridConfig>
                        </uc6:DataGrid>
                    </Childern>
                </uc5:Container>
                  <!--------------------------- Organization Managment   ----------------------------------->
                <uc5:Container ID="conOrgSetup" Hidden="true" Caption="Organization Setup" runat="server">
                    <Childern>
                        <div>
                         <!-----Search Organizations   ---->
                            <uc3:Form ID="frmSearchOrg" runat="server" Hidden="true" DataSource="ADM_GetAllOrganizations" AsyncForm="forms/Organization/frmSearchOrg.ascx" />
                        </div>
                        <div>
                         <!----- Organizations Grid  ---->
                            <uc6:DataGrid ID="OrgSetup" Forms="frmSearchOrg" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" DeleteCommand="ADM_DeleteOrganizations"
                                PageSize="20" DataSource="ADM_GetAllOrganizations" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
                               GridHeadText="Organizations"
                                >
                                <GridConfig>
                                <script>
                                    cf = {
                                        cols: {
                                            OrganizationId: { width: '100px' },
                                            Name: { width: '300px' }
                                        },
                                        buttons:
                                            {
                                                DeleteRows:
                                                {
                                                    Command: 'ADM_Delete_Organizations', DeleteKeys: 'OrganizationId'
                                                }
                                            }
                                    };
                                </script>
                                </GridConfig>
                                <GridForms>
                                    <uc3:Form ID="frmNewOrg" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/Organization/frmNewOrg.ascx">
                                        <Scripts>
                                            <script>
                                                fn = function (cf) {
                                                    t.on('actionSuccess', function (params) {
                                                        $('.CloseForm',t.el).trigger('click');
                                                        t.parent.search({ reset: true });
                                                    });

                                                }
                                            </script>
                                        </Scripts>
                                    </uc3:Form>
                                    <%--<uc3:Form ID="Form1" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/frmNewOrg.ascx" />--%>
                                </GridForms>
                                <RowEditForm>
                                    <uc3:Form ID="frmUpdateOrg" Hidden="true" AutoInstance="false" RelativeKeys="OrganizationId"
                                        runat="server" DataSource="ADM_GetAllOrganizations" AsyncForm="Forms/Organization/frmUpdateOrg.ascx" />
                                </RowEditForm>
                                <RowDetail>
                                   <pre class="" colindex="3" icon="./widgets/resources/images/ChildGrid.png">
                                     <uc5:Container ID="conOrgUnit" Hidden="true" runat="server">
                                         <Childern>
                                             <div style="padding: 30px">
                                                 <div style="border: 1px solid gray">
                                                     <uc3:Form Hidden="true" ID="frmSearchOrgUnit" AutoInstance="false" 
                                                         AsyncForm="Forms/Organization/frmSearchOrgUnit.ascx"  runat="server" />
                                                     <uc6:DataGrid ID="grdOrgUnit" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                                                         AllowNew="false" Forms="frmSearchOrgUnit" AutoSearch="OnVisible"  SelectableRow="true" 
                                                         PageSize="20" DataSource="ADM_GetOrganizationalUnits" RelativeKeys="OrganizationId" GridTemplate="jQueryUI">
                                                         <GridConfig>
                                                             <script>
                                                                 cf = {
                                                                     cols:
                                                                    {
                                                                        OrganizationalUnitId: {
                                                                            width: '100px',
                                                                            caption: 'hi! testing'
                                                                        }, Name: {
                                                                            width: '200px'
                                                                        }
                                                                    }
                                                                    ,
                                                                    buttons:
                                                                    {
                                                                        DeleteRows:
                                                                        {
                                                                            Command: 'ADM_Delete_OrganizationalUnits', DeleteKeys: 'OrganizationalUnitId'
                                                                        }
                                                                    }
                                                                 };
                                                             </script></GridConfig>
                                                         <RowEditForm>
                                                             <uc3:Form ID="frmUpdateOrgUnit" Hidden="true" AutoInstance="false" RelativeKeys="OrganizationalUnitId"
                                                                 runat="server" DataSource="ADM_GetOrganizationalUnits" AsyncForm="Forms/Organization/frmUpdateOrgUnit.ascx" />
                                                         </RowEditForm>
                                                         <GridForms>
                                                             <uc3:Form ID="frmNewOrgUnit" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/Organization/frmNewOrgUnit.ascx">
                                                                 <Scripts>
                                                                     <script>
                                                                         var fn = function (cf) {
                                                                             t.on('actionSuccess', function (params) {

                                                                                 $('.CloseForm', t.el).trigger('click');
                                                                                 t.parent.search({ reset: false });
                                                                             });
                                                                             t.on('show', function () {
                                                                                 if (!!t.parent) {

                                                                                     $('[argumentid="OrganizationId"]', t.el).val(t.parent.rowDetail.getValues("OrganizationId")['OrganizationId']);
                                                                                 }
                                                                             });
                                                                         }
                                                                     </script></Scripts></uc3:Form></GridForms></uc6:DataGrid>
                                                 </div>
                                             </div></Childern></uc5:Container>
                                </pre>
                        
                                </RowDetail>
                            </uc6:DataGrid>
                        </div>
                    </Childern>
                </uc5:Container>

                <!--------------------------- Users Managment   ----------------------------------->
                 <uc5:Container ID="conManageUsers" Hidden="true" Caption="Manage Users" runat="server">
                    <Childern>
                        <div>
                            <uc3:Form ID="frmSearchUsers" Hidden="true" runat="server" AsyncForm="forms/UserManagment/frmSearchUsers.ascx" >
                           </uc3:Form>
                        </div>
                        <div>
                            <uc6:DataGrid ID="GrdUser" Forms="frmSearchUsers" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" DeleteCommand="ADM_DeleteOrganizations"
                                PageSize="10" DataSource="ADM_SearchUsers" ContainerMargin="5px"  AutoSearch="OnLoad" GridHeadText="Manage Users" 
                               GridButtons="{\'delete\':{visible:false},disableusers:{text:\'Disable Users\',conf:{Action:\'DeleteRows\',Command:\'ADM_UPD_DisableUsers\',KeysCol:\'UserId\'}},enableusers:{text:\'Enable Users\',conf:{Action:\'DeleteRows\',Command:\'ADM_UPD_EnableUsers\',KeysCol:\'UserId\'}}}">
                                <Scripts>
                                    <script>
                                        fn = function () {
                                            t.DisableUsers = function () {
                                                alert('Are you sure!');
                                            }

                                        }
                                    </script>
                                </Scripts>
                                <GridConfig>
                                    <script>
                                        cf = {
                                            cols: {
                                                Name: { width: '175px' },
                                                Manager: { width: '30px' },
                                                Director: { width: '30px' },
                                                Disabled: { width: '30px' },
                                                Secretary: {width:'30px'}
                                            },
                                            pager: {
                                                PageSizeType: 'Dropdown'
                                            }
                                        }

                                    </script>
                                </GridConfig>
                                <GridForms>
                                  <uc3:Form ID="frmAddUser" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/UserManagment/frmAddUser.ascx">
                                   <Scripts>
                                <script>
                                    fn = function () {
                                        
                                        t.on('afterDataAction', function (params) {
                                           
                                            var grd = AsyncWidgets.get('GrdUser');
                                            $('.CloseForm', t.el).trigger('click');
                                            grd.sortCol = 'DateCreated';
                                            grd.sortDir = 'Desc';
                                            grd.RequeryGrid();
                                        });
                                    }
                                </script>
                            </Scripts>
                                  </uc3:Form>
                                </GridForms>
                                <TopTemplate>
                                    <div class="w-panel-head w-top-corner">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                        <tr>
                                            <td >
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td class="w-head-text">
                                                            Manager Users
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:100%">&nbsp;</td>
                                            <td>
                                            <span style="" class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon">&nbsp;</span>
                                            </td>
                                        </tr>
                                    </table>
                                   </div>

                                </TopTemplate>
                                <HeaderTemplate>
                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr  class="w-grid-head-back">
                                                <td class="PWCListTitle ColTemplate w-grid-head-back w-grid-cell-border" style="height: 25px;">
                                                    <div>
                                                        <span href="#" class='w-grid-head ColName sort'></span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="TemplatesById">
                                                <td templateid="SelectableRow" style="width: 32px; padding: 0px;overflow:hidden;margin:0px"
                                                   class="w-grid-cell-border w-grid-head-back">
                                                    <div style="width: 19px; overflow: hidden;overflow:hidden; margin-left: 5px;">
                                                        <input type="checkbox" class="chkRowSelect"></div>
                                                </td>
                                                <td templateid="Sequence" style="width: 40px;overflow:hidden;"  class="w-grid-head-back w-grid-cell-border">
                                                    <div style="overflow: hidden;" class="PWCLabel ColName"></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </HeaderTemplate>
                                <RepeaterTemplate>
                                    <div class="GridContainer">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; text-align: left">
                                            <tbody>
                                                <tr class="TopTR">
                                                    <td class="Top">
                                                    </td>
                                                </tr>
                                                <tr class="HeaderTR">
                                                    <td class="Header w-grid-border">
                                                    </td>
                                                </tr>
                                                <tr class="ItemTR">
                                                    <td class="Item w-grid-border">
                                                    </td>
                                                </tr>
                                                <tr class="NoRecordsTR" style="display: none;">
                                                    <td class="NoRecords" style="border: 1px solid #F1C483">
                                                    </td>
                                                </tr>
                                                <tr class="BottomTR">
                                                    <td class="Bottom">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </RepeaterTemplate>
                                <ItemTemplate>
                                    <table cellspacing="0" cellpadding="0" border="0" style="table-layout:fixed;">
                                        <tbody>
                                            <tr style="white-space: nowrap" EvenRowCSS="w-grid-row-odd" OddRowCSS="w-grid-row-odd" HoverRowCSS="">
                                                <td class="ColTemplate w-grid-cell-border" style="white-space: nowrap; overflow: hidden">
                                                    <div class="ColValue w-grid-label" style="white-space: nowrap">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="TemplatesById">
                                                <td templateid="SelectableRow" style="margin:0px;width: 32px;overflow:hidden;"  class="w-grid-cell-border">
                                                    <div style="width: 19px; overflow: hidden; margin-left: 5px; ">
                                                        <input type="checkbox" class="chkRowSelect"></div>
                                                </td>
                                                <td templateid="Sequence" style="width: 40px;"  class="w-grid-cell-border">
                                                    <div style="overflow: hidden;" class="w-grid-label ColValue"></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </ItemTemplate>
                                <BottomTemplate>
                                    <span class="Pager"></span>
                                </BottomTemplate>
                                <PagerTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:White;padding:2px;table-layout:auto;" class="w-grid-border-bottom" pagersizetype="numbers">
                                        <tbody>
                                            <tr>
                                                <td align="left" style="width:50%;height:26px">
                                                    
                                                    <table border="0" cellpadding="0" cellspacing="0" >
                                                        <tbody>
                                                            <tr class="w-grid-buttons-bottom-container">
  

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td align="center"> 
                                                <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;white-space:nowrap">
                                                <tbody>
                                                <tr>
                                                <td class="w-all-corner w-grid-button First"  >
                                                    <span class="w-ui-icon-yellow w-grid-icon-first" ></span></td>
                                                <td class="w-all-corner w-grid-button Back"  >
                                                    <span class="w-ui-icon-yellow w-grid-icon-pre "></span></td>
                                                <td style="padding-left:5px;padding-right:5px;width: 4px; cursor: default" class="w-all-corner w-elem-disabled">
                                                    <div class="w-icon-separator"></div></td>
                                                <td dir="ltr" class="w-grid-pg-text PWCLabel" style="white-space:nowrap;vertical-align:middle;padding:0px">&nbsp;Page&nbsp;&nbsp;<input type="text"  maxlength="7" size="2" class="PWCTextBox PageNoToGo PageNo">&nbsp;&nbsp;of&nbsp; 
                                                    <span class="TotalPages">&nbsp;2&nbsp;</span></td>
                                                <td style="padding-left:5px;padding-right:5px;width: 4px; cursor: default;" class="w-all-corner w-elem-disabled">
                                                    <div class="w-icon-separator"></div></td>
                                                <td class="w-all-corner w-grid-button Next"  >
                                                    <span class="w-ui-icon-yellow w-grid-icon-next "></span></td>
                                                <td class="w-all-corner w-grid-button Last"  >
                                                    <span class="w-ui-icon-yellow w-grid-icon-last "></span></td><td dir="ltr" style="padding-left:5px">
                                                        <select class=" PWCDropDownList PageSize PageSize-Dropdown" style="display: none;">
                                                            <option selected="" value="10" role="option">10</option>
                                                            <option value="20" role="option">20</option>
                                                            <option value="30" role="option">30</option>
                                                        </select>
                                                         </td></tr></tbody>
                                                         </table> 
                                                </td>
                                                <td align="right"  style="width:50%">
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" >
                                                        <tbody>
                                                            <tr>
                                                                <td align="right">
                                                              <span><span class="PWCLabel PageSize-NumberList" style="padding-right:0px;display:none;">Items per page : <span class="PageSize">10</span>, <span class="PageSize">20</span>, <span class="PageSize">30</span></span><span class="PWCLabel PageSize-NumberList" style="display:none;padding-left:10px;padding-right:10px;">|</span>
                                                              
                                                              <span class="PWCLabel" style="padding-right:5px">View <span class="ItemStart"></span> - <span class="ItemEnd">&nbsp;</span>&nbsp;of <span class="Count"></span></span>
                                                                </td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </PagerTemplate>
                                    </uc6:DataGrid>
                                    </div>
                                    </Childern>
                                    </uc5:Container>
                                    
                     <uc5:Container ID="conRoles" Hidden="true" Caption="Role Managment" runat="server">
                    <Childern>
                        <div>
                            <uc3:Form Hidden="true" ID="frmSearchRoles" runat="server" AsyncForm="forms/frmSearchRoles.ascx" />
                        </div>
                        <div>
                            <uc6:DataGrid ID="grdRoles" Forms="frmSearchRoles" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                                PageSize="20" DataSource="ADM_SearchRoles" ContainerMargin="5px" GridTemplate="jQueryUI">

                            </uc6:DataGrid>
                        </div>
                    </Childern>
                </uc5:Container>
                <!--------------------------- Process Managment   ----------------------------------->
                 <uc5:Container ID="conProcessManagement" Hidden="true" Caption="Process Role Management" runat="server">
                    <Childern>
                        <div>
                            <uc3:Form ID="frmSearchProcessManagment" Hidden="true" runat="server" AsyncForm="forms/ProcessManagment/frmSearchProcessManagment.ascx" >
                                <Scripts> 
                                    <script>
                                        var fn = function () {
                                            var grdRoles = AsyncWidgets.get('grdProcRoles');
                                            t.on('AutocompleteResult', function (a) {
                                                if (a.elem.attr('argumentid') == 'User') {

                                                }
                                            });
                                            $('select[argumentid="OrganizationId"]', t.el).change(function () {

                                                if (!$(this).val()) {
                                                    $('.ProcessNamesRow').hide();
                                                }
                                                else {
                                                    $('.ProcessNamesRow').show();
                                                }
                                                $('.RolesRow').hide();
                                                grdRoles.hide();

                                            });
                                            $('select[argumentid="FormType"]', t.el).change(function () {
                                                if (!$(this).val()) {
                                                    $('.RolesRow').hide();
                                                }
                                                else {
                                                    $('.RolesRow').show();
                                                }
                                                grdRoles.hide();
                                            });
                                            $('li.ProcessItem', t.el).live('click', function () {

                                                $('select[argumentid="FormType"]', t.el).val($(this).attr('FormType')).trigger('change');
                                                $('li.ProcessItem', t.el).removeClass('PWCLabelValue');
                                                $(this).addClass('PWCLabelValue');
                                            });
                                            $('li.RoleItem', t.el).live('click', function () {
                                                $('select[argumentid="RoleId"]', t.el).val($(this).attr('roleid')); //.trigger('change');
                                                $('li.RoleItem', t.el).removeClass('PWCLabelValue');
                                                $(this).addClass('PWCLabelValue');
                                                grdRoles.show();
                                                $('.search', t.el).trigger('click');
                                            });
                                            t.on({
                                                onParentComboChanged: function (args) {
                                                    if (args.child.attr("argumentid") == "FormType") {

                                                    }
                                                }
                                                ,
                                                beforeComboFill: function (args) {
                                                    // alert(args.combo.attr("argumentid"));
                                                },
                                                onComboFilled: function (args) {
                                                    var Rows = args.Response.Response.Rows, recs = {}, i;
                                                    // alert(args.combo.attr("argumentid"));
                                                    if (args.combo.attr("argumentid") == "OrganizationId") {
                                                        var cbo = args.combo[0];
                                                        if (cbo.options.length == 2) cbo.options.selectedIndex = 1;
                                                        args.combo.trigger('change');
                                                    }
                                                    if (args.combo.attr("argumentid") == "RoleId") {
                                                        var cbo = args.combo[0];
                                                        //
                                                        var iTemp = '&lt;li class="PWCLabel RoleItem" roleid="{1}" style="text-decoration:underline;cursor:pointer;none;user-select: none;">{0}&lt;/li>',
                                                       items = "";
                                                        for (i = 0; i < cbo.options.length; i++) {
                                                            items += String.format(iTemp, cbo.options[i].text, cbo.options[i].value);
                                                        }
                                                        $('ul.ListProcessRoles', t.el).html(items);
                                                    }
                                                    if (args.combo.attr("argumentid") == "InitiatorRoles") {
                                                        var cbo = args.combo[0];
                                                        var iTemp = '&lt;li class="PWCLabel InitRoleItem" roleid="{1}" style="none;user-select: none;">{0}&lt;/li>',
                                                       items = "";
                                                        for (i = 0; i < cbo.options.length; i++) {
                                                            items += String.format(iTemp, cbo.options[i].text, cbo.options[i].value);
                                                        }
                                                        $('ul.ListInitRoles', t.el).html(items);
                                                    }
                                                    if (args.combo.attr("argumentid") == "FormType") {
                                                        $('.rowProcessNames td:not(".FullWidth"),.NoRecs', t.el).remove();
                                                        $('.rowDepts td:not(".FullWidth")', t.el).remove();
                                                        if (Rows.length > 0) {

                                                            for (i = 0; i < Rows.length; i++) {

                                                                if (!recs[Rows[i].ModuleName]) {
                                                                    recs[Rows[i].ModuleName] = [{ FormName: Rows[i].FormName, FormType: Rows[i].FormType}];
                                                                    // recs[Rows[i].ModuleName][0]=[{ FormName: Rows[i].FormName, FormType: Rows[i].FormType}];
                                                                }
                                                                else
                                                                    recs[Rows[i].ModuleName][recs[Rows[i].ModuleName].length] = { FormName: Rows[i].FormName, FormType: Rows[i].FormType };
                                                            }
                                                            var key, HeadTemplate = '&lt;td style="padding-left:10px">&lt;span class="PWCLabel">&lt;u>&lt;b>{0}&lt;/b>&lt;/u>&lt;/span>&lt;/td>',
                                                                head = "", items = "", itemTemplate = '&lt;li class="PWCLabel ProcessItem" formtype="{1}" style="text-decoration:underline;cursor:pointer;none;user-select: none;">{0}&lt;/li>';
                                                            for (key in recs) {
                                                                head += String.format(HeadTemplate, key);
                                                                for (i = 0; i < recs[key].length; i++) {
                                                                    items += String.format(itemTemplate, recs[key][i].FormName, recs[key][i].FormType);
                                                                }
                                                                $('.rowProcessNames .FullWidth', t.el).before('&lt;td valign="top" nowrap="nowrap" style="padding-right:20px;">&lt;ul type="disc">' + items + '&lt;/ul>&lt;/td>');
                                                                items = "";
                                                            }
                                                            $('.rowDepts .FullWidth', t.el).before(head);
                                                        }
                                                        else {
                                                            $('.rowProcessNames .FullWidth', t.el).before('&lt;td class="NoRecs"> No processes found!&lt;/td>');
                                                            $('.ProcessNamesRow,.RolesRow').hide();
                                                            grdRoles.hide();
                                                        }
                                                    }
                                                }

                                            });
                                        }
                                        
                                    </script>
                                
                                </Scripts>
                            </uc3:Form>
                        </div>
                        <div>
                            <uc6:DataGrid ID="grdProcRoles" Forms="frmSearchProcessManagment" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" AutoSearch="none" 
                                PageSize="20" DataSource="ADM_Sel_UserByOrgAndRoles" ContainerMargin="5px"  GridTemplate="jQueryUI" SingleRowSelect="true">
                                <GridConfig>
                                <script>
                                    cf = {
                                        cols: {
                                            Name: { caption: 'Employee Name' },
                                            UsersId: {width:'0px'},
                                            PersonalId:{width:'0px'},
                                            OrganizationId:{width:'0px'}
                                        },
                                        buttons:
                                        {
                                            DeleteRows:
                                            {
                                                Command: 'ADM_Del_EmployeeUserRole',
                                                DeleteKeys: 'UsersId'
                                            }
                                        }
                                    }
                                     </script>
                                </GridConfig>
                                <Scripts>
                                    <script>
                                        var fn = function () {
                                            var frmSPM = AsyncWidgets.get('frmSearchProcessManagment');
                                            /////////////////////////////////////////////////////////////////////////

                                            t.on('beforeRowDelete', function (args) {
                                                var org = $('select[argumentid="RoleId"]', AsyncWidgets.get("frmSearchProcessManagment").el)[0];
                                                if (org.selectedIndex > -1) {
                                                    args.cf["RoleId"] = org.options[org.selectedIndex].value;
                                                }
                                                else {
                                                    args.flags.queryDelete = false;
                                                    alert('Please select an organization!');
                                                }
                                            }); //beforeRowDelete
                                            /////////////////////////////////////////////////////////////////////////////
                                            t.on({
                                                'onFetchRecords': function () {
                                                    $('.Top .Counters,.Header,.Item,.Bottom', t.el).show();
                                                    $('.Top .PWCNoDataMessage', t.el).remove();
                                                }, //onFetchRecords
                                                'onNoRecords': function (args) {
                                                    //  debugger;
                                                    args.flags.queryShowDefTemp = false;
                                                    $('.Top .Counters,.Header,.Item,.Bottom', t.el).hide();
                                                    if ($('.Top .PWCNoDataMessage', t.el).length == 0)
                                                        $('.Top .Actions', t.el)
                                                         .after($('&lt;div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.&lt;/div>'));

                                                } //onNoRecords
                                            });

                                            t.on('TemplateLoaded', function () {
                                                $('.Actions .AssignRole', t.el)[0].disabled = true;
                                                $('.Actions [argumentid="UserName"]', t.el).blur(function () {
                                                    fnd = function () {
                                                        //  debugger;
                                                        if ($.trim(this.value) == "" || $('.Actions [argumentid="UsersId"]', t.el).val() == "") {
                                                            $('.Actions .AssignRole', t.el)[0].disabled = true;
                                                        }
                                                        else {
                                                            $('.Actions .AssignRole', t.el)[0].disabled = false;
                                                        }
                                                    };
                                                    (fnd).defer(250, this);

                                                });

                                                if (!!$('.Actions .AutoComplete', t.el).length) {
                                                    fnCB = function () {

                                                        $('.Actions .AutoComplete', t.el).each(function () {

                                                            function formatItem(row, i, total) {
                                                                var FormattedRow = "";
                                                                for (var iLoop = 0; iLoop < row.length; iLoop++) {
                                                                    FormattedRow += (typeof row[iLoop] == 'undefined' ? " " : row[iLoop]) + (iLoop == (row.length - 1) ? "" : " &nbsp;, ");
                                                                }
                                                                return FormattedRow;
                                                            }
                                                            //MatchContains, cf.Multiple , cf.MatchSubset,cf.MinChar ,cf.Width,cf.Max,cf.Delay
                                                            var cf = decJSON(this.getAttribute('conf'));
                                                            cf.ACParams = cf.ACParams || {};

                                                            $(this).autocomplete('WebServices/RemoteActions.asmx/DoAction', Ext.apply({
                                                                contentType: "application/json; charset=utf-8",
                                                                method: 'POST',
                                                                multiple: false,
                                                                matchContains: true,
                                                                matchSubset: false,
                                                                mustMatch: true,
                                                                autoFill: true,
                                                                width: 0,
                                                                max: 100,
                                                                cacheLength: 0,
                                                                minChars: 3,
                                                                delay: 500,
                                                                formatItem: formatItem,
                                                                cellSeparator: '||',
                                                                formatRequestData: function (p) {
                                                                    var SrvInf, rdata = p.rdata;
                                                                    rdata.QueryId = cf.QueryId || 'default';
                                                                    rdata.StoreId = cf.StoreId;
                                                                    SrvInf = getForm(t.el, null, rdata, cf.ParamFields, true);
                                                                    t.fireEvent('getExtraParams', this, SrvInf);
                                                                    $.extend(p.form, { ActorId: cf.ActorId, ActionId: cf.ActionId, ServiceInfo: SrvInf });
                                                                    p.rdata = rdata = encJSON(p.form);
                                                                }

                                                            }, cf.ACParams)).result(function (event, data, formatted) {
                                                                //debugger;
                                                                if (!data) return;
                                                                if (!!cf.ArgToSet) {
                                                                    for (var i = 0; i < cf.ArgToSet.length; i++) {
                                                                        if (!!data[cf.ArgToSet[i].Index]) {
                                                                            if (!!cf.ArgToSet[i].Name) {
                                                                                setField($('[argumentid="' + cf.ArgToSet[i].Name + '"]', t.el), data[cf.ArgToSet[i].Index]);
                                                                            }
                                                                            else {
                                                                                alert('Field name not found!');
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                t.fireEvent('AutocompleteResult', { elem: $(this), data: data });
                                                            });  //end of autocomplete function result();
                                                            //return false;
                                                        }); //end of each();
                                                    } //end of fnCB
                                                    AsyncWidgets.loadCSS('jquery.autocomplete', 'AutoComplete');
                                                    AsyncWidgets.loadJS('jquery.autocomplete', 'AutoComplete', fnCB);
                                                }
                                            }); //TemplateLoaded

                                            $('.Actions .AssignRole', t.el).live('click', function () {

                                                var inv = new AsyncWidgets.RAInvoker();
                                                inv.on('onSuccess', function (res) {
                                                    t.$el.unmask();
                                                    var res = decJSON(res);

                                                    if (res.status == 'OK') {
                                                        params = res.Response.split('||');
                                                        if (!!t.searchCF) {
                                                            if (t.searchCF.wg)
                                                                t.search({ reset: false, wg: t.searchCF.wg });
                                                            else t.search({ reset: false });
                                                        }
                                                        else
                                                            t.search({ reset: false });

                                                        $('[argumentid="UsersId"],[argumentid="UserName"]', t.el).val('');
                                                        $('.AssignRole', t.el)[0].disabled = true;
                                                        $('.Actions', t.el).hide();
                                                        $.showMessage(params[2]);
                                                    }
                                                });
                                                inv.on('onFailure', function (res) {
                                                    t.$el.unmask();
                                                });

                                                var ServiceInfo = getForm($('.frmRoleAssign')[0], null, { Command: 'ADM_Ins_RoleToUser', RoleId: $('[argumentid="RoleId"]', frmSPM.el).val() });
                                                t.$el.mask('Please wait while loading ...');
                                                inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo",
                                                ServiceInfo]
                                                });

                                            });
                                            t.on('onActionClicked', function (cf) {
                                                
                                                if (cf.Action == "ShowGridForm") {
                                                    cf.cancel = true;
                                                   $('.Actions',t.el).show();
                                                }

                                            }); //onActionClicked

                                        }
                                    </script>
                                </Scripts>
                                <TopTemplate>
                                    <table width="100%" border="0" class="Actions" style="display:none">
                                        <tbody>
                                            <tr>
                                                <td class='frmRoleAssign'>
                                                    <input type="button" conf="{Action:'DeleteRows'}" class="PWCButton ActionButton" value="Delete" id="btnDelete">
                                                    &nbsp; &nbsp; <input id="Text3" type="text" class="PWCTextBox AutoComplete" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'Users',ACParams:{multiple:false,width:225},ArgToSet:[{Index:1,Name:'UsersId'}]}"
                                                    groupid="AsignUser" argumentid="UserName" style="width:200px" />
                                                    <input  type="text" class="PWCTextBox" groupid="AsignUser" argumentid="UsersId" style="display:none" />
                                                  <input type="button"  class="PWCButton AssignRole"  value=" Assign "  >
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                     <div class="w-panel-head w-top-corner">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                        <tr>
                                            <td >
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td class="w-head-text">
                                                            Manager User Roles
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:100%">&nbsp;</td>
                                            <td>
                                            <span style="" class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon">&nbsp;</span>
                                            </td>
                                        </tr>
                                    </table>
                                   </div>
                                </TopTemplate>
                            </uc6:DataGrid>
                        </div>
                    </Childern>
                 </uc5:Container>
                 <!--------------------------- Process Managment   ----------------------------------->
                <uc5:Container ID="Container1" Hidden="true" Caption="Process Managment" runat="server">
                    <Childern>
                        <div>

                        </div>
                    </Childern>
                </uc5:Container>
               <!--------------------------- Welcome Tab ----------------------------------->
                <uc5:Container ID="conWelcome" Hidden="true" Caption="&nbsp;Welcome" runat="server">
                    <Childern>
                        <div style="padding-left:10px;padding-top:10px" class="PWCLabel">
                        <b class="PWCLabelValue">Welcome to eForms Administration Module</b>
                        <br />
                        <br />
                        eForms Administration Module provides you with options to update your basic informations, manage your processes...
                        </div>
                    </Childern>
                </uc5:Container>
               <!--------------------------- Process General Settings ----------------------------------->
                <uc5:Container ID="conProcessGeneralSettings" Hidden="true" Caption="Process General Settings" runat="server">
                    <Childern>
                            <table style="width: 100%;height:100%" border="0" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td style="padding-left:2px;padding-top:2px">
                                    <%--<div  style="padding-top:2px;font-family:Arial;font-size:13px;color:#444444;text-align:center;vertical-align:middle;height:21px;background: url(./Widgets/resources/images/HeadGradient.gif) repeat-x"><b>Processes</b></div>--%>
                                    <div style="height:1px;width:200px">&nbsp</div>
                                          <uc3:Form ID="Form1" runat="server" Hidden="true" AsyncForm="forms/Process/frmProcessLeftSideGS.ascx" >
                                            <Scripts>
                                                <script>
                                                    var fn = function () {
                                                        //debugger;

                                                        //  (function (t) { alert($('.AccMenu', t.el).parent().height()); }).defer('500',this,[t]);
                                                        // alert($('.AccMenu').parent().parent().parent().height());
                                                        // $('.AccMenu', t.le).click(function () { $('.AccMenu', t.le).parent().height(); });
                                                        var mouseDown = false, scrDown, innerTabPNL = AsyncWidgets.get('innerTabPanel1');

                                                        $('.ScrollTop,.ScrollDown', t.el).live('mouseenter', function () {
                                                            mouseDown = true;
                                                            scrDown = false;
                                                            if ($(this).hasClass('ScrollDown')) scrDown = true;
                                                            fnRep = function (t) {
                                                                // console.log(mouseDown);
                                                                if (mouseDown) {
                                                                    var elem = $('.AccMenuItems', t.el);
                                                                    elem.scrollTop(
                                                                        scrDown ? elem.scrollTop() + 5 : elem.scrollTop() - 5
                                                                    );
                                                                    fnRep.defer(1, this, [t]);
                                                                }
                                                            };
                                                            fnRep.defer(50, this, [t]);
                                                        });
                                                        $('.ScrollTop,.ScrollDown', t.el).live('mouseleave', function () {
                                                            mouseDown = false;
                                                        });
                                                        $('.DataProfileItem').live('click', function () {
                                                        
                                                            if (!!t.lastSelectedItem) {
                                                                t.lastSelectedItem.removeClass('SelectedItem');

                                                            }
                                                            t.lastSelectedItem = $(this ).addClass('SelectedItem');
                                                            var PGS = AsyncWidgets.get('frmProcessGS');
                                                            $('[argumentid="ProcessName"]', PGS.el).val($(this).text());
                                                            $('[argumentid="BusinessFunction"]', PGS.el).val($(this).attr('businessfunction'));
                                                            $('[argumentid="DataProfileId"]', PGS.el).val($(this).attr('dataprofileid'));
                                                            $('[argumentid="FormType"]', PGS.el).val($(this).attr('formtype'));
                                                            $('[argumentid="FormNameCode"]', PGS.el).val($(this).attr('formnamecode'));
                                                            PGS.loadValues({ Command: 'ADM_GetGInboxProcSettings' });
                                                            innerTabPNL.fireEvent('onShowTab', { t: innerTabPNL, tab: innerTabPNL.tabs[innerTabPNL.activeTabId] });
                                                            $('.UpdateProcess', PGS.el)[0].disabled = false;
                                                        });
                                                        (function (t) {
                                                            t.accordionRes = true;
                                                            var ht = $('.AccMenu', t.el).parent().parent().parent().height() - 2;
                                                            $('.AccMenu', t.el).height(ht - 8).css('border', '0px');
                                                            $('.AccMenuItems', t.el).height(ht - 50);
                                                            $('.AccMenu', t.el).show();
                                                        }).defer('750', this, [t]);
                                                        var inv = new AsyncWidgets.RAInvoker();
                                                        inv.on('onSuccess', function (res) {
                                                            var res = decJSON(res), rows = res.Response.Rows, scrollTop, scrollDown; //#C5DFFC
                                                            scrollTop = '&lt;div class="unselectable ScrollTop" style="z-index:1000;position:absolute;left:0;top:0;background-color:#C5DFFC;width:100%;font-family:Arial;font-weight:bold;font-size:11px;padding-top:3px;color:#444444;text-align:center;vertical-align:middle;height:21px;background: url(./Widgets/resources/images/HeadGradient.gif) repeat-x">Processes&lt;span class="unselectable" style="display:block;cursor:pointer;top:3px;width:20px;right:3px;position:absolute;float:right;background:url(Widgets/resources/images/ScrollTop.gif) center center no-repeat  ">&nbsp;&nbsp;&lt;/span>&lt;/div>';
                                                            // scrollDown = '&lt;div class="ScrollDown" style="z-index:1000;position:absolute;left:0 ;bottom:0;width:100%;background:url(Widgets/resources/images/ScrollDown.gif) center center no-repeat #F1C483;user-select: none; -moz-user-select: -moz-none;cursor:pointer;" >&amp;nbsp;&lt;/div>'
                                                            scrollDown = '&lt;div class="unselectable ScrollDown" style="height:21px;z-index:1000;position:absolute;left:0 ;bottom:0;width:100%;background:url(Widgets/resources/images/HeadGradient.gif) center center repeat-x #F1C483;">&nbsp;&lt;div class="ScrollDown" style="position:absolute;top:0px;right:3px;cursor:pointer;float:right;width:20px;background:url(Widgets/resources/images/ScrollDown.gif) center center no-repeat">&nbsp;&lt;/div>&lt;/div>'
                                                            if (res.status == 'OK') {
                                                                if (rows.length > 0) {
                                                                    var html = '&lt;div class="AccMenuItems mousewheel" style="margin-top:19px;margin-bottom:19px;overflow:hidden;position:relative">&lt;ul  class="accordionmenu collapsible" style="border:0px">', top, childern = "", mn, i = 0, firstHead = true, stl;
                                                                    mn = rows[0].ModuleName;
                                                                    stl = "margin-top:2px;"
                                                                    while (i < rows.length) {


                                                                        childern += String.format('&lt;li class="AccHead" style="border: 1px solid #FBD850;{1}" tabindex="-1" >&lt;a href="#" tabindex="-1">&lt;span class="RightArrow" >&nbsp;&nbsp;&lt;/span>{0}&lt;/a>&lt;ul>', mn, stl);
                                                                        if (firstHead) {
                                                                            firstHead = false;
                                                                            //  stl = 'margin-top:5px;';
                                                                        }
                                                                        while (mn == rows[i].ModuleName) {
                                                                            childern += String.format('&lt;li class="childitem">&lt;a href="#" dataprofileid="{1}" businessfunction="{2}" formtype="{3}" formnamecode="{4}" class="DataProfileItem"  style="color: #333333;">{0}&lt;/a>&lt;/li>', rows[i].FormName, rows[i].DataProfileId, rows[i].ModuleName, rows[i].FormType, rows[i].FormNameCode);
                                                                            i++;
                                                                            if (i >= rows.length) break;
                                                                        }
                                                                        if (i < rows.length) mn = rows[i].ModuleName;
                                                                        childern += "&lt;/ul>&lt;/il>";
                                                                        html += childern;
                                                                        childern = "";
                                                                    }
                                                                    // debugger;
                                                                    html += "&lt;/ul>&lt;/div>"
                                                                    if (!t.accordionRes) $('.AccMenu').hide();
                                                                    $('.AccMenu').html(html + scrollTop + scrollDown);

                                                                    $('ul.accordionmenu ul', t.el).hide();
                                                                    $.each($('ul.accordionmenu', t.el), function () {
                                                                        $('#' + this.id + '.expandfirst ul:first', t.el).show();
                                                                    });
                                                                }
                                                            }
                                                        });
                                                        inv.on('onFailure', function (res) {
                                                            alert('Problem occured while connection to web server');
                                                        });

                                                        AsyncWidgets.loadCSS('AccordionMenu', 'AccordionMenu.css');
                                                        var ServiceInfo = getForm(null, null, { Command: 'ADM_GetProcessByModuleName', PageSize: -1 });
                                                        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo", ServiceInfo] });
                                                    }
                                                </script>
                                            </Scripts>
                                          </uc3:Form>
                                    
                                    </td>
                                    <td style=" width: 100%;">

                                            <div><uc3:Form ID="frmProcessGS" runat="server" Hidden="true" AsyncForm="forms/Process/frmProcessGS.ascx" /></div>

                                            <div class="FitRem" style="margin-top:5px; padding-left:2px;padding-right:2px;">
                                                <uc1:TabPanel ID="innerTabPanel1" Tabs="[{widgetId:&quot;conQuickView&quot;,closeable:false},{widgetId:&quot;conDocumentLibrary&quot;,closeable:false},{widgetId:&quot;conRolesTab&quot;,closeable:false},{widgetId:&quot;conSubmissionService&quot;,closeable:false},{widgetId:&quot;conRecrodMovement&quot;,closeable:false},{widgetId:&quot;conEmailConfiguration&quot;,closeable:false},{widgetId:&quot;conRuleEngine&quot;,closeable:false},{widgetId:&quot;conMassApprove&quot;,closeable:false}]" AutoBuild="false" runat="server" >
                                                <Scripts>
                                                    <script>
                                                        var fn = function () {
                                                            t.on("onShowTab", function (cf) {
                                                                cf.tab._FLAGS_ = cf.tab._FLAGS_ || { FormType: "" };
                                                                var frmProcGS = AsyncWidgets.get('frmProcessGS'),
                                                                      FormType = frmProcGS.GetArgVal('FormType'),
                                                                       DPId = frmProcGS.GetArgVal('DataProfileId'),
                                                                      Formchanged = cf.tab._FLAGS_.FormType != FormType;

                                                                //FormType = $('[argumentid="FormType"]', frmProcGS.el).val();
                                                                //DataProfileId
                                                                if (cf.tab.id == "conQuickView") {
                                                                    if (Formchanged) {
                                                                        var GQV = AsyncWidgets.get('grdQuickView'),
                                                                    frmQV = AsyncWidgets.get('frmAddQuickView');
                                                                        frmQV.setParams({ reset: true });
                                                                        GQV.search({ wg: frmProcGS });

                                                                        frmQV.LoadCombo(frmQV, $('[argumentid="ColumnName"]', frmQV.el),
                                                                            undefined, { params: { FormType: FormType} });
                                                                    }
                                                                }
                                                                else if (cf.tab.id == "conRolesTab") {

                                                                    if (Formchanged) {
                                                                        AsyncWidgets.get('grdProcGenralRoles').hide();
                                                                        var frmRL = AsyncWidgets.get('frmAddEditAssignRoles');
                                                                        frmRL.LoadCombo(frmRL, $('[argumentid="RoleId"]', frmRL.el),
                                                                            undefined, { params: { FormType: FormType} });
                                                                    }
                                                                    // grdProcGenralRoles.hide();
                                                                }
                                                                else if (cf.tab.id == "conDocumentLibrary") {

                                                                    if (Formchanged) {
                                                                        var frm = AsyncWidgets.get('frmDocumentLib');
                                                                        if ($('.SaveDocLib', frm.el).length > 0)
                                                                            $('.SaveDocLib', frm.el)[0].disabled = false;

                                                                        frm.loadValues({ Command: 'ADM_Sel_DocLibConfig', Params: { ProfileId: frmProcGS.GetArgVal('DataProfileId')} });
                                                                    }
                                                                }
                                                                else if (cf.tab.id == "conSubmissionService") {
                                                                    if (Formchanged) {
                                                                        var frm = AsyncWidgets.get('frmSumission');
                                                                        frm.LoadCombo(frm, $('[argumentid="SubmissionId"]', frm.el), undefined, { params: { DataProfileId: DPId} });
                                                                    }
                                                                }
                                                                cf.tab._FLAGS_.FormType = FormType;
                                                            });
                                                        }
                                                    </script>
                                                </Scripts>
                                                </uc1:TabPanel>
                                            </div>

                                        
                                    </td>
                                </tr>
                            </table>
                           
                    </Childern>
                </uc5:Container>
                 <!--------------------------- Quick View Tab ----------------------------------->
                <uc5:Container ID="conQuickView" Hidden="true" Caption="&nbsp;Quick View" runat="server">

                    <Childern>

                        <div style="padding-right:0px;padding-top:10px" class="PWCLabel">
                          <uc3:Form ID="frmAddQuickView" Hidden="true"  runat="server"  AsyncForm="forms/Process/frmAddQuickView.ascx" >
                            <Scripts>
                                <script>
                                    var fn;
                                    fn = function () {
                                        var frmProcGS = AsyncWidgets.get('frmProcessGS');
                                        $('[argumentid="ColumnName"]', t.el).change(function () {

                                            var vl = $(this).val();
                                            if (!!vl) {
                                                vl.split('||')[1] == 'true' ?
                                                $('[argumentid="IsDate"]', t.el)[0].checked = true :
                                                $('[argumentid="IsDate"]', t.el)[0].checked = false;
                                                $('[argumentid="Caption"]', t.el).val(vl.split('||')[0].splitCamel());
                                            }
                                            else {
                                                $('[argumentid="IsDate"]', t.el)[0].checked = false;
                                                $('[argumentid="Caption"],[argumentid="FormCode"]', t.el).val('');
                                            }
                                        });
                                        t.on('actionSuccess', function (params) {
                                            var grdQV = AsyncWidgets.get('grdQuickView');
                                            $('[argumentid="ColumnName"] option:selected', t.el).remove();
                                            $('[argumentid="Caption"],[argumentid="FormCode"]', t.el).val('');
                                            grdQV.search({ wg: frmProcGS });
                                            t.hide();

                                        });
                                        t.on('beforeDataAction', function (params) {

                                            Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode'}]));

                                        });
                                    };
                                </script>
                            </Scripts>
                          </uc3:Form>
                          <uc6:DataGrid ID="grdQuickView"  runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px"  SelectableRow="true"  GridTemplate="jQueryUI" GridHeadText="Quick View Fields"
                                PageSize="20" DataSource="ADM_Sel_QuickViewFields" Forms="frmProcessGS" ContainerMargin="3px"
                                GridButtons="{\'delete\':{text:\'Delete\'}}"
                                >
                                 <GridConfig>
                                     <script>
                                         cf = {
                                             cols:
                                                {
                                                    ConfigurationId: { width: '0px' },
                                                    Sequence: { caption: '-' }
                                                }
                                                                    ,
                                             buttons:
                                                {
                                                    DeleteRows:
                                                    {
                                                        Command: 'ADM_Del_QuickViewFields', DeleteKeys: 'ConfigurationId'
                                                    }
                                                },
                                                pager: {
                                                    PageSizeType:'Dropdown'
                                                }
                                         };
                                     </script>
                                 </GridConfig>
                                 <Scripts>
                                    <script>
                                        fn = function () {
                                            t.on({
                                                'onFetchRecords': function () {
                                                    $('.Top .Counters,.Header,.Item,.Bottom,.Actions', t.el).show();
                                                    $('.Top .PWCNoDataMessage', t.el).remove();
                                                }, //onFetchRecords
                                                'onNoRecords': function (args) {
                                                    //  debugger;
                                                    args.flags.queryShowDefTemp = false;
                                                    $('.Top .Counters,.Header,.Item,.Bottom, .Actions', t.el).hide();
                                                    if ($('.Top .PWCNoDataMessage', t.el).length == 0)
                                                        $('.Top .Actions', t.el)
                                                         .after($('&lt;div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.&lt;/div>'));

                                                } //onNoRecords
                                            });

                                            t.on('onItemColGenerated', function (cf) {
                                                if (cf.colId == 'Sequence') {
                                                    var c = cf.itemCol,
                                                    vl = $('.ColValue', c);
                                                    vl.html('&lt;img class="moveup" src="Widgets/resources/images/UpArrow.gif" style="padding-left:3px;padding-right:5px;cursor:pointer" key="{ConfigurationId}" sequence="{Sequence}" />&lt;img class="movedown" src="Widgets/resources/images/DownArrow.gif" style="padding-left:3px;reight:5px;cursor:pointer" key="{ConfigurationId}" sequence="{Sequence}" />');

                                                    $('.moveup,.movedown', t.el).live('click', function () {
                                                        //debugger;
                                                        // debugger;
                                                        $('.RowHighlighted', t.el).css('background-color', '').removeClass('RowHighlighted');

                                                        var action, key1, key2, e$ = $(this), et$ = e$.closest('table[itemno]'), nt = et$.next('table[itemno]'), pr = et$.prev('table[itemno]');

                                                        et$.addClass('RowHighlighted').css('background-color', '#FAE4E2')
                                                        key1 = e$.attr('key');
                                                        seq1 = e$.attr('sequence');

                                                        if (e$.hasClass('moveup')) {
                                                            //   debugger;
                                                            if (!pr.length) return;
                                                            //  pr.hide('slow', function () { pr.show('slow'); });
                                                            key2 = $('img.moveup', pr).attr('key');
                                                            et$.insertBefore(pr);
                                                            action = 'up';
                                                            if (et$.hasClass('PWCEvenRow')) {
                                                                pr.removeClass('PWCOddRow').addClass('PWCEvenRow');
                                                                et$.removeClass('PWCEvenRow').addClass('PWCOddRow');
                                                            }
                                                            else {
                                                                pr.removeClass('PWCEvenRow').addClass('PWCOddRow');
                                                                et$.removeClass('PWCOddRow').addClass('PWCEvenRow');
                                                            }
                                                        }
                                                        else {
                                                            //  debugger;
                                                            if (!nt.length) return;
                                                            key2 = $('img.moveup', nt).attr('key');

                                                            // nt.slideUp('normal', function () { nt.slidDown('narmal'); });
                                                            et$.insertAfter(nt);
                                                            action = 'down';
                                                            if (et$.hasClass('PWCEvenRow')) {
                                                                nt.removeClass('PWCOddRow').addClass('PWCEvenRow');
                                                                et$.removeClass('PWCEvenRow').addClass('PWCOddRow');
                                                            }
                                                            else {
                                                                nt.removeClass('PWCEvenRow').addClass('PWCOddRow');
                                                                et$.removeClass('PWCOddRow').addClass('PWCEvenRow');
                                                            }
                                                        }



                                                        if (!t.__hightlighted) t.__hightlighted = new Ext.util.DelayedTask(function () {

                                                            et$.css('background-color', '').removeClass('RowHighlighted');
                                                        });
                                                        t.__hightlighted.delay(3000);

                                                        var inv = new AsyncWidgets.RAInvoker();
                                                        inv.on('onSuccess', function (res) {
                                                            var res = decJSON(res);
                                                            if (res.status == 'OK') {
                                                                params = res.Response.split('||');

                                                            }
                                                        });
                                                        //debugger;
                                                        //var PGS = AsyncWidgets.get('frmProcessGS');
                                                        //$('[argumentid="DataProfileId"]', PGS.el).val(); ProfileId: $('[argumentid="DataProfileId"]', PGS.el).val(),

                                                        var ServiceInfo = getForm(null, null, {
                                                            key1: key1, key2: key2, Command: 'ADM_Add_SwapQViewOrder'
                                                        });
                                                        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo",
                                                             ServiceInfo]
                                                        });

                                                    }); //end of .moveup,movedown.click
                                                }
                                            }); //on item col generated;

                                            t.on('onActionClicked', function (cf) {
                                                var frmQV = AsyncWidgets.get('frmAddQuickView');
                                                if (cf.Action == "ShowGridForm") {
                                                    cf.cancel = true;
                                                    frmQV.show();
                                                }

                                            }); //onActionClicked

                                        }
                                    </script>
                                 </Scripts>
                            </uc6:DataGrid>
                        </div>
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conDocumentLibrary" Hidden="true" Caption="&nbsp;Document" runat="server">
                    <Childern>
                        <div style="padding:0px;padding-top:10px" class="PWCLabel">
                            <uc3:Form ID="frmDocumentLib"  Hidden="true" runat="server" DataSource=""  AsyncForm="forms/Process/frmDocumentLib.ascx"  >
                            <Scripts>
                                <script>
                                    var fn;
                                    var frmPGS = AsyncWidgets.get('frmProcessGS');
                                    fn = function () {

                                        t.on('beforeDataAction', function (params) {
                                            var DataProfileId = frmPGS.GetArgVal('DataProfileId');
                                            Ext.apply(params, { DataProfileId: DataProfileId });
                                        });
                                        t.on('afterDataAction', function (params) {
                                            if (params.cf.Command == 'ADM_Del_DocLibConfig') {
                                                t.setParams({ reset: true });
                                                AsyncWidgets.get('grdSPDocTypes').hide();
                                            }
                                            else {
                                                AsyncWidgets.get('grdSPDocTypes').search();
                                            }
                                        });
                                        t.on('onLoadingValues', function (params) {
                                            
                                            var DTypes = AsyncWidgets.get('grdSPDocTypes');
                                            var r = params.res;
                                            if (r.status == "OK") {
                                                if (r.Response.Rows.length > 0) {
                                                    $('.DeleteDocLib', t.el)[0].disabled = false;

                                                    DTypes.search({ wg: frmPGS });
                                                    return;
                                                }
                                            }
                                            DTypes.hide();
                                            $('.DeleteDocLib', t.el)[0].disabled = true;
                                        });
                                    };
                                </script>
                            </Scripts>
                          </uc3:Form>
                             <uc6:DataGrid ID="grdSPDocTypes" Forms="frmDocumentLib" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" AutoSearch="none" 
                                PageSize="20" DataSource="ADM_Sel_AdmSPDocType" ContainerMargin="5px" GridTemplate="jQueryUI" GridHeadText="Document Types" >
                                <GridConfig>
                                <script>
                                    cf = {
                                        cols: {


                                    },
                                    buttons:
                                        {
                                            DeleteRows:
                                            {
                                                Command: 'ADM_Del_AdmSPDocType',
                                                DeleteKeys: 'DocType'
                                            }
                                        }
                                }
                                     </script>
                                </GridConfig>
                                <GridForms>
                                    <uc3:Form ID="frmNewDocLibType" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/Process/frmNewDocLibType.ascx">
                                        <Scripts>
                                            <script>
                                                fn = function (cf) {
                                                    var frmProcGS = AsyncWidgets.get('frmProcessGS'),
                                                       grd = AsyncWidgets.get('grdSPDocTypes');
                                                    t.on('actionSuccess', function (params) {
                                                        $('.CloseForm', t.el).trigger('click');
                                                        grd.search({ wg: frmProcGS, reset: true });
                                                    });
                                                    t.on('beforeDataAction', function (params) {
                                                        Ext.apply(params, { DataProfileId: frmProcGS.GetArgVal('DataProfileId') });
                                                    });
                                                }
                                            </script>
                                        </Scripts>
                                    </uc3:Form>
                                    <%--<uc3:Form ID="Form1" Hidden="true" AutoInstance="false" runat="server" AsyncForm="forms/frmNewOrg.ascx" />--%>
                                </GridForms>
                                <Scripts>
                                    <script>
                                        var fn = function () {
                                            var frmPGS = AsyncWidgets.get('frmProcessGS');
                                            /////////////////////////////////////////////////////////////////////////
                                            t.on('beforeRowDelete', function (args) {
                                                args.cf["DataProfileId"] = frmPGS.GetArgVal('DataProfileId');

                                            }); //beforeRowDelete
                                            t.on({
                                                'onFetchRecords': function () {
                                                    $('.Top .Counters,.Header,.Item,.Bottom', t.el).show();
                                                    $('.Top .PWCNoDataMessage', t.el).remove();
                                                }, //onFetchRecords
                                                'onNoRecords': function (args) {
                                                    args.flags.queryShowDefTemp = false;
                                                    $('.Top .Counters,.Header,.Item,.Bottom', t.el).hide();
                                                    if ($('.Top .PWCNoDataMessage', t.el).length == 0)
                                                        $('.Top .Actions', t.el)
                                                         .after($('&lt;div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No document types added.&lt;/div>'));

                                                } //onNoRecords
                                            });

                                        }
                                    </script>
                                </Scripts>
                            </uc6:DataGrid>       

                        </div>
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conRolesTab" Hidden="true" Caption="&nbsp;Roles" runat="server">
                    <Childern>
                            <table cellpadding="0" cellspacing="0" border="0" >
                            <tr>
                                <td style="width:175px" valign="top">
                                    <uc3:Form ID="frmAddEditAssignRoles" Hidden="true" style="height:400px" runat="server"  AsyncForm="forms/Process/frmAddEditAssignRoles.ascx"  >
                            <Scripts>
                                <script>
                                    var fn;
                                    fn = function () {
                                        var frmPGS = AsyncWidgets.get('frmAddEditAssignRoles');
                                        t.on('beforeDataAction', function (params) {
                                            var name = t.GetArgVal('RoleToAdd'),
                                                FCode = frmPGS.GetArgVal('FormNameCode'),
                                                RoleId = FCode + "_" + name.replace(/ /g, '_');
                                            Ext.apply(params, {RoleId:RoleId});
                                        });

                                        $('[argumentid="RoleId"]', t.el).change(function () {
                                            $('.search', t.el).trigger('click');
                                        });
                                    };
                                </script>
                            </Scripts>
                          </uc3:Form>
                                </td>
                                <td style="vertical-align:top;padding-top:10px">
                            
                              <uc6:DataGrid ID="grdProcGenralRoles" Forms="frmAddEditAssignRoles" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" AutoSearch="none" 
                                PageSize="20" DataSource="ADM_Sel_UserByOrgAndRoles" ContainerMargin="5px"  SingleRowSelect="true"
                                GridTemplate="jQueryUI" GridButtons="{\'delete\':{text:\'\'},\'new\':{text:\'\'}}"
                                GridHeadText="Assigned Users">
                                <GridConfig>
                                <script>
                                    cf = {
                                        cols: {
                                            Name: { caption: 'Employee Name', width: '150px' },
                                            UsersId: { width: '0px' },
                                            PersonalId: { width: '0px' },
                                            OrganizationId: { width: '0px' }
                                        },
                                        buttons:
                                        {
                                            DeleteRows:
                                            {
                                                Command: 'ADM_Del_EmployeeUserRole',
                                                DeleteKeys: 'UsersId'
                                            }
                                        },
                                        pager: {
                                            PageSizeType: 'Dropdown'
                                        }
                                    }
                                     </script>
                                </GridConfig>
                                <Scripts>
                                    <script>
                                        var fn = function () {
                                            var frmAEA = AsyncWidgets.get('frmAddEditAssignRoles');
                                            /////////////////////////////////////////////////////////////////////////
                                            t.on('onActionClicked', function (cf) {

                                                if (cf.Action == "ShowGridForm") {
                                                    $(".Actions").show();
                                                    cf.cancel = true;
                                                }
                                                else if (cf.Action == 'HideTop') {
                                                    $(".Actions").hide();
                                                    cf.cancel = true;
                                                }

                                            });
                                            t.on('beforeRowDelete', function (args) {

                                                var roleid = frmAEA.GetArgVal('RoleId'); //$('select[argumentid="RoleId"]', AsyncWidgets.get("frmSearchProcessManagment").el)[0];
                                                args.cf["RoleId"] = frmAEA.GetArgVal('RoleId');
                                            }); //beforeRowDelete
                                            /////////////////////////////////////////////////////////////////////////////
                                            t.on('TemplateLoaded', function () {
                                                $('.Actions .AssignRole', t.el)[0].disabled = true;
                                                $('.Actions [argumentid="UserName"]', t.el).live('blur', function () {
                                                    fnd = function () {

                                                        if ($.trim(this.value) == "" || $('.Actions [argumentid="UsersId"]', t.el).val() == "") {
                                                            $('.Actions .AssignRole', t.el)[0].disabled = true;
                                                        }
                                                        else {
                                                            $('.Actions .AssignRole', t.el)[0].disabled = false;
                                                        }
                                                    };
                                                    (fnd).defer(250, this);

                                                });
                                                if (!!$('.Actions .AutoComplete', t.el).length) {
                                                    fnCB = function () {
                                                       
                                                        $('.Actions .AutoComplete', t.el).each(function () {
                                                            function formatItem(row, i, total) {
                                                                //                       var res= row[0] + " (<strong>id: " + row[1] + "</strong>)";
                                                                //                       return res;

                                                                var FormattedRow = "";
                                                                for (var iLoop = 0; iLoop < row.length; iLoop++) {
                                                                    FormattedRow += (typeof row[iLoop] == 'undefined' ? " " : row[iLoop]) + (iLoop == (row.length - 1) ? "" : " &nbsp;, ");
                                                                }
                                                                return FormattedRow;
                                                            }
                                                            //MatchContains, cf.Multiple , cf.MatchSubset,cf.MinChar ,cf.Width,cf.Max,cf.Delay
                                                            var cf = decJSON(this.getAttribute('conf'));
                                                            cf.ACParams = cf.ACParams || {};
                                                            $(this).autocomplete('WebServices/RemoteActions.asmx/DoAction', Ext.apply({
                                                                multiple: false,
                                                                matchContains: true,
                                                                matchSubset: false,
                                                                mustMatch: true,
                                                                autoFill: false,
                                                                width: 0,
                                                                max: 100,
                                                                minChars: 3,
                                                                delay: 100,
                                                                formatItem: formatItem,
                                                                cellSeparator: '||',
                                                                onItemSelect: function (data) {
                                                                    // debugger;
                                                                    //t.fireEvent('AutocompleteResult', { elem: $(this), data: data });
                                                                    $('.Actions [argumentid="UsersId"]').val(data[1]);
                                                                },
                                                                formatRequestData: function (p) {
                                                                    var SrvInf, rdata = p.rdata;
                                                                    rdata.QueryId = cf.QueryId || 'default';
                                                                    rdata.StoreId = cf.StoreId;
                                                                    SrvInf = getForm(t.el, null, rdata, cf.ParamFields, true);
                                                                    t.fireEvent('getExtraParams', this, SrvInf);
                                                                    $.extend(p.form, { ActorId: cf.ActorId, ActionId: cf.ActionId, ServiceInfo: SrvInf });
                                                                    p.rdata = rdata = encJSON(p.form);
                                                                }
                                                            }, cf.ACParams));
                                                            //return false;
                                                        });
                                                    }
                                                    AsyncWidgets.loadCSS('jquery.autocomplete', 'AutoComplete');
                                                    AsyncWidgets.loadJS('jquery.autocomplete', 'AutoComplete', fnCB);
                                                }
                                            }); //TemplateLoaded

                                            $('.Actions .AssignRole', t.el).live('click', function () {

                                                var inv = new AsyncWidgets.RAInvoker();
                                                inv.on('onSuccess', function (res) {
                                                    t.$el.unmask();
                                                    var res = decJSON(res);

                                                    if (res.status == 'OK') {
                                                        params = res.Response.split('||');
                                                        if (!!t.searchCF) {
                                                            if (t.searchCF.wg)
                                                                t.search({ reset: false, wg: t.searchCF.wg });
                                                            else t.search({ reset: false });
                                                        }
                                                        else
                                                            t.search({ reset: false });

                                                        $('[argumentid="UsersId"],[argumentid="UserName"]', t.el).val('');
                                                        $('.AssignRole', t.el)[0].disabled = true;
                                                        $.showMessage(params[2]);
                                                    }
                                                });
                                                inv.on('onFailure', function (res) {
                                                    t.$el.unmask();
                                                });

                                                var ServiceInfo = getForm($('.frmRoleAssign')[0], null, { Command: 'ADM_Ins_RoleToUser', RoleId: $('[argumentid="RoleId"]', frmAEA.el).val() });
                                                t.$el.mask('Please wait while loading ...');
                                                inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo",
                                                ServiceInfo]
                                                });

                                            });


                                        }
                                    </script>
                                </Scripts>
                                <TopTemplate>
                                    <table width="100%" border="0" class="Actions" style="display:none;">
                                        <tbody>
                                            <tr class="rowRoleAssign">
                                                <td class='frmRoleAssign'>
                                                 <span class="PWCLabel">Select User</span>&nbsp;<input id="xws" type="text" class="PWCTextBox AutoComplete" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'Users',ACParams:{multiple:false,width:225}}"
                                                    groupid="AsignUser" argumentid="UserName" style="width:200px" />
                                                    <input  type="text" class="PWCTextBox" groupid="AsignUser" argumentid="UsersId" style="display:none" />
                                                  <input type="button"  class="PWCButton AssignRole"  value=" Assign "  >
                                                   <input type="button"  class="PWCButton ActionButton" conf="{Action:'HideTop'}"  value=" Cancel "  >
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="w-panel-head w-top-corner">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                        <tr>
                                            <td >
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td class="w-head-text">
                                                           
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:100%">&nbsp;</td>
                                            <td>
                                            <span style="" class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon">&nbsp;</span>
                                            </td>
                                        </tr>
                                    </table>
                                   </div>
                                </TopTemplate>
                            </uc6:DataGrid>      
                                                     
                                </td>
                            </tr>
                            </table>
                       
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conSubmissionService" Hidden="true" Caption="&nbsp;Submission" runat="server">
                    <Childern>
                
                        <table cellpadding="0" cellspacing="0" border="0" style="">
                            <tr>
                                <td style="width: 175px;padding-top:17px;padding-left:7px" rowspan="2" valign="top" class="ColLeft">
                                                <select  valtype="val"
                                                    class="PWCListBox SubmitSID" size="5" style="width: 200px; height: 325px">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<option value="" selected="selected">Select Submission</option>
                                                    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select>
                                </td>
                                <td valign="top">
                                   <uc3:Form ID="frmSumission" Hidden="true"  style="height:400px" runat="server" 
                                                                         AsyncForm="forms/Process/frmSubmission.ascx"  >
                                    <Scripts>
                                        <script>
                                            fn = function () {
                                                var conSS = AsyncWidgets.get('conSubmissionService'),
                                                    cbo = $('td.ColLeft .SubmitSID', conSS.el), Conds = "N,I,D,R,DR,Y,";

                                                $('[Name="IsConditional"]', t.el).live('click', function () {
                                                    $('.IsCondOther,.ActorStepId').removeClass('required').hide();

                                                    if (Conds.indexOf(this.value + ',') < 0) {
                                                        $('.IsCondOther').addClass('required').show();
                                                    }
                                                    else if (this.value == 'Y') {
                                                        $('.ActorStepId').addClass('required').show();
                                                    }
                                                    ////                                                    else { 
                                                    ////                                                        
                                                    ////                                                    }

                                                });
                                                cbo.change(function () {
                                                    // debugger;
                                                    var opt = $('option:selected', cbo);
                                                    $('.IsCondOther,.ActorStepId').hide();
                                                    var cond = $.trim(opt.attr('isconditional')) + ',';
                                                    if (Conds.indexOf(cond) < 0) {
                                                        $('[value="Other"]', t.el).attr('checked', 'checked');
                                                        t.SetArgVal('IsConditionalOther', opt.attr('isconditional'));
                                                        $('.IsCondOther').show();
                                                    }
                                                    else if (cond == 'Y,') { // ActorStepId
                                                        t.SetArgVal('ActorStepId', opt.attr('actorstepid'));
                                                        t.SetArgVal('IsConditional', $.trim(opt.attr('isconditional')));
                                                        $('.ActorStepId').show();
                                                    }
                                                    else {
                                                        t.SetArgVal('IsConditional', $.trim(opt.attr('isconditional')));
                                                    }

                                                });

                                                t.on('onComboFilled', function (params) {

                                                    cbo.html(params.combo.html());
                                                });
                                            }
                                        </script>
                                    </Scripts>
                                                                         
                                   </uc3:Form>
                                </td>
                            </tr>
                            <tr>
                                <td  >
                             &nbsp;
                                </td>
                            </tr>
                        </table>
                    
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conRecrodMovement" Hidden="true" Caption="&nbsp;Records" runat="server">
                    <Childern>
                        <div style="padding-left:10px;padding-top:10px" class="PWCLabel">
                        <b class="PWCLabelValue">Record Movement!</b>
                        <br />
                        <br />
                        eForms Administration Module provides you with options to update your basic informations, manage your processes...
                        </div>
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conEmailConfiguration" Hidden="true" Caption="&nbsp;Email" runat="server">
                    <Childern>
                              <uc6:DataGrid ID="grdEmailConfiguration" Forms="frmProcessGS" runat="server" Hidden="true" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="true" AutoSearch="none" 
                                PageSize="20" DataSource="ADM_Sel_EmailConf" ContainerMargin="5px"  SingleRowSelect="true"
                                GridTemplate="jQueryUI" 
                                GridHeadText="Email Configuration">
                                <GridConfig>
                                <script>
                                    cf = {
                                        cols: {
                                            ProfileName: {  width: '0px' },
                                            FormId: { width: '0px' }
   
                                        },
                                        pager: {
                                            PageSizeType: 'Dropdown'
                                        }
                                    }
                                     </script>
                                </GridConfig>
                                <Scripts>
                                    <script>
                                        var fn = function () {
                                          }
                                    </script>
                                </Scripts>
                            </uc6:DataGrid>      
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conRuleEngine" Hidden="true" Caption="&nbsp;Rules" runat="server">
                    <Childern>
                        <div style="padding-left:10px;padding-top:10px" class="PWCLabel">
                        <b class="PWCLabelValue">Rule Engine!</b>
                        <br />
                        <br />
                        eForms Administration Module provides you with options to update your basic informations, manage your processes...
                        </div>
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conMassApprove" Hidden="true" Caption="&nbsp;Mass Approve" runat="server">
                    <Childern>
                        <div style="padding-left:10px;padding-top:10px" class="PWCLabel">
                        <b class="PWCLabelValue">Global Mass Approve!</b>
                        <br />
                        <br />
                        eForms Administration Module provides you with options to update your basic informations, manage your processes...
                        </div>
                    </Childern>
                </uc5:Container>
                <uc5:Container ID="conEmployeeLogin1" Hidden="true" Caption="Organization Setup" runat="server">
                    <Childern>
                    <div style="background-color:White;width:75%;height:100%;float:left;">
                        
                          <uc3:Form ID="frmEmployeeInfo" Hidden="true" runat="server"  DataSource="EPG_Sel_EmployeeInfo" AsyncForm="~/AsyncWidgets/forms/EPG/EmployeeInfo.ascx" >
                          <Scripts>
                              <script>
                                  fn = function () {
                                      var cDate = function (date) {
                                          var dttmAr = date.split(' '), dt, tm, nDate;
                                          dt = dttmAr[0].split('/');
                                          if (dttmAr.length > 1) {
                                              tm = dttmAr[1].split(':');
                                              return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
                                          }
                                          return new Date(dt[2], dt[1] - 1, dt[0]);
                                      };
                                      var dateDiff = function (d1, d2) {
                                          return (d1 - d2) / (3600000 * 24);
                                      };
                                      $('.SimpleTab li', t.el).click(function () {
                                          if (!t.EmpInfo) return false;
                                          var li = $(this), tbl;
                                          li.parent().children('li.active').removeClass('active');
                                          li.addClass('active');
                                          tbl = li.closest('table').parent().closest('table').children();
                                          tbl.children('tr:not(:first)').hide();
                                          tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
                                          $('.tabid', t.el).val(li.attr('tabid'));
                                          if ($('.EditProfile', t.el).html() == "Save") $('.Cancel', t.el).trigger('click');
                                          if ('ContactInformationBasicInfomation'.indexOf($('.tabid', t.el).val()) < 0) {
                                              $('.EditProfile', t.el).hide();
                                          }
                                          else $('.EditProfile', t.el).show();

                                          return false;
                                      });

                                      t.on('onLoad', function () {
                                          $(t.el).mask('Please wait while loading ...');
                                          if (!t.LookupsLoaded) {

                                              t.LoadCombo(t, $('select[argumentid="Nationality"]', t.el), undefined, { params: { Description: 'Nationality'} });
                                              t.LoadCombo(t, $('select[argumentid="Gender"]', t.el), undefined, { params: { Description: 'Gender'} });
                                              t.LoadCombo(t, $('select[argumentid="Religion"]', t.el), undefined, { params: { Description: 'Religion'} });
                                              //                                                  t.LoadCombo(t, $('select[argumentid="Nationality"]', t.el), undefined, { params: { Description: 'Nationality'} });
                                              //                                                  t.LoadCombo(t, $('select[argumentid="Nationality"]', t.el), undefined, { params: { Description: 'Nationality'} });
                                              t.LookupsLoaded = true;
                                              (function (t) {


                                                  if ($('select[CCLoading="Loading"]', t.el).length < 1) {

                                                      t.loadValues({ Command: 'EPG_Sel_EmployeeInfo' });
                                                      $(t.el).unmask('Please wait while loading ...');
                                                  }
                                                  else {
                                                      arguments.callee.defer(500, t, [t]);
                                                  }
                                              }).defer(500, t, [t]);
                                          }
                                          else {
                                              t.loadValues({ Command: 'EPG_Sel_EmployeeInfo' });
                                              $(t.el).unmask('Please wait while loading ...');
                                          };



                                      });
                                      t.on('onLoadedValues', function (args) {
                                          var res = args.res;

                                          if (res.status == 'OK') {
                                              t.EmpInfo = true;
                                              if (res.Response.Rows.length < 1) {
                                                  $('.EMPInfoNotFound', t.el).show().siblings().hide();
                                                  $('.Cancel,.EditProfile', t.el).hide();
                                                  t.EmpInfo = false;
                                              }
                                              else {

                                                  var expDate = t.GetArgVal("PassportExpiryDate");
                                                  if ($.trim(expDate) != '') {
                                                      if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                                          $('span[argumentid="PassportExpiryDate"]', t.el).css('color', 'red');
                                                      }
                                                  }
                                                  expDate = t.GetArgVal("ResidencyExpiryDate");
                                                  if ($.trim(expDate) != '') {
                                                      if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                                          $('span[argumentid="ResidencyExpiryDate"]', t.el).css('color', 'red');
                                                      }
                                                  }
                                              }
                                          }
                                      });

                                      $('.Cancel', t.el).click(function () {
                                          $('.EditProfile', t.el).html('Edit Profile');
                                          $('.Cancel', t.el).hide();
                                          $('span[errmsg]', t.el).hide();
                                          $('[argumentid="StreetAddress"],[argumentid="MailingAddress"],[argumentid="OtherNumber"],[argumentid="MobileNumber"],[argumentid="LandlineNumber"],[argumentid="EmailId"],[argumentid="PassportExpiryDate"],[argumentid="PassportNo"],[argumentid="Nationality"],[argumentid="Gender"],[argumentid="DateOfBirth"],[argumentid="Religion"]', t.el).hide();
                                          $('span[argumentid="StreetAddress"],span[argumentid="MailingAddress"],span[argumentid="OtherNumber"],span[argumentid="MobileNumber"],span[argumentid="LandlineNumber"],span[argumentid="EmailId"],span[argumentid="PassportExpiryDate"],span[argumentid="PassportNo"],span[argumentid="PassportNo"],span[argumentid="Nationality"],span[argumentid="Gender"],span[argumentid="DateOfBirth"],span[argumentid="Religion"]', t.el).show();
                                          return false;
                                      });
                                      $('.EditProfile', t.el).click(function () {
                                          if ($(this).html() != "Save") {
                                              $(this).html('Save');
                                              $('.Cancel', t.el).show();
                                              //                                              $('[argumentid="Gender"],[argumentid="DateOfBirth"],[argumentid="Religion"]', t.el).show();
                                              //                                              $('span[argumentid="Gender"],span[argumentid="DateOfBirth"],span[argumentid="Religion"]', t.el).hide();
                                              $('[argumentid="StreetAddress"],[argumentid="MailingAddress"],[argumentid="OtherNumber"],[argumentid="MobileNumber"],[argumentid="LandlineNumber"],[argumentid="EmailId"],[argumentid="PassportExpiryDate"],[argumentid="PassportNo"],[argumentid="Nationality"],[argumentid="Gender"],[argumentid="DateOfBirth"],[argumentid="Religion"]', t.el).show();
                                              $('span[argumentid="StreetAddress"],span[argumentid="MailingAddress"],span[argumentid="OtherNumber"],span[argumentid="MobileNumber"],span[argumentid="LandlineNumber"],span[argumentid="EmailId"],span[argumentid="PassportExpiryDate"],span[argumentid="PassportNo"],span[argumentid="PassportNo"],span[argumentid="Nationality"],span[argumentid="Gender"],span[argumentid="DateOfBirth"],span[argumentid="Religion"]', t.el).hide();


                                          }
                                          else { //save the form
                                              if (!t.validator.isValid()) {
                                                  return;
                                              }
                                              $(this).html('Edit Profile');
                                              $('.btnUpdateForm', t.el).trigger('click');
                                              $('.Cancel', t.el).hide();
                                              //                                              $('[argumentid="Gender"],[argumentid="DateOfBirth"],[argumentid="Religion"]', t.el).hide();
                                              //                                              $('span[argumentid="Gender"],span[argumentid="DateOfBirth"],span[argumentid="Religion"]', t.el).show();
                                              $('[argumentid="StreetAddress"],[argumentid="MailingAddress"],[argumentid="OtherNumber"],[argumentid="MobileNumber"],[argumentid="LandlineNumber"],[argumentid="EmailId"],[argumentid="PassportExpiryDate"],[argumentid="PassportNo"],[argumentid="Nationality"],[argumentid="Gender"],[argumentid="DateOfBirth"],[argumentid="Religion"]', t.el).hide();
                                              $('span[argumentid="StreetAddress"],span[argumentid="MailingAddress"],span[argumentid="OtherNumber"],span[argumentid="MobileNumber"],span[argumentid="LandlineNumber"],span[argumentid="EmailId"],span[argumentid="PassportExpiryDate"],span[argumentid="PassportNo"],span[argumentid="PassportNo"],span[argumentid="Nationality"],span[argumentid="Gender"],span[argumentid="DateOfBirth"],span[argumentid="Religion"]', t.el).show();
                                              t.loadValues({ Command: 'EPG_Sel_EmployeeInfo' });
                                          }
                                          return false;
                                      });
                                  }
                              </script>
                          </Scripts>
                          </uc3:Form>
                         </div>
                    <div style="background-color:White;float:left;width:25%;height:100%;padding-top:5px;">
                        <uc6:DataGrid ID="grdStuAtt" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                            AllowNew="true" SelectableRow="false" AutoSearch="OnLoad" PageSize="20" DataSource="RPT_AttendenceReport"
                            ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Attendance" ColLeftMargin="3">
                            <gridconfig>
                                <script>
                                    cf = {
                                        cols: {

                                            UserId: { width: '0px' },
                                            Sequence:{width:'0px'}
                                        },
                                        pager: {
                                            PageSizeType: 'Dropdown'
                                        }
                                    }
                                     </script>
                                </gridconfig>
                            <scripts>
                                    <script>
                                        var fn = function () {

                                        }
                                    </script>
                            </scripts>
                            <repeatertemplate>
                                    <div class="GridContainer">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; text-align: left">
                                            <tbody>
                                                <tr class="TopTR">
                                                    <td class="Top">
                                                    </td>
                                                </tr>
                                                <tr class="HeaderTR">
                                                    <td class="Header w-grid-border">
                                                    </td>
                                                </tr>
                                                <tr class="ItemTR">
                                                    <td class="Item w-grid-border">
                                                    </td>
                                                </tr>
                                                <tr class="NoRecordsTR" style="display: none;">
                                                    <td class="NoRecords" style="border: 1px solid #F1C483">
                                                    </td>
                                                </tr>
                                                <tr class="BottomTR" style="display:none;">
                                                    <td class="Bottom">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </repeatertemplate>
                        </uc6:DataGrid>
                    </div>
                    </Childern>
                </uc5:Container>
                   <uc5:Container ID="conEmployeeLogin" Hidden="true" Caption="Organization Setup" runat="server">
                    <Childern>
                         <uc6:DataGrid ID="grdStudentInvoice" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                            AllowNew="true" SelectableRow="true" AutoSearch="OnLoad" PageSize="20" DataSource="EPG_SEL_StudentInvoice"
                            ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Student Invoice" ColLeftMargin="3"
                            GridButtons="{\'delete\':{conf:{Action:\'DeleteRows\',Command:\'EPG_Del_StudentInvoice\',KeysCol:\'FormId\'}}}"
                            style="width:99%"
                            >
                            <gridconfig>
                                <script>
                                    cf = {
                                        cols: {

                                            FormId: { width: '0px' },
                                            ParentFormId: { width: '0px' },
                                            PaymentMethod: { width: '0px' },
                                            PaymentType: { width: '0px' }
                                        },
                                        pager: {
                                            PageSizeType: 'Dropdown'
                                        }
                                    }
                                     </script>
                                </gridconfig>
                            <scripts>
                                    <script>
                                        var fn = function () {
                                            t.on('beforeSearchGetForm', function (p) {
                                             //   debugger;
                                                Ext.apply(p, { ParentFormId: $('.StudentFormId').val() });
                                            });
                                        }
                                    </script>
                            </scripts>
                            <GridForms>
                                 <uc3:Form ID="frmNewStudentInvoice" Hidden="true" AutoInstance="false" runat="server" AsyncForm="~/AsyncWidgets/forms/EPG/frmNewStudentInvoice.ascx">
                                        <Scripts>
                                            <script>
                                                fn = function (cf) {
                                                    t.on('actionSuccess', function (params) {
                                                        $('.CloseForm', t.el).trigger('click');
                                                        t.parent.search({ reset: true });
                                                    });
                                                    t.on('beforeDataAction', function (p) {
                                                       
                                                        Ext.apply(p, { ParentFormId: $('.StudentFormId').val() });

                                                    });
                                                }
                                            </script>
                                        </Scripts>
                                    </uc3:Form>
                            </GridForms>
                             <RowEditForm>
                                    <uc3:Form ID="frmUpdateStudentInvoice" Hidden="true" AutoInstance="false" RelativeKeys="FormId"
                                        runat="server" DataSource="ADM_GetAllOrganizations" AsyncForm="~/AsyncWidgets/forms/EPG/frmUpdateStudentInvoice.ascx" />

                             </RowEditForm>
                        </uc6:DataGrid>
                    </Childern>
                    </uc5:Container>

                 <uc5:Container ID="conCommonLOV" Hidden="true" Caption="Common LOV" runat="server">
                    <Childern>
                         <uc6:DataGrid ID="grdParentLOV" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                            AllowNew="true" SelectableRow="true" AutoSearch="OnLoad" PageSize="20" DataSource="ADM_SEL_Common_LOV_Parent"
                            ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Common LOV Parent" ColLeftMargin="3"
                            GridButtons="{\'delete\':{conf:{Action:\'DeleteRows\',Command:\'EPG_Del_StudentInvoice\',KeysCol:\'FormId\'}}}"
                            style="width:99%"
                            >
 
                            <%--<gridconfig>
                                <script>
                                    cf = {
                                        cols: {

                                            FormId: { width: '0px' },
                                            ParentFormId: { width: '0px' },
                                            PaymentMethod: { width: '0px' },
                                            PaymentType: { width: '0px' }
                                        },
                                        pager: {
                                            PageSizeType: 'Dropdown'
                                        }
                                    }
                                     </script>
                                </gridconfig>--%>
                            <%--<scripts>
                                    <script>
                                        var fn = function () {
                                            t.on('beforeSearchGetForm', function (p) {
                                                //   debugger;
                                                Ext.apply(p, { ParentFormId: $('.StudentFormId').val() });
                                            });
                                        }
                                    </script>
                            </scripts>--%>
                            <%--<GridForms>
                                 <uc3:Form ID="frmNewStudentInvoice" Hidden="true" AutoInstance="false" runat="server" AsyncForm="~/AsyncWidgets/forms/EPG/frmNewStudentInvoice.ascx">
                                        <Scripts>
                                            <script>
                                                fn = function (cf) {
                                                    t.on('actionSuccess', function (params) {
                                                        $('.CloseForm', t.el).trigger('click');
                                                        t.parent.search({ reset: true });
                                                    });
                                                    t.on('beforeDataAction', function (p) {

                                                        Ext.apply(p, { ParentFormId: $('.StudentFormId').val() });

                                                    });
                                                }
                                            </script>
                                        </Scripts>
                                    </uc3:Form>
                            </GridForms>--%>
                             <%--<RowEditForm>
                                    <uc3:Form ID="frmUpdateStudentInvoice" Hidden="true" AutoInstance="false" RelativeKeys="FormId"
                                        runat="server" DataSource="ADM_GetAllOrganizations" AsyncForm="~/AsyncWidgets/forms/EPG/frmUpdateStudentInvoice.ascx" />

                             </RowEditForm>--%>
                             <RowDetail>
                                   <pre class="" colindex="2" icon="./widgets/resources/images/ChildGrid.png">
                                     <uc5:Container ID="conLOVChild" Hidden="true" runat="server">
                                         <Childern>
                                             <div style="padding: 30px">
                             <uc6:DataGrid ID="DataGrid1" runat="server" Hidden="true" Columns="1" EmptyHeight="201px"
                            AllowNew="false" SelectableRow="true" AutoSearch="OnVisible" PageSize="20" DataSource="ADM_SEL_Common_LOV_Child"
                            ContainerMargin="0px" GridTemplate="jQueryUI" GridHeadText="Common LOV Child" ColLeftMargin="3"
                            RelativeKeys="TypeId"
                            style="width:99%"
                            >

                            </uc6:DataGrid>
                                             </div></Childern></uc5:Container>
                                   </pre>
                             </RowDetail>
                        </uc6:DataGrid>
                    </Childern>
                    </uc5:Container>
            </td>
        </tr>
    </table>
</asp:Content>

