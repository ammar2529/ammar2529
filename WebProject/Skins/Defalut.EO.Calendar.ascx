<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Defalut.EO.Calendar.ascx.cs" Inherits="WebProject.Skins.Defalut_EO_Calendar" %>

<%@ Register TagPrefix="eo" Namespace="EO.Web" Assembly="EO.Web" %>

<!-- Control Definition -->
<eo:DatePicker runat="server" DayCellHeight="14" SelectedDates="" DisabledDates="" DisableWeekendDays="True" PopupDownImageUrl="00040210" PopupImageUrl="00040202" VisibleDate="2008-06-01" DayCellWidth="22" CssBlock="
&lt;style  type=&quot;text/css&quot;&gt;
   a.eo_calendar_style1_title_button 
   { 
        width: 21px;
        height: 17px;
        border-right: #f3f3f3 1px solid; 
        border-top: #f3f3f3 1px solid; 
        border-left: #f3f3f3 1px solid; 
        border-bottom: #f3f3f3 1px solid; 
        background-color: transparent; 
   }   
   
   a.eo_calendar_style1_title_button:hover 
   { 
        width: 21px;
        height: 17px;
        border-right: #0044ff 1px solid; 
        border-top: #0044ff 1px solid; 
        border-left: #0044ff 1px solid; 
        border-bottom: #0044ff 1px solid; 
        background-color: #aaaaff   
   }   
&lt;/style&gt;
" PopupHoverImageUrl="00040211" ControlSkinID="None">
<TitleTemplate>
                <table __designer:dtid="281483566645250" border="0" cellpadding="0" cellspacing="0" style="background-color: #f3f3f3;
                    font-size: 11px; font-family: verdana;" width="100%">
                    <tr __designer:dtid="281483566645251">
                        <!-- Previous Year -->
                        <td __designer:dtid="281483566645252">
                            <a __designer:dtid="281483566645253" class="eo_calendar_style1_title_button" href="javascript: void {var:this}.goTo(-12);">
                                <img __designer:dtid="281483566645254" border="0" src="{img:00040302}"  />
                            </a>
                        </td>
                        <!-- Previous Month -->
                        <td __designer:dtid="281483566645255">
                            <a __designer:dtid="281483566645256" class="eo_calendar_style1_title_button" href="javascript: void {var:this}.goTo(-1);">
                                <img __designer:dtid="281483566645257" border="0" src="{img:00040301}"  />
                            </a>
                        </td>
                        <!-- Current Month -->
                        <td __designer:dtid="281483566645258" align="center" width="99%">
                            {var:visible_date:MMM - yy}
                        </td>
                        <!-- Next Month -->
                        <td __designer:dtid="281483566645259">
                            <a __designer:dtid="281483566645260" class="eo_calendar_style1_title_button" href="javascript: void {var:this}.goTo(1);">
                                <img __designer:dtid="281483566645261" border="0" src="{img:00040303}"  />
                            </a>
                        </td>
                        <!-- Next Year -->
                        <td __designer:dtid="281483566645262">
                            <a __designer:dtid="281483566645263" class="eo_calendar_style1_title_button" href="javascript: void {var:this}.goTo(12);">
                                <img __designer:dtid="281483566645264" border="0" src="{img:00040304}"  />
                            </a>
                        </td>
                    </tr>
                </table>
            </TitleTemplate>

<SelectedDayStyle CssText="font-family: verdana; font-size: 8pt; background-color:White;border-bottom-color:Black;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Black;border-left-style:solid;border-left-width:1px;border-right-color:Black;border-right-style:solid;border-right-width:1px;border-top-color:Black;border-top-style:solid;border-top-width:1px;"></SelectedDayStyle>

<DisabledDayStyle CssText="font-family: verdana; font-size: 8pt; border-bottom-color:#CFD9C0;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#CFD9C0;border-left-style:solid;border-left-width:1px;border-right-color:#CFD9C0;border-right-style:solid;border-right-width:1px;border-top-color:#CFD9C0;border-top-style:solid;border-top-width:1px;color:gray;"></DisabledDayStyle>

<CalendarStyle CssText="background-color:#ff8000;border-bottom-color:lime;border-bottom-style:solid;border-bottom-width:1px;border-left-color:lime;border-left-style:solid;border-left-width:1px;border-right-color:lime;border-right-style:solid;border-right-width:1px;border-top-color:lime;border-top-style:solid;border-top-width:1px;"></CalendarStyle>

<DayHoverStyle CssText="background-color:#ffffc0;border-bottom-color:#bbbbbb;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#bbbbbb;border-left-style:solid;border-left-width:1px;border-right-color:#bbbbbb;border-right-style:solid;border-right-width:1px;border-top-color:#bbbbbb;border-top-style:solid;border-top-width:1px;font-family:verdana;font-size:8pt;"></DayHoverStyle>

<MonthStyle CssText="background-color:gainsboro;cursor:hand;"></MonthStyle>

<DayHeaderStyle CssText="font-weight: bold; font-size: 11px; color: black; border-bottom: #555566 1px solid; font-family: verdana; background-color: #ae9c86"></DayHeaderStyle>

<DayStyle CssText="border-bottom-color:#cfd9c0;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#cfd9c0;border-left-style:solid;border-left-width:1px;border-right-color:#cfd9c0;border-right-style:solid;border-right-width:1px;border-top-color:#cfd9c0;border-top-style:solid;border-top-width:1px;font-family:verdana;font-size:8pt;"></DayStyle>
</eo:DatePicker>
