<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Search.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Search" %>

<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/t5.gif); background-repeat: repeat-x"
                class="text-align-positive">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td >
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="headr">
                                                <img height="26px" width="35px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                            <td width="100%" class="head-search" nowrap="nowrap">
                                                <span style="color: White; font-weight: bold; padding-left:10px" class="HeaderTitle">
                                                   Welcome to eForms - Paperless Office
                                                </span>
                                                <img height="10px" width="10px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                            <td class="headl">
                                                <img height="26px" width="35px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
  
                           <td width="100%" align="right" style="padding-right:10px;padding-bottom:5px">
                                <div class="jclock" style="padding: 0 0 0 0; font-weight:bold"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr style="display:none">
            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/t6.gif); background-repeat: repeat-x"
                align="center">
                <img alt="" src="App_Themes/eForms_Theme/Images/i/t6.gif" />
            </td>
        </tr>
        <tr style="display:none"> 
            <td align="left" style="padding-left: 10px; padding-right: 10px; padding-top: 5px; padding-bottom: 5px; background-color: #F8F9F9" width="380px">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td style="padding-right: 15px;" nowrap="nowrap">
                                <span class="tmp_rtxtb text-align-positive">
                                    Category</span>

                                    <select id="ddlTeamName"  name="ddlTeamName" style="width:150px; font-size:9px" class="dropdownlist"
                                      groupid="SearchResults" argumentid="TeamName">
                                    <option selected="selected" value="">
                                        --- Select Category ---</option> 
                                    
                                </select>
                            </td>
                            <td style="padding-left: 5px; padding-right: 15px; border-left: #dfe0ef 1px solid" nowrap="nowrap">
                                <span class="tmp_rtxtb text-align-positive">
                                    Brand</span>

                                    <select id="Select1"  name="ddlTeamName" style="width:150px; font-size:9px" class="dropdownlist"
                                      groupid="SearchResults" argumentid="TeamName">
                                    <option selected="selected" value="">
                                        --- Select Brand ---</option> 
                                   
                                </select>
                            </td>
                            <td style="padding-left: 5px; border-left: #dfe0ef 1px solid" nowrap="nowrap">
                                <span class="tmp_rtxtb text-align-positive">
                                    Product</span>

                                    <select id="Select2"  name="ddlTeamName" style="width:150px; font-size:9px" class="dropdownlist"
                                      groupid="SearchResults" argumentid="TeamName">
                                    <option selected="selected" value="">
                                        --- Select Product ---</option> 
                                   
                                </select>
                            </td>
                            <td style="padding-left: 15px; padding-right: 10px;" nowrap="nowrap" width="100%">
                                    <a class="search default ViewButton" href="javascript:void(0);" style="vertical-align: top;">
                                    <img alt="" height="23px" width="39px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                                        border="0" /></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>

                <td width="100%" style="padding-left: 10px; padding-right: 10px; padding-top: 5px; padding-bottom: 5px; background-color: #F8F9F9">

            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/f-t4.gif); background-repeat: repeat-x">
                <img alt="" src="App_Themes/eForms_Theme/images/f-t4.gif" />
                            </td>
        </tr>
    </tbody>
</table>