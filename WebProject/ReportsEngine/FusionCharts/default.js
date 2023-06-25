	
	//We keep flags to check whether the charts have loaded successfully.
	//By default, we assume them to false. When each chart loads, it calls
	//a JavaScript function FC_Rendered, in which we'll update the flags
	var empChartLoaded=false;
	var catChartLoaded=false;
	var prodChartLoaded=false;
	var Chart_S_2_Loaded=false;
	var Chart2Loaded=false;
	  
//	if(typeof(trMasterPageHeader) != "undefined")
//    {
//        if(trMasterPageHeader!=null)
//        {
//            //trMasterMenu.style.display='none';
//            trMasterPageHeader.style.display='none';  
//	        //trMasterErrorPanel.style.display='none';
//	        //trProjectDetailsPanel2.style.display='none'; 
//        }
//    }
	

	
			/**
	 * FC_Rendered function is invoked by all FusionCharts charts which are registered
	 * with JavaScript. To this function, the chart passes its own DOM Id. We can check
	 * against the DOM id and update charts or loading flags.
	 *	@param	DOMId	Dom Id of the chart that was succesfully loaded.
	*/
	function FC_Rendered(DOMId){
		//Here, we update the loaded flags for each chart 
		//Since we already know the charts in the page, we use conditional loop
		switch(DOMId){
			case "TopEmployees":				
				empChartLoaded = true;
				break;
			case "SalesByCat":				
				catChartLoaded = true;
				break;
			case "SalesByProd":				
				prodChartLoaded = true;
				break;
			case "Chart_S_2":
			    Chart_S_2_Loaded = true;
			    break;
			case "Chart2":
			    Chart2Loaded = true;
			    break;
		}
		return;
	}
	/** 
	 * updateCharts method is invoked when the user clicks on a column in the sales by year chart.
	 * In this method, we get the year as value, after which we request for XML data
	 * to update the sales by category chart and top employees chart.
	 *	@param	year	Year for which we've to show data.
	*/	
	
    function LiveProcessDrillDown(BusinessGroup)
	{
			var strURL;
			var chartObj;
			
			//myFrm.lblBusinessGroup.innerText = BusinessGroup;
			//myFrm.lblFunction.innerText = "N/A";
			
			if (BusinessGroup == "Infrastructure")
			{
			strURL = "ChartFacade.aspx?CallId=LiveProcessDrillDown_Level2&BusinessGroup=" + BusinessGroup;		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_2");
			chartObj.setDataURL(strURL);
			}
			else
			{
		    strURL = "ChartFacade.aspx?CallId=LiveProcessDrillDown_Level1&BusinessGroup=" + BusinessGroup;		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_2");
			chartObj.setDataURL(strURL);
			}
	}
	
	function LiveFunctionDrillDown(Function,BusinessGroup)
	{
	
	        //myFrm.lblFunction.innerText = Function;
	        
//		    var BAMSelection = myFrm.rblSelectedGraph_0.checked ? myFrm.rblSelectedGraph_0.value :
//	                           myFrm.rblSelectedGraph_1.checked ? myFrm.rblSelectedGraph_1.value : 
//	                           myFrm.rblSelectedGraph_2.checked ? myFrm.rblSelectedGraph_2.value : "-1";

            var BAMSelection = 0;
	                           
			var strURL;
			var chartObj;
			
			if (BAMSelection == "0") //Process Usage
			{
			strURL = "ChartFacade.aspx?CallId=LiveFunctionDrillDown_ProcessUsage&BusinessGroup=" + BusinessGroup +"&Function=" +Function;		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_1");
			chartObj.setDataURL(strURL);
	        }
	        
	        if (BAMSelection == "1")
			{
			strURL = "ChartFacade.aspx?CallId=LiveFunctionDrillDown_Level1&BusinessGroup=" + BusinessGroup +"&Function=" +Function;		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_1");
			chartObj.setDataURL(strURL);
	        }     
	}
	
	function ProcessUsageDrillDown(ProcessName, BusinessGroup)
	{
	
		    var strURL;
			var chartObj;
	        ProcessName =ProcessName.replace('&','%26');
		    strURL = "ChartFacade.aspx?CallId=ProcessUsageDrillDown_YearlyTrend&BusinessGroup=" + BusinessGroup + "&ProcessName=" + ProcessName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_2");
			chartObj.setDataURL(strURL);
			
		    strURL = "ChartFacade.aspx?CallId=ProcessUsageDrillDown_CurrentMonth&BusinessGroup=" + BusinessGroup + "&ProcessName=" + ProcessName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_3");
			chartObj.setDataURL(strURL);
			
			strURL = "ChartFacade.aspx?CallId=ProcessUsageDrillDown_CurrentDay&BusinessGroup=" + BusinessGroup + "&ProcessName=" + ProcessName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_4");
			chartObj.setDataURL(strURL);
	}
	
	
	function ProcessUsageDrillDown_MonthlyTrend(Year,BusinessGroup,ProcessName)
	{
			var strURL;
			var chartObj;
	
		    strURL = "ChartFacade.aspx?CallId=ProcessUsageDrillDown_MonthlyTrend&BusinessGroup=" + BusinessGroup + "&ProcessName=" + ProcessName + "&Year=" + Year;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_2");
			chartObj.setDataURL(strURL);

	}
	
    function ManagementProjectDuration(BG)
	{
			var strURL;
			var chartObj;
	
		    strURL = "ChartFacade.aspx?CallId=ManagementProjectDuration&BG=" + BG;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_3");
			chartObj.setDataURL(strURL);
			}
	
	function ManagementProjectDetails(Status,ProjectName)
	{
			var strURL;
			var chartObj;
			
	        ProjectName = ProjectName.replace('&','%26');
	        
		    strURL = "ChartFacade.aspx?CallId=ManagementProject_TeamMembers&ProjectName=" + ProjectName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_4");
			chartObj.setDataURL(strURL);
			
//		    strURL = "ChartFacade.aspx?CallId=ManagementProject_Cost&ProjectName=" + ProjectName;			
//			strURL = escape(strURL);
//			chartObj = getChartFromId("Chart_S_5");
//			chartObj.setDataURL(strURL);
			
//		    strURL = "ChartFacade.aspx?CallId=ManagementProject_Expenses&ProjectName=" + ProjectName;			
//			strURL = escape(strURL);
//			chartObj = getChartFromId("Chart_S_6");
//			chartObj.setDataURL(strURL);
//			
//			strURL = "ChartFacade.aspx?CallId=ManagementProject_Issues&ProjectName=" + ProjectName;			
//			strURL = escape(strURL);
//			chartObj = getChartFromId("Chart_S_7");
//			chartObj.setDataURL(strURL);
			
//			strURL = "ChartFacade.aspx?CallId=ManagementProject_TeamMembers_Details&ProjectName=" + ProjectName;			
//			strURL = escape(strURL);
//			chartObj = getChartFromId("Chart_S_1");
//			chartObj.setDataURL(strURL);
			
			strURL = "ChartFacade.aspx?CallId=ManagementProject_Weekly_Details&ProjectName=" + ProjectName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_8");
			chartObj.setDataURL(strURL);
	
	}
	
	function ManagementProject_TeamMembers_Details(ProjectName)
	{
			var strURL;
			var chartObj;
			 
	        ProjectName = ProjectName.replace('&','%26');
	        
		    strURL = "ChartFacade.aspx?CallId=ManagementProject_TeamMembers_Details&ProjectName=" + ProjectName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_1");
			chartObj.setDataURL(strURL);
	}
	
		function ManagementProject_Issue_Details(ProjectName)
	{
			var strURL;
			var chartObj;
			 
	        ProjectName = ProjectName.replace('&','%26');
	        
		    strURL = "ChartFacade.aspx?CallId=ManagementProject_Issue_Details&ProjectName=" + ProjectName;			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_1");
			chartObj.setDataURL(strURL);
	}
	
	
	
	
	
	function LoadProjectDetails()
	{
	
	trLiveProcessesPanel2.style.display='none';
	trProjectDetailsPanel2.style.display='';
	
	}
	
	function LoadUserAnalysis()
	{
	
		    var strURL;
			var chartObj;
			
			strURL = "ChartFacade.aspx?CallId=LoadUserAnalysis_Chart_S_2";		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_2");
			chartObj.setDataURL(strURL);

		    strURL = "ChartFacade.aspx?CallId=LoadUserAnalysis_Chart_S_3";		
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_3");
			chartObj.setDataURL(strURL);
	}
	
	
	function ProjectsInProgressDrillDownDelayStatesPerson(StateName, SSDRequest)
	{
	
				var strURL;
			var chartObj;
			
			strURL = "ChartFacade.aspx?CallId=ProjectsInProgressDrillDownDelayStatesPerson&SSDRequest=" + SSDRequest + "&StateName=" + StateName;
			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_4");
			chartObj.setDataURL(strURL);
	
	}
	
	function ProjectsInProgressDrillDownDelayStates(SSDRequest)
	{
	
				var strURL;
			var chartObj;
			
			strURL = "ChartFacade.aspx?CallId=ProjectsInProgressDrillDownDelayStates&SSDRequest=" + SSDRequest;
			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_4");
			chartObj.setDataURL(strURL);

	}
	
	function ProjectsInProgressDrillDown(RequestType,ProjectStatus)
	{
	
		var BC = myFrm.rblBusinessCategory_0.checked ? myFrm.rblBusinessCategory_0.value :
	             myFrm.rblBusinessCategory_1.checked ? myFrm.rblBusinessCategory_1.value :
	             myFrm.rblBusinessCategory_2.checked ? myFrm.rblBusinessCategory_2.value : "-1";

	    var BG = myFrm.rblBusinessGroup_0.checked ? myFrm.rblBusinessGroup_0.value :
	             myFrm.rblBusinessGroup_1.checked ? myFrm.rblBusinessGroup_1.value : 
	             myFrm.rblBusinessGroup_2.checked ? myFrm.rblBusinessGroup_2.value : 
	             myFrm.rblBusinessGroup_3.checked ? myFrm.rblBusinessGroup_3.value : 
	             myFrm.rblBusinessGroup_4.checked ? myFrm.rblBusinessGroup_4.value : "-1";
	
			var strURL;
			var chartObj;
			
			strURL = "ChartFacade.aspx?CallId=ProjectsInProgressDrillDown&Category=" + BC + "&BG=" + BG +"&RequestType=" + RequestType +"&ProjectStatus=" + ProjectStatus;
			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_1");
			chartObj.setDataURL(strURL);
			
			strURL = "ChartFacade.aspx?CallId=ProjectsInProgressDrillDownDelay&Category=" + BC + "&BG=" + BG +"&RequestType=" + RequestType +"&ProjectStatus=" + ProjectStatus;
			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_S_3");
			chartObj.setDataURL(strURL);
	
	}
	
	function LiveProjectsMonthlyDrillDown(Month,RequestType)
	{
	
		var BC = myFrm.rblBusinessCategory_0.checked ? myFrm.rblBusinessCategory_0.value :
	             myFrm.rblBusinessCategory_1.checked ? myFrm.rblBusinessCategory_1.value :
	             myFrm.rblBusinessCategory_2.checked ? myFrm.rblBusinessCategory_2.value : "-1";

	    var BG = myFrm.rblBusinessGroup_0.checked ? myFrm.rblBusinessGroup_0.value :
	             myFrm.rblBusinessGroup_1.checked ? myFrm.rblBusinessGroup_1.value : 
	             myFrm.rblBusinessGroup_2.checked ? myFrm.rblBusinessGroup_2.value : 
	             myFrm.rblBusinessGroup_3.checked ? myFrm.rblBusinessGroup_3.value : 
	             myFrm.rblBusinessGroup_4.checked ? myFrm.rblBusinessGroup_4.value : "-1";
	
			var strURL;
			var chartObj;
			
			strURL = "ChartFacade.aspx?CallId=LiveProjectsMonthlyDrillDown&Category=" + BC + "&BG=" + BG +"&RequestType=" + RequestType +"&Month=" + Month;
			
			strURL = escape(strURL);
			chartObj = getChartFromId("Chart_B_5");
			chartObj.setDataURL(strURL);
	
	}
	
    function Update_BG_Category()
	{
	
	    var BC = myFrm.rblBusinessCategory_0.checked ? myFrm.rblBusinessCategory_0.value :
	             myFrm.rblBusinessCategory_1.checked ? myFrm.rblBusinessCategory_1.value :
	             myFrm.rblBusinessCategory_2.checked ? myFrm.rblBusinessCategory_2.value : "-1";

	    var BG = myFrm.rblBusinessGroup_0.checked ? myFrm.rblBusinessGroup_0.value :
	             myFrm.rblBusinessGroup_1.checked ? myFrm.rblBusinessGroup_1.value : 
	             myFrm.rblBusinessGroup_2.checked ? myFrm.rblBusinessGroup_2.value : 
	             myFrm.rblBusinessGroup_3.checked ? myFrm.rblBusinessGroup_3.value : 
	             myFrm.rblBusinessGroup_4.checked ? myFrm.rblBusinessGroup_4.value : "-1";
    	         
	      //alert(BG + " - " + BC);       
        	         	         
	    var strURL = "ChartFacade.aspx?Category=" + BC + "&BG=" + BG+"&CallId=Update_BG_Category_Chart_S_1";	
        strURL = escape(strURL);
    		
        var chartObj = getChartFromId("Chart_S_2");
        chartObj.setDataURL(strURL);
        
    //	strURL = "ChartFacade.aspx?Category=" + BC + "&BG=" + BG+"&CallId=Update_BG_Category_Chart_S_2";	
    //    strURL = escape(strURL);
    //		
    //    chartObj = getChartFromId("Chart_S_2");
    //    chartObj.setDataURL(strURL);
        
        strURL = "ChartFacade.aspx?Category=" + BC + "&BG=" + BG+"&CallId=Update_BG_Category_Chart_B_1";	
        strURL = escape(strURL);
    		
        chartObj = getChartFromId("Chart_B_1");
        chartObj.setDataURL(strURL);
        
    //    strURL = "ChartFacade.aspx?Category=" + BC "&BG=" + BG;	
    //    strURL = escape(strURL);
    //		
    //    chartObj = getChartFromId("Chart_B_1");
    //    chartObj.setDataURL(strURL);

	    if(myFrm.rblBusinessGroup_4.checked )
	    {
    	    myFrm.ddlInfrastructure.style.display='' ;
	    }	
	    else
	    {
    	    myFrm.ddlInfrastructure.style.display='none' ;
	    }	
	}	
	
	function UpdateEmployeeChart(MonthList)
	{
	        Month = MonthList.selectedIndex+1;
	        
            var  strURL = "ChartFacade.aspx?CallId=EmployeeDetails&Month=" + Month;	
			strURL = escape(strURL);
		
			var chartObj = getChartFromId("Chart_B_2");
			chartObj.setDataURL(strURL);
			
			strURL = "ChartFacade.aspx?CallId=EmployeeDetailsPlannedTasksOnly&Month=" + Month;	
			strURL = escape(strURL);
		
			chartObj = getChartFromId("Chart_B_3");
			chartObj.setDataURL(strURL);
			
        return false;
	}
	
    function UpdateChart0(RegionCode)
	{
	    if (Chart_S_2_Loaded)
	    {
			var strURL = "ChartFacade.aspx?RegionCode=" + RegionCode;		
			strURL = escape(strURL);
		
			var chartObj = getChartFromId("Chart_S_2");
			chartObj.setDataURL(strURL);
		}
		else
		{
			alert("Please wait for the charts to load");
			return;
		}
	}
	
	function UpdateChart2(StateName)
	{
	    if (Chart2Loaded)
	    {
			var strURL = "ChartFacade.aspx?StateName=" + StateName;		
			strURL = escape(strURL);
		
			var chartObj = getChartFromId("Chart_B_2");
			chartObj.setDataURL(strURL);
		}
		else
		{
			alert("Please wait for the charts to load");
			return;
		}
	}
	
			
	function updateCharts(year){	
	
		
		//Update the checkboxes present on the same page.
		var i;
		//Iterate through all checkboxes and match the selected year
		for (i=0; i<document.forms[0].Year.length; i++){			
			if(parseInt(document.forms[0].Year[i].value,10)==year){
				document.forms[0].Year[i].checked = true;				
			}else{
				document.forms[0].Year[i].checked = false;
			}
		}		
		//Now, update the Sales by category chart, if it's loaded
		if (catChartLoaded){
			//DataURL for the categories chart
			var strURL = "Data_SalesByCategory.aspx?Year=" + year;
		
			//Sometimes, the above URL and XML data gets cached by the browser.
			//If you want your charts to get new XML data on each request,
			//you can add the following line:
			strURL = strURL + "&currTime=" + getTimeForURL();
			//getTimeForURL method is defined below and needs to be included
			//This basically adds a ever-changing parameter which bluffs
			//the browser and forces it to re-load the XML data every time.
		
			//We cache the data for the categories chart, as this data is
			//not frequently changing. So, it will enhance user's experience.
								
			//URLEncode it - NECESSARY.
			strURL = escape(strURL);		
			//Get reference to chart object using Dom ID "SalesByCat"
			
			//Send request for XML
			var chartObj = getChartFromId("SalesByCat");
			
			chartObj.setDataURL(strURL);	
		}else{
			//The chart has not loaded till now. We need to wait.
			//So either show some message to the user or do something as your requirements...
			alert("Please wait for the charts to load");
			return;
		}
		
		//Now, update the employees chart, if loaded.
		if (empChartLoaded){
			var strURL = "Data_TopEmployees.aspx?Year=" + year + "&count=5";		
			strURL = escape(strURL);
			
			var chartObj = getChartFromId("TopEmployees");
			chartObj.setDataURL(strURL);
		}else{
			alert("Please wait for the charts to load");
			return;
		}
	}
	/**
	 * updateProductChart method is called when the user selects a particular
	 * category on the category chart. Here, we send a request to get product wise
	 * XML data for the chart.
	 *	@param	intYear		Year for which the user is viewing data
	 *	@param	intMonth	Month for which drill down is required.
	 *	@param	intCatId	Category Id for which we need product wise data.
	*/
	function updateProductChart(intYear, intMonth, intCatId){	
		//Now, update the Sales By Products chart.
		
		var strURL = "Data_SalesByProd.aspx?Year=" + intYear + "&month=" + intMonth + "&catId=" + intCatId;
		strURL = escape(strURL);
		var chartObj = getChartFromId("SalesByProd");
		chartObj.setDataURL(strURL);
	}
	/**
	 * getTimeForURL method returns the current time 
	 * in a URL friendly format, so that it can be appended to
	 * dataURL for effective non-caching.
	*/
	function getTimeForURL(){
		var dt = new Date();
		var strOutput = "";
		strOutput = dt.getHours() + "_" + dt.getMinutes() + "_" + dt.getSeconds() + "_" + dt.getMilliseconds();
		return strOutput;
	}
	/**
	 * openNewWindow method helps open a new JavaScript pop-up window.
	 * It also adds the year to the end of URL
	*/	
	function openNewWindow(theURL,winName,features) {
		 window.open(theURL + "?year=" + getSelectedYear(),winName,features);
	}
	/**
	 * getSelectedYear method returns the selected year
	*/
	function getSelectedYear(){
		var selYear;
		for (i=0; i<document.forms[0].Year.length; i++){			
			if(document.forms[0].Year[i].checked){				 
				selYear = document.forms[0].Year[i].value;
			}
		}
		return selYear;
	}
		
