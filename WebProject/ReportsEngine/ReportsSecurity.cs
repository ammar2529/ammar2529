using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Text;
namespace WebProject.ReportsEngine {


public class ReportsSecurity
{
    Page _page;
    string UserRolls, NextReportID;
    DataTable tblSiteMap, tblSiteMapAllRoles;
    EO.Web.SlideMenu EOsmSiteMap;


    public EO.Web.SlideMenu NavigationMenu
    {
        get { return EOsmSiteMap; }
    }

    ControlCollection _Controls;
    string SSQLAllRoles = @"
       -- Select * from RPTChartEngineSiteMap
SELECT     *,
                          (SELECT     CASE WHEN EXISTS
                                                       (SELECT     *
                                                         FROM          RPTChartEngineReportMap
                                                         WHERE      ReportId = '{0}' AND RPTChartEngineReportMap.MenuID = RPTChartEngineSiteMap.MenuID) THEN 1 ELSE 0 END) 
                      AS IsSelected
FROM         RPTChartEngineSiteMap
WHERE     (IsVisible= 1)
ORDER BY  dbo.GetMenuUniqueId(MenuDepth) --MenuDepth

";
    string SQLRptAuthorization = @"
SELECT  Count(*) NoOfMenues 
FROM         (SELECT     RPTChartEngineSiteMap.MenuID
                       FROM          (SELECT     MenuDepth, MenuDepth + '.%' AS MenuDepthAll
                                               FROM         ( select * from RPTChartEngineSiteMap where (IsVisible= 1))RPTChartEngineSiteMap
                                               WHERE      (RoleID IN {0} or  'SysAdmin' in {0} or  'RPT_Admin' in {0} )) ParentMenu INNER JOIN
                                              RPTChartEngineSiteMap ON RPTChartEngineSiteMap.MenuDepth LIKE ParentMenu.MenuDepthAll OR 
                                              RPTChartEngineSiteMap.MenuDepth = ParentMenu.MenuDepth) AuthorisedMenues
WHERE     (MenuID IN
                          (SELECT     MenuID
                            FROM          RPTChartEngineReportMap
                            WHERE      (ReportId = '{1}') or 'SysAdmin' in{0} or  'RPT_Admin' in {0} ))
";
    public ReportsSecurity(Page page, EO.Web.SlideMenu sldMenu)
    {
        _page = page;
        //  UserRolls = "('SysAdmin')";
        if (_page.Session["AuthorisedRoles"] == null || _page.Session["AuthorisedRoles"].ToString().Trim() == "")
        {
            UserRolls = "('')"; //return false;
        }
        else
            UserRolls = _page.Session["AuthorisedRoles"].ToString();

        EOsmSiteMap = sldMenu;
    }
    public bool IsUserAuthorized()
    {
        NextReportID = _page.Request.QueryString["NextReportID"];
        if (_page.Session["AuthorisedRoles"] == null) return false;

        // UserRolls = _page.Session["AuthoristedRoles"].ToString();
        // UserRolls = "('test122')";
        SQLRptAuthorization = string.Format(SQLRptAuthorization, UserRolls, NextReportID);

        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            DataTable tblRptAuthorization = CUtilityWeb.getDataTable(SQLRptAuthorization, sqlConnection);
            if (Convert.ToInt32(tblRptAuthorization.Rows[0][0]) > 0)
            {
                return true;
            }
            else return false;
        }
    }
    public void AuthenticateUser()
    {
        //if ((_page.Session["OrganizationIDs"] == null) || (_page.Session["DepartmentIDs"] == null))
        if (CUtilityWeb.GetCurrentUserId() == "")
        {
            _page.Response.Clear();
            //_page.RegisterClientScriptBlock("ClearChache", @"document.execCommand(""ClearAuthenticationCache"", false)");
            _page.Response.Redirect("/default.aspx");
            _page.Response.End();
        }

    }
    public static void IsUserAuthenticated(Page page)
    {
        ReportsSecurity.IsUserAuthenticated(page, "../../default.aspx");

    }
    public static void IsUserAuthenticated(Page page, string PageToRedirect)
    {
        if (CUtilityWeb.GetCurrentUserId() == "")
        {
            page.Response.Clear();
            //page.RegisterClientScriptBlock("ClearChache", @"document.execCommand(""ClearAuthenticationCache"", false)");
            page.Response.Redirect(PageToRedirect);
            page.Response.End();
        }

    }
    public void BuildTreeMenu()
    {
        //ControlCollection Controls
        //_Controls = Controls;
        if (_page.Session["TreeMenu"] == null)
        {
            NextReportID = _page.Request.QueryString["NextReportID"];

            SSQLAllRoles = SSQLAllRoles != "" || SSQLAllRoles != null ? string.Format(SSQLAllRoles, NextReportID) : SSQLAllRoles;

            DateTime EndTime, StartTime;

            StartTime = DateTime.Now;
            string SSQL = UserRolls.IndexOf("SysAdmin") < 0 && (UserRolls.IndexOf("RPT_Admin") < 0) ? string.Format(@"
Select *,0 as Added
     --MenuID, dbo.GetMenuUniqueId(MenuDepth) MenuDepth, MenuText, IconPath, NavigationURL, RoleID, DepthLevel, IsVisible, MenuType,0 as Added
    from RPTChartEngineSiteMap
    where RoleID in {0} and IsVisible=1  
    order by dbo.GetMenuUniqueId(MenuDepth) --dbo.ufn_TopParentMenuIndex(MenuDepth)

", UserRolls) : @"Select *,0 as Added from RPTChartEngineSiteMap
            where charindex('.',menudepth)=0  and IsVisible=1 
            order by  dbo.GetMenuUniqueId(MenuDepth) --dbo.ufn_TopParentMenuIndex(MenuDepth)
";

            SSQLAllRoles = string.Format(SSQLAllRoles, "", NextReportID);
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                tblSiteMap = CUtilityWeb.getDataTable(SSQL, sqlConnection);
                tblSiteMapAllRoles = CUtilityWeb.getDataTable(SSQLAllRoles, sqlConnection);
            }
            //EOsmSiteMap = new EO.Web.SlideMenu();
            //EOsmSiteMap.EnableViewState = false;
            //EOsmSiteMap.SingleExpand = false;
            //SetSlideMenu(EOsmSiteMap);
            //Controls.Add(EOsmSiteMap);
            foreach (DataRow DR in tblSiteMap.Rows)
            {
                string MenuDept = DR["MenuDepth"].ToString();

                // Modified Code By Muhammed Qasim, on 11-Feb-2013
                // The following code was to fix the bug when a user a have Roles for a node and it's childern(explicitly). 
                // This condition cause a node to be generated two times. to solve this proble a flag COLUMN "ADDED" added to the query with init value 0.
                // when a node is added to the menu it will mark it's descendent node status falg to 1 so those descendents could not be processed again.
                Boolean added = Convert.ToBoolean( DR["Added"]);
                if (!added)
                {
                    BuildDescendent(BuildAncestor(MenuDept), MenuDept);

                   DataRow[] drs = tblSiteMap.Select("MenuDepth like '" + MenuDept + ".%' and  added = 0");
                   foreach (DataRow dr in drs)
                   {
                       dr["Added"] = 1;
                   }
                
                }
            }
            // EOsmSiteMap.Items 
            bool AnyMenuExpanded = false;
            foreach (EO.Web.MenuItem MI in EOsmSiteMap.Items)
            {
                CustomeItemTemplate CIT = (CustomeItemTemplate)MI.SubMenu.Items[0].CustomItem;
                if (CIT.TreeView.SelectedNode != null)
                {
                    MI.Expanded = true;
                    AnyMenuExpanded = true;
                    break;
                }
            }
            //if (!AnyMenuExpanded  && EOsmSiteMap.Items.Count > 0)
            //{
            //    EOsmSiteMap.Items[0].Expanded = true;
            //}
            //     Session["TreeMenu"] = EOsmSiteMap;
        }
        else
        {
            EO.Web.SlideMenu tmp = (EO.Web.SlideMenu)_page.Session["TreeMenu"];
            EOsmSiteMap = new EO.Web.SlideMenu();
            SetSlideMenu(EOsmSiteMap);
            foreach (EO.Web.MenuItem MI in tmp.Items)
            {
                EO.Web.MenuItem NewMainItem = EOsmSiteMap.Items.Add(MI.Text.ToString());
                NewMainItem.ItemID = MI.ItemID;
                EO.Web.MenuGroup SubMenuItem = NewMainItem.SubMenu;

                EO.Web.MenuItem SubMenu = SubMenuItem.Items.Add(MI.ItemID + "_SubMenu");

                EO.Web.TreeView TreeMenu = new EO.Web.TreeView();

                TreeMenu.ID = MI.ItemID + "_TreeMenu";

                SubMenu.CustomItem = new CustomeItemTemplate(TreeMenu);
            }
            //  Controls.Add(EOsmSiteMap);

        }

    }
    void BuildDescendent(object PNode, string MenuDept)
    {
        Stack<EO.Web.TreeNode> ParentElementStack = new Stack<EO.Web.TreeNode>();
        EO.Web.TreeNode LastAddedNode = null, NewAddedNode = null, ParentNode = null;
        EO.Web.TreeView MainTree = null;
        int ParentDepthLevel = MenuDept.Length - MenuDept.Replace(".", "").Length, CurrentDepthLevel;
        //  LastDepthLevel = ParentDepthLevel;

        DataRow[] DescendentMenu = tblSiteMapAllRoles.Select("MenuDepth like '" + MenuDept + ".%'");

        // MainTree.find
        if (PNode == null) return;

        if (PNode.GetType().Name == "TreeView")
        {
            MainTree = (EO.Web.TreeView)PNode;
        }
        else
        {
            ParentNode = (EO.Web.TreeNode)PNode;
            //  ParentDepthLevel = 1;
        }

        foreach (DataRow ChildElement in DescendentMenu)
        {
            CurrentDepthLevel = Convert.ToInt32(ChildElement["DepthLevel"]);
            if (CurrentDepthLevel == 1) //if there is no node in the tree menu
            {
                ParentNode = MainTree.Nodes.Add(ChildElement["MenuText"].ToString());
                LastAddedNode = ParentNode;
            }
            else if (ParentDepthLevel < CurrentDepthLevel) //if the next row have the child element
            {
                if (CurrentDepthLevel - ParentDepthLevel > 1) //if Grand Child 
                {
                    ParentElementStack.Push(ParentNode); //Push Grand Parent
                    ParentNode = LastAddedNode; //Make Last Child The Current Parent
                    ParentDepthLevel += 1; //Increase Parent One Level
                }
                LastAddedNode = ParentNode.ChildNodes.Add(ChildElement["MenuText"].ToString());
                // ParentDepthLevel  = CurrentDepthLevel;
            }
            else if (ParentDepthLevel == CurrentDepthLevel) //if the next row have the same level element 
            {
                ParentNode = ParentElementStack.Pop();
                ParentDepthLevel = ParentDepthLevel - 1;
                LastAddedNode = ParentNode.ChildNodes.Add(ChildElement["MenuText"].ToString());
            }
            else if (ParentDepthLevel > CurrentDepthLevel) //if the next row have the parent element
            {
                for (int iLoop = CurrentDepthLevel; iLoop <= ParentDepthLevel; iLoop++)
                {
                    ParentNode = ParentElementStack.Pop();
                }
                LastAddedNode = ParentNode.ChildNodes.Add(ChildElement["MenuText"].ToString());
                ParentDepthLevel = CurrentDepthLevel - 1;

            }
            LastAddedNode.ItemID = ChildElement["MenuID"].ToString();
            if (LastAddedNode != null )
            {
                if (ChildElement["IsSelected"].ToString() == "1")
                {
                    LastAddedNode.Selected = true;
                    LastAddedNode.EnsureVisible();
                }
              //  LastAddedNode.ToolTip = ChildElement["Tooltip"].ToString();
                //LastAddedNode.ToolTip = ChildElement["Tooltip"] != DBNull.Value ? ChildElement["Tooltip"].ToString() : "";
                // NewAddedNode.t
            }
            if (ChildElement["NavigationURL"].ToString() != "")
            {
                LastAddedNode.NavigateUrl = ChildElement["NavigationURL"].ToString();
            }
        }
    }
    object BuildAncestor(string MenuDept)
    {
        string[] ItemIndexes = MenuDept.Split(".".ToCharArray());

        DataRow[] ParentMenu = tblSiteMapAllRoles.Select("MenuDepth ='" + ItemIndexes[0] + "'");

        string ParentMenuID = ParentMenu[0]["MenuId"].ToString();

        string CurrentLevel = ItemIndexes[0], CurrentTreeLevel = "", MenuID = null;
        EO.Web.MenuItem NewMainItem, SubMenu;
        EO.Web.MenuGroup SubMenuItem;
        EO.Web.TreeLookNodeCollection TreeMenuNodes;
        EO.Web.TreeView TreeMenu;
        EO.Web.TreeNode LastAddedNode = null;
        CustomeItemTemplate CIT;

        if (ItemIndexes.Length > 0)
        {
            NewMainItem = FindMenuItemById(ParentMenuID, EOsmSiteMap.Items); //try to find the slid menu item
            if (NewMainItem == null) //if entry not exists in slide menu create slide menu item 
            {
                NewMainItem = EOsmSiteMap.Items.Add(ParentMenuID);
                NewMainItem.ItemID = ParentMenuID;
                NewMainItem.Text.Html = ParentMenu[0]["MenuText"].ToString();
                if (ParentMenu[0]["IconPath"].ToString().Trim() != "")
                {
                    NewMainItem.LeftIcon.Url = ParentMenu[0]["IconPath"].ToString();
                }
                if (ParentMenu[0]["NavigationURL"].ToString().Trim() != "")
                {
                    NewMainItem.NavigateUrl = ParentMenu[0]["NavigationURL"].ToString();
                }
                SubMenuItem = NewMainItem.SubMenu; //get the slide menu "MenuGroup" which contains the submenu item

                SubMenu = SubMenuItem.Items.Add(ParentMenuID + "_SubMenu"); // add Submenu(which will hold the tree) to the MenuGroup
                SubMenu.ItemID = ParentMenuID + "_SubMenu";
                TreeMenu = new EO.Web.TreeView();
                // TreeMenu.EnableViewState = false;
                TreeMenu.ID = ParentMenuID + "_TreeMenu";

                SubMenu.CustomItem = new CustomeItemTemplate(TreeMenu); //add the TreeView to the SubMenu item
            }
            else
            {
                // CIT = (CustomeItemTemplate)NewMainItem.CustomItem;
                TreeMenu = new EO.Web.TreeView();
                // TreeMenu.EnableViewState = false;
                TreeMenu.ID = ParentMenuID + "_TreeMenu";
                if (NewMainItem.SubMenu.Items[0].CustomItem == null)
                {
                    SubMenu = FindMenuItemById(NewMainItem.ItemID + "_SubMenu", NewMainItem.SubMenu.Items);
                    SubMenu.CustomItem = CIT = new CustomeItemTemplate(TreeMenu);
                }
                else
                    CIT = (CustomeItemTemplate)NewMainItem.SubMenu.Items[0].CustomItem;
                TreeMenu = CIT.TreeView;
            }
            ////////////////////////////Upto this point we have TreeView In the SubMenuItem/////////////
            if (TreeMenu != null)
            {
                for (int iLoop = 1; iLoop < ItemIndexes.Length; iLoop++)
                {
                    CurrentLevel += "." + ItemIndexes[iLoop];
                    ParentMenu = tblSiteMapAllRoles.Select("MenuDepth ='" + CurrentLevel + "'");
                    // if (ParentMenu.Length < 1) break;
                    MenuID = ParentMenu[0]["MenuID"].ToString();
                    if (iLoop == 1) //if this entry is the first entry so add it to the TreeMenuNodes Else Add it to the LastAddedNode collection
                    {
                        if (!(TreeMenu.Nodes.Count >= (Convert.ToInt32(ItemIndexes[1]) + 1)))
                        {
                            // TreeNodeCollection TNC = TreeMenu.Nodes;
                            LastAddedNode = FindTreeNode(TreeMenu.Nodes, MenuID); //if node already exists don't create it just grab it from the collection
                            if (LastAddedNode == null)
                            {
                                LastAddedNode = TreeMenu.Nodes.Add(ParentMenu[0]["MenuText"].ToString());
                                LastAddedNode.ItemID = ParentMenu[0]["MenuID"].ToString();
                            }
                        }
                        else
                        {
                            LastAddedNode = TreeMenu.Nodes[Convert.ToInt32(ItemIndexes[1])];
                        }

                    }
                    else
                    {
                        EO.Web.TreeNode tmpNode = null;
                        if (!(LastAddedNode.ChildNodes.Count >= (Convert.ToInt32(ItemIndexes[iLoop]) + 1)))
                        {
                            tmpNode = FindTreeNode(LastAddedNode.ChildNodes, MenuID);
                            if (tmpNode == null)
                            {
                                LastAddedNode = LastAddedNode.ChildNodes.Add(ParentMenu[0]["MenuText"].ToString());
                                LastAddedNode.ItemID = ParentMenu[0]["MenuID"].ToString();
                            }
                            else
                            {
                                LastAddedNode = tmpNode;
                            }
                        }
                        else
                        {
                            LastAddedNode = LastAddedNode.ChildNodes[Convert.ToInt32(ItemIndexes[iLoop])];
                        }
                    }
                    if (LastAddedNode != null )
                    
                    {
                        if (ParentMenu[0]["IsSelected"].ToString() == "1")
                        {
                            LastAddedNode.Selected = true;
                            LastAddedNode.EnsureVisible();
                        }
                        LastAddedNode.ToolTip = ParentMenu[0]["Tooltip"] != DBNull.Value?  ParentMenu[0]["Tooltip"].ToString():"";
                    }
                    if (ParentMenu[0]["NavigationURL"].ToString().Trim() != "")
                    {
                        LastAddedNode.NavigateUrl = ParentMenu[0]["NavigationURL"].ToString();
                    }
                }
            } //end of if(TreeMenu != null)

            return (LastAddedNode == null ? (object)TreeMenu : (object)LastAddedNode);

        }

        return null;
    }



    EO.Web.MenuItem FindMenuItemById(string ItemID, EO.Web.MenuItemCollection MenuItems)
    {
        foreach (EO.Web.MenuItem MI in MenuItems)
        {
            if (MI.ItemID == ItemID)
            {
                return MI;
            }
        }
        return null;
    }
    EO.Web.TreeView FindTreeView(string MenuDept, EO.Web.MenuItemCollection MenuItems)
    {
        string[] ItemIndexes = MenuDept.Split(".".ToCharArray());
        if (ItemIndexes.Length > 1)
        {
            //   EO.Web.CustomItem custom;
        }
        return null;
    }
    EO.Web.TreeNode FindTreeNode(EO.Web.TreeNodeCollection TNC, string ItemID)
    {
        foreach (EO.Web.TreeNode TN in TNC)
        {
            if (TN.ItemID == ItemID)
            {
                return TN;
            }
        }
        return null;
    }
    public static void SetTreeVieMenu(EO.Web.TreeView TVM)
    {
        TVM.ControlSkinID = "None";
        TVM.Height = new Unit("260px");
        TVM.Width = new Unit("230px");
        TVM.LineImages.Visible = false;

        EO.Web.TreeNode NewNode = new EO.Web.TreeNode();

        NewNode.ItemID = "_Default";

        // NewNode.CollapsedImageUrl = "00030501";
        // NewNode.ExpandedImageUrl = "00030502";
        // NewNode.ImageUrl = "00030503";

        NewNode.NormalStyle.CssText = @"padding-right: 3px; padding-left: 3px; padding-bottom: 1px; padding-top: 1px";
        NewNode.SelectedStyle.CssText = @"border-right: #8396c3 1px solid; padding-right: 2px; border-top: #8396c3 1px solid; padding-left: 2px; padding-bottom: 0px; border-left: #8396c3 1px solid; padding-top: 0px; border-bottom: #8396c3 1px solid; background-color: #f2f5fb";
        NewNode.SubGroup.ItemSpacing = 4;

        TVM.LookNodes.Add(NewNode);
        TVM.TopGroup.Style.CssText = "cursor:hand;font-family:Tahoma;font-size:9pt;";

    }
    public static void SetSlideMenu(EO.Web.SlideMenu SlideMnu)
    {
        SlideMnu.SingleExpand = true;
        SlideMnu.EnableScrolling = false;

        SlideMnu.ID = "MainMenu";
        SlideMnu.ControlSkinID = "None";
        //SlideMnu.SlidePaneHeight = 170;
        SlideMnu.Width = new Unit("150");
        SlideMnu.Height = new Unit("170");

        EO.Web.MenuItem NItem = new EO.Web.MenuItem();
        NItem.ItemID = "_TopGroup";
        NItem.SubMenu.Style.CssText = "BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: tahoma";
        SlideMnu.LookItems.Add(NItem);

        NItem = new EO.Web.MenuItem();
        NItem.ItemID = "_TopLevelItem";
        NItem.LeftIcon.Padding.Left = 6;
        NItem.Image.Mode = EO.Web.MenuItemImages.ImageMode.ItemBackground; // "ItemBackground";
        //  NItem.Image.Url = "~/images/MenuNormal.gif";
        //  NItem.Image.HoverUrl = "~/images/MenuHover.gif";
        //  NItem.Image.ExpandedUrl = "~/images/MenuSelected.gif";
        NItem.Height = 31;
        NItem.NormalStyle.CssText = "border-bottom: tan 1px solid";
        NItem.HoverStyle.CssText = "border-bottom: tan 1px solid";

        NItem.SubMenu.Style.CssText = "padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: tahoma";
        SlideMnu.LookItems.Add(NItem);

        NItem = new EO.Web.MenuItem();
        NItem.ItemID = "_Separator";
        NItem.IsSeparator = true;
        SlideMnu.LookItems.Add(NItem);

        NItem = new EO.Web.MenuItem();
        NItem.ItemID = "_Default";
        NItem.LeftIcon.Padding.Right = 5;
        NItem.Height = 20;
        NItem.NormalStyle.CssText = "font-weight: normal; text-decoration: none";
        NItem.HoverStyle.CssText = "font-weight: normal;  text-decoration: underline";

        SlideMnu.LookItems.Add(NItem);

        NItem = new EO.Web.MenuItem();
        NItem.ItemID = "plain_text";
        NItem.LeftIcon.Padding.Right = 5;
        NItem.Text.NoWrap = EO.Web.NullableBool.False;
        NItem.Height = 20;
        NItem.NormalStyle.CssText = "font-weight: normal;";
        SlideMnu.LookItems.Add(NItem);





        /*
    <eo:MenuItem LeftIcon-Url="00000506" Text-Html="Information Technology" Selected="True"
        CustomItemID="" ItemID="IT">
        <SubMenu>
            <Items>
                <eo:MenuItem CustomItemID="CustomItem1" Text-Html="ITChild" ItemID="ITChild">
                </eo:MenuItem>
            </Items>
        </SubMenu>
    </eo:MenuItem>
         */
    }
    /******************************************************************/
    public class CustomeItemTemplate : ITemplate
    {
        #region ITemplate Members
        EO.Web.TreeView _TreeView;

        public EO.Web.TreeView TreeView
        {
            get
            {
                return _TreeView;
            }
        }
        public CustomeItemTemplate(EO.Web.TreeView TreeView)
        {
            _TreeView = TreeView;
        }
        public void InstantiateIn(Control container)
        {
            EO.Web.CustomItem CI = (EO.Web.CustomItem)container;
            SetTreeVieMenu(_TreeView);
            container.Controls.Add(_TreeView);
        }
        void SetTreeVieMenu(EO.Web.TreeView TVM)
        {
            TVM.ControlSkinID = "None";
            TVM.LineImages.Visible = false;
            EO.Web.TreeNode NewNode = new EO.Web.TreeNode();
            NewNode.ItemID = "_Default";
            NewNode.CollapsedImageUrl = "00030501";
            NewNode.ExpandedImageUrl = "00030502";
            NewNode.ImageUrl = "~/App_Themes/eForms_Theme/images/graph.gif";
            NewNode.NormalStyle.CssText = @"padding-right: 3px; padding-left: 3px; padding-bottom: 5px; padding-top: 3px;font-size: 8pt; ";
            NewNode.SelectedStyle.CssText = @"border-right: #B6BDD2 1px solid; padding-right: 3px; border-top: #B6BDD2 1px solid; padding-left: 3px; padding-bottom: 3px; border-left: #B6BDD2  1px solid; padding-top: 3px; border-bottom: #B6BDD2 1px solid; background-color:#B6BDD2;FONT-WEIGHT: bold;";
            NewNode.SubGroup.ItemSpacing = 4;
            TVM.LookNodes.Add(NewNode);
            TVM.TopGroup.Style.CssText = "cursor:hand;font-family:Verdana;font-size:11px;";

            //NewNode.NormalStyle.CssText = @"padding-right: 3px; padding-left: 3px; padding-bottom: 1px; padding-top: 1px";
            //NewNode.SelectedStyle.CssText = @"border-right: #8396c3 1px solid; padding-right: 2px; border-top: #8396c3 1px solid; padding-left: 2px; padding-bottom: 0px; border-left: #8396c3 1px solid; padding-top: 0px; border-bottom: #8396c3 1px solid; background-color: #f2f5fb";
            // Added by prakash
            //TVM.TopGroup.Style.CssText = "cursor:hand;font-family:Tahoma;font-size:9pt;";
            //NewNode.NormalStyle.CssText = @"padding-right: 3px; padding-left: 3px; padding-bottom: 1px; padding-top: 1px";
            //NewNode.SelectedStyle.CssText = @"border-right: #8396c3 1px solid; padding-right: 2px; border-top: #8396c3 1px solid; padding-left: 2px; padding-bottom: 0px; border-left: #8396c3 1px solid; padding-top: 0px; border-bottom: #8396c3 1px solid; background-color: #f2f5fb";
            //NewNode.SubGroup.ItemSpacing = 4;
            //TVM.LookNodes.Add(NewNode);
            //TVM.TopGroup.Style.CssText = "cursor:hand;font-family:Tahoma;font-size:9pt;";
        }
        #endregion
    }
}
}