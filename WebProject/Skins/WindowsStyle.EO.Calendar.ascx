<!-- Move the register derective below to the top of the page and delete this comment line if you paste this into another page. -->
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<!-- Control Definition -->
<eo:DatePicker  runat="server" ControlSkinID="None" DayCellHeight="16" DayCellWidth="22" DayHeaderFormat="Short" DisabledDates="" MonthSelectorVisible="True" PopupExpandDirection="Top" SelectedDates="" TitleLeftArrowDownImageUrl="00040103" TitleLeftArrowImageUrl="00040101" TitleRightArrowDownImageUrl="00040104" TitleRightArrowImageUrl="00040102" VisibleDate="2008-08-01" WeekSelectorVisible="True">
    <TodayStyle CssText="background-image:url('00040106');" />
    <FooterTemplate>
        <div style="font-weight: bold; font-size: 11px; font-family: Tahoma&quot;">
        
            <img src="{img:00040106}">
            Today: {var:today:dd/MM/yyyy}
        </div>
    </FooterTemplate>
    <SelectedDayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; background-image:url('00040105');color:white;" />
    <PopupExpandEffect Type="CheckerBoardUp" />
    <DisabledDayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; COLOR: gray" />
    <PopupCollapseEffect Type="Fade" />
    <CalendarStyle CssText="border-bottom-color:Black;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Black;border-left-style:solid;border-left-width:1px;border-right-color:Black;border-right-style:solid;border-right-width:1px;border-top-color:Black;border-top-style:solid;border-top-width:1px;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;background-color:white" />
    <DayHoverStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; text-decoration:underline" />
    <MonthStyle CssText="MARGIN: 0px 4px; cursor:hand" />
    <TitleStyle CssText="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; PADDING-BOTTOM: 3px; COLOR: white; PADDING-TOP: 3px; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #0054e3" />
    <DayHeaderStyle CssText="FONT-SIZE: 11px; COLOR: #0054e3; BORDER-BOTTOM: black 1px solid; FONT-FAMILY: Tahoma" />
    <DayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; text-decoration:none" />
</eo:DatePicker>
