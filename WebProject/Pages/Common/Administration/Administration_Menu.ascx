<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administration_Menu.ascx.cs" Inherits="WebProject.Pages.Common.Administration.Administration_Menu" %>

 <table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 5px;
        padding-right: 5px; padding-bottom: 0px; padding-top: 0px;">
            <tr> <td>
            
            <table cellspacing="0" cellpadding="0" border="0" style="background-image: url(App_Themes/eForms_Theme/Images/i/inbg.gif)">
    <tbody>
        <tr>
            <td style="padding-top:5px">
        
              <div id="SitePageMenu" class="SitePageMenu" style="margin-top: 10px;">
                            <%--          <a class="SitePageMenuLinkBorder SitePageMenuLink" href="javascript:void(0);" style="border-color: rgb(139, 177, 222);" showwidget="{widgetId:'frmMyProfile',parentId:'conAdministration_Controls'}" >
                                        <b class="SitePageMenuLabel">MY PROFILE</b><span >View / Update Profile</span></a> 
                                        <a class="SitePageMenuLinkBorder SitePageMenuLink" href="javascript:void(0);" style="border-color: rgb(139, 177, 222);" showwidget="{widgetId:'frmMyProfile',parentId:'conAdministration_Controls'}" >
                                        <b class="SitePageMenuLabel">PROXY ACCESS</b><span >Provide Proxy Access for Your Account to Other Users</span></a>--%>

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
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">User Management</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdSimpleMenu',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Menu Configuration</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdSimpleMenu',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Ammar Menu Configuration</a></li>

                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdRoleCategories',parentId:'conAdministration_Controls'}" href="javascript:void(0);">Role Management</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdListofValues',parentId:'conAdministration_Controls'}" href="javascript:void(0);">List of Values</a></li>
                                        <li><a class="SitePageMenuLink" showwidget="{widgetId:'grdKPI',parentId:'conAdministration_Controls'}" href="javascript:void(0);">KPI Setup</a></li>
                                        <%--<li><b style="color: #0F99CA; display: block; font-size: 11px;">Rental Contracts</b></li>--%>
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
                <img height="32" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
            </td>
        </tr>
    </tbody>
</table>
            </td>
            </tr>
    </table>