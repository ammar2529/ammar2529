<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administration_Menu.ascx.cs" Inherits="WebProject.Pages.Common.Administration.Administration_Menu" %>

<!-- Font Awesome CDN -->

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="site-page-menu">
        <!-- Toggle Button Section -->
        <div class="menu-section toggle-section">
            <button type="button" class="toggle-btn" onclick="toggleSidebar()">☰</button>
        </div>

        <!-- User Administration -->
        <div class="menu-section border-user-admin" onclick="toggleSubmenu(this)">
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
        <div class="menu-section border-system-admin" onclick="toggleSubmenu(this)">
            <span class="menu-title">System Administration</span>
            <ul class="menu-list">
                <li>
                    <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}">Organization Setup</a>
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
        <div class="menu-section border-process-admin" onclick="toggleSubmenu(this)">
            <span class="menu-title red">Process Administration</span>
            <ul class="menu-list">
                <li>
                    <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdOrganizations',parentId:'conAdministration_Controls'}">Process / Module Details</a>
                </li>
                <li>
                    <a class="menu-link" href="javascript:void(0);" showwidget="{widgetId:'grdRoleCategories',parentId:'LeafletRoleCategories',parentId:'conAdministration_Controls'}">Record Management</a>
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
        <div class="menu-section border-idashboard" onclick="toggleSubmenu(this)">
            <a class="menu-link bold red" href="javascript:void(0);" showwidget="Logout1">iDashboard</a>
        </div>
    </div>
</div>

<!-- Main Content (Placeholder) -->
<div class="main-content">
    <!-- Your page content goes here -->
</div>

<script>

    function toggleSidebar() {
        const menuColumn = document.getElementById('menuColumn');
        menuColumn.classList.toggle('active');
    }
    function toggleSubmenu(element) {
        const submenu = element.querySelector('.menu-list');
        if (submenu) {
            submenu.style.display = submenu.style.display === 'none' ? 'block' : 'none';
        }
    }

//// Toggle Sidebar (only for small devices)
//function toggleSidebar() {
//    if ($(window).width() <= 768) {
//        var sidebar = $('.sidebar');
//        sidebar.toggleClass('active');
        
//        // Close all submenus when collapsing sidebar
//        if (!sidebar.hasClass('active')) {
//            $('.menu-list').slideUp();
//        }
//    }
//}

//// Toggle Submenu for Icons on Small Devices
//function toggleSubmenu(element) {
//    if ($(window).width() <= 768) {
//        var sidebar = $('.sidebar');
//        var submenu = $(element).find('.menu-list');
        
//        // If sidebar is not active, activate it
//        if (!sidebar.hasClass('active')) {
//            sidebar.addClass('active');
//        } else {
//            // Toggle submenu visibility
//            $('.menu-list').not(submenu).slideUp(); // Close other submenus
//            submenu.slideToggle(); // Toggle clicked submenu
//        }
//    }
//}

// Handle Widget Links
$(document).ready(function() {
    $('.menu-link[showwidget]').on('click', function(e) {
        e.preventDefault(); // Prevent default link behavior
        const widgetData = $(this).attr('showwidget');
        console.log('Widget triggered:', widgetData);
        // Add your widget handling logic here, e.g., call showwidget function
        // Example: showwidget(JSON.parse(widgetData));
    });

    // Handle window resize to reset sidebar state
    $(window).on('resize', function() {
        if ($(window).width() > 768) {
            // On full screen, ensure sidebar is open and submenus are visible
            $('.sidebar').removeClass('active');
            $('.menu-list').css('display', ''); // Clear inline styles
        } else {
            // On small screens, ensure submenus are hidden unless sidebar is active
            if (!$('.sidebar').hasClass('active')) {
                $('.menu-list').slideUp();
            }
        }
    });

    // Trigger resize on page load to set initial state
    $(window).trigger('resize');


});
</script>