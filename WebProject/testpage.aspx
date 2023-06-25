<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="WebProject.testpage" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170" Width="100%" ClientIDMode="AutoID">
                <LookItems>
                    <eo:MenuItem ItemID="_TopGroup">
                        <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: Verdana;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                        </SubMenu>
                    </eo:MenuItem>
                    <eo:MenuItem Height="30" HoverStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;"
                        Image-Mode="ItemBackground" Image-Url="~/App_Themes/eForms_Theme/images/SliverMenu.gif"
                        ItemID="_TopLevelItem" LeftIcon-Padding-Left="6" NormalStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                        <SubMenu Style-CssText=" padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: Verdana;background-color:#F6F8F9;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray ">
                        </SubMenu>
                    </eo:MenuItem>
                    <eo:MenuItem Height="20" HoverStyle-CssText="font-weight: normal; text-decoration: none"
                        ItemID="_Default" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal; text-decoration: none">
                    </eo:MenuItem>
                    <eo:MenuItem Height="20" ItemID="plain_text" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal;"
                        Text-NoWrap="False">
                        
                    </eo:MenuItem>
                </LookItems>
                <TopGroup Style-CssText="border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                    <Items>
                        <eo:MenuItem Text-Html="Menu Item 1">
                            <SubMenu>
                                <Items>
                                    <eo:MenuItem Text-Html="New Menu Item 1A">
                                    </eo:MenuItem> 
                                </Items>
                            </SubMenu>
                        </eo:MenuItem>
                    </Items>
                </TopGroup>
            </eo:SlideMenu>
<%--            <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170" Width="100%">
                <LookItems>
                    <eo:MenuItem ItemID="_TopGroup">
                        <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: Verdana;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                        </SubMenu>
                    </eo:MenuItem>
                    <eo:MenuItem Height="30" HoverStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;"
                        Image-Mode="ItemBackground" Image-Url="~/App_Themes/eForms_Theme/images/SliverMenu.gif"
                        ItemID="_TopLevelItem" LeftIcon-Padding-Left="6" NormalStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                        <SubMenu Style-CssText=" padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: Verdana;background-color:#F6F8F9;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray ">
                        </SubMenu>
                    </eo:MenuItem>
                    <eo:MenuItem Height="20" HoverStyle-CssText="font-weight: normal; text-decoration: none"
                        ItemID="_Default" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal; text-decoration: none">
                    </eo:MenuItem>
                    <eo:MenuItem Height="20" ItemID="plain_text" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal;"
                        Text-NoWrap="False">
                    </eo:MenuItem>
                </LookItems>
                <TopGroup Style-CssText="border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                </TopGroup>
            </eo:SlideMenu>--%>
           
        </div>
    </form>
</body>
</html>
