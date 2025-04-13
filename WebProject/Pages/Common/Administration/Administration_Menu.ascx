<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administration_Menu.ascx.cs" Inherits="WebProject.Pages.Common.Administration.Administration_Menu" %>


    <!-- Toggle Button -->
<%--    <button type="button" class="toggle-btn" onclick="toggleSidebar()">Menu</button>--%>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="site-page-menu">
<%--                 <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>      </div>--%>
            <!-- User Administration -->
            <div class="menu-section border-user-admin">
                <span class="menu-title">User Administration</span>
                <ul class="menu-list">
                    <li>
                        <a class="menu-link bold" href="javascript:void(0);" showwidget="{widgetId:'frmMyProfile',parentId:'conAdministration_Controls'}">My Profile</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdProxyUsers',parentId:'conAdministration_Controls'}">Proxy Access</a>
                    </li>
                </ul>
            </div>

            <!-- System Administration -->
            <div class="menu-section border-system-admin">
                <span class="menu-title">System Administration</span>
                <ul class="menu-list">
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}" >Organization Setup</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdUserManagement',parentId:'conAdministration_Controls'}">User Management</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdSimpleMenu',parentId:'conAdministration_Controls'}">Menu Configuration</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}">Role Management</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdListofValues',parentId:'conAdministration_Controls'}">List of Values</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdKPI',parentId:'conAdministration_Controls'}">KPI Setup</a>
                    </li>
                </ul>
            </div>

            <!-- Process Administration -->
            <div class="menu-section border-process-admin">
                <span class="menu-title red">Process Administration</span>
                <ul class="menu-list">
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}">Process / Module Details</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}">Record Management</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}">Import / Export (XML)</a>
                    </li>
                    <li>
                        <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}">Setup Wizard</a>
                    </li>
                </ul>
            </div>

            <!-- iDashboard -->
            <div class="menu-section border-idashboard">
                <a class="menu-link bold red" href="javascript:void(0);" showwidget="Logout1">iDashboard</a>
            </div>
        </div>
    </div>

    <!-- Main Content (Placeholder) -->


    <script>
        // Toggle Sidebar
        //function toggleSidebar() {
        //    debugger
        //    const sidebar = document.getElementsByClassName('sidebar');
        //    sidebar.classList.toggle('active');
        //}

        function toggleSidebar() {
            
            var sidebar = $('.sidebar'); // Select sidebar using jQuery
            sidebar.toggleClass('active'); // Toggle 'active' class
        }
        AsyncWidgets.WidgetManager.bind($('#menuContainer [showwidget]'));

        //// Widget Click Handler (Placeholder)
        //document.querySelectorAll('.menu-link[showwidget]').forEach(link => {
        //    link.addEventListener('click', function () {
        //        const widgetData = this.getAttribute('showwidget');
        //        console.log('Widget triggered:', widgetData);
        //        // Replace with actual widget handling logic, e.g., showwidget function
        //    });
        //});
    </script>

   

<%-- <table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 5px;
        padding-right: 5px; padding-bottom: 0px; padding-top: 0px;">
            <tr> <td>
            
            <table cellspacing="0" cellpadding="0" border="0" style="background-image: url(App_Themes/eForms_Theme/Images/i/inbg.gif)">
    <tbody>
        <tr>
            <td style="padding-top:5px">
        
              <div id="SitePageMenu" class="SitePageMenu" style="margin-top: 10px;">


                                                     <span id="Span1" class="SitePageMenuLinkBorder" href="javascript:void(0);" style="border-color:rgb(139, 177, 222); ; height:auto;" >
                                        <b class="SitePageMenuLabel" style="color: #0F99CA; display: block; font-size: 10px;">USER ADMINISTRATION</b>
                                        <ul type="disc">  
                                        <li> <a style="color: #0F99CA" class="SitePageMenuLink" showwidget="{widgetId:'frmMyProfile',parentId:'conAdministration_Controls'}" href="javascript:void(0);"><b>MY PROFILE</b></a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdProxyUsers',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Proxy Access</a></li>
                                        </ul>
                                        </span> 
                                        
                                        <span id="iRental" class="SitePageMenuLinkBorder" href="javascript:void(0);" style="border-color:#ff004e; height:auto;" >
                                        <b class="SitePageMenuLabel" style="color: #0F99CA; display: block; font-size: 10px;">SYSTEM ADMINISTRATION</b>
                                        <ul type="disc">  
                                        <li> <a class="SitePageMenuLink" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Organization Setup</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdUserManagement',parentId:'conAdministration_Controls'}" href="javascript:void(0);">User Management</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdSimpleMenu',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Menu Configuration</a></li>

                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Role Management</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdListofValues',parentId:'conAdministration_Controls'}" href="javascript:void(0);">List of Values</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdKPI',parentId:'conAdministration_Controls'}" href="javascript:void(0);">KPI Setup</a></li>
                                        </ul>
                                        </span> 

                                           <span id="Span2" class="SitePageMenuLinkBorder" href="javascript:void(0);" style="border-color:rgb(126, 212, 211); height:auto;" >
                                        <b class="SitePageMenuLabel" style="color: Red; display: block; font-size: 10px;">PROCESS ADMINISTRATION</b>
                                        <ul type="disc">  
                                        <li> <a class="SitePageMenuLink" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Process / Module Details</a></li>
                                        
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Record Management</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Import / Export (XML)</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Setup Wizard</a></li>
                                        </ul>
                                        </span>                                
                               
                                                                       <a class="SitePageMenuLinkBorder SitePageMenuLink" href="javascript:void(0);"
                                            style="border-color: rgb(126, 212, 211); cursor: hand" showwidget="Logout1"><b style="color:Red">iDASHBOARD</b><label id="Label1" runat="server"></label></a>
                                </div>
            </td>
        
        </tr>
        <tr>
            <td>
                <img height="32" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
            </td>
        </tr>
    </tbody>
</table>
            </td>
            </tr>
    </table>--%>