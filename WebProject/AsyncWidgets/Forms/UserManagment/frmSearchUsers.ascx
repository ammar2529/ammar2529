<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSearchUsers.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.UserManagment.frmSearchUsers" %>

<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px;" >
<table style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td >
            <span class="PWCLabel">Organization</span></td>
        <td style="text-align:left">
           
 <%--           <input id="Text1" type="text" class="PWCTextBox AutoComplete"   conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'NewUserOrgIds',ACParams:{minChars:1,multiple:true,width:225}}" groupid="SearchUsers" argumentid="OrgIds"  />
--%>                        <textarea cols="25" rows="5" class="PWCTextBox AutoComplete"   conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'NewUserOrgIds',ACParams:{minChars:1,multiple:true,width:225}}" groupid="SearchUsers" argumentid="OrgIds"  ></textarea>
            </td>
         
        <td >
            &nbsp;<span class="PWCLabel">Department</span>
        </td>
        <td style="text-align:left">
  <%--          <input id="Text2" type="text"  class="PWCTextBox AutoComplete"   conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AC_OrgUnits',QueryId:'OUIds',ACParams:{minChars:1,multiple:true,width:225},ParamFields:['OrgIds']}" groupid="SearchUsers" argumentid="OUIds"  />
 --%>                <textarea  cols="25" rows="5"  class="PWCTextBox AutoComplete" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AC_OrgUnits',QueryId:'OUIds',ACParams:{minChars:1,multiple:true,width:225},ParamFields:['OrgIds']}" groupid="SearchUsers" argumentid="OUIds"    ></textarea>
       </td>
       <td >
            &nbsp;<span class="PWCLabel">User Id</span>
        </td>
        <td style="text-align:left">
<%--            <input id="Text3" type="text"  class="PWCTextBox AutoComplete"  conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',ACParams:{multiple:true,autoFill:false,width:225}}"   groupid="SearchUsers" argumentid="UserIds"  />--%>
              <textarea  cols="25" rows="5"   class="PWCTextBox AutoComplete"  conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',ACParams:{multiple:true,autoFill:false,width:225}}"   groupid="SearchUsers" argumentid="UserIds"   ></textarea>
            </td>
        <td>

            <input id="btnOrgSearch" type="button" value="Search" 
                class="search PWCButton" /> &nbsp;&nbsp; <input id="Button1" type="button" value="Reset" 
                class="reset PWCButton" /></td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td style="text-align:left">
          
            <input class="showdirectors" type="checkbox" groupid="SearchUsers" argumentid="ShowDirectors" />
            <span class="PWCLabel">Directors</span>
        </td>
        <td>
            &nbsp;
        </td>
        <td style="text-align:left">
            <input class="showmanagers" type="checkbox" groupid="SearchUsers" argumentid="ShowManagers" />
              <span class="PWCLabel">Managers</span>
        </td>
        <td>
            &nbsp;  
        </td>
        <td style="text-align:left">
        <input class="showsecretories" type="checkbox" groupid="SearchUsers" argumentid="ShowSecretories" />
            <span class="PWCLabel">Secretories</span>
        </td>
        <td>
            <input class="showmanagers" type="checkbox" groupid="SearchUsers" argumentid="ShowDisabled" /><span class="PWCLabel">Disabled</span></td>
    </tr>
    </table>

    </div><hr size="1" width="100%" noshade 
    style="border: 0; color: #A2CDEE; background-color: #A2CDEE; height: 1px;width: 100%;text-align: left;margin:3px 0px 3px 0px"   /> 