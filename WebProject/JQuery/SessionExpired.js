// JScript File
(
function($) 
{
    $.fn.timeout = function(options)
     {
     //var opts = $.extend({}, $.fn.timeout.defaults, options); 
     var surl;
     if(location.href.indexOf("pages/")>0)
           surl=location.href.substring(0,location.href.indexOf("pages/"));
      else if(location.href.indexOf("DotNetPages/")>0)
           surl=location.href.substring(0,location.href.indexOf("DotNetPages/")); 
      else if(location.href.indexOf("/AsyncWidgets/")>0)     
        surl=location.href.substring(0,location.href.indexOf("AsyncWidgets/"));              
      else if(location.href.indexOf("Error")>0)
           surl=location.href.substring(0,location.href.indexOf("Error"));   
      var timeoutUrl=surl+'SessionTimeout.aspx';
      var SessionAliveUrl=surl+'KeepSessionAlive.aspx';
      var defaults={
			timeoutInSeconds: 120, 
			timeoutWarningInSeconds: 45,
			timeoutURL: timeoutUrl,//'../../SessionTimeout.aspx',
			SessionAlive: SessionAliveUrl,//'../../KeepSessionAlive.aspx',
			timeoutDebug: false
			}
	 var opts = $.extend(defaults, options);		
     var timer = null; initialize(timer, opts, true); 
     return 
    this.each(function() { }); 
    };
      function showToolbar(timer, opts)
       {
        var surl;
        if(location.href.indexOf("pages/")>0)
           surl=location.href.substring(0,location.href.indexOf("pages/"));
        else if(location.href.indexOf("DotNetPages/")>0)
           surl=location.href.substring(0,location.href.indexOf("DotNetPages/"));
        else if(location.href.indexOf("Error")>0)
           surl=location.href.substring(0,location.href.indexOf("Error"));   
       var imgsrc=surl+'App_Themes/Silver/Images/btn-resume-session.gif';
        if (opts.timeoutDebug) { console.log("Session Timeout JS Firing Toolbar Display"); }
        clearTimeout(timer); timer = null; 
        var innerCode = '<div id="sessionTimeoutToolbar" style="position: absolute; left: 0; top: 0; margin: -25px 0 0 0; padding: 4px 0 4px 0px; text-align: center; font-size: 12px; color:#333333; font-family:trebuchet ms,arial,verdana,sans-serif; background-color: #FFFFAA; width: 100%; cursor: pointer; cursor: hand; z-index: 10001; border-bottom: 1px solid #5A5A5A;">'; 
        innerCode += '<div id="sessionTimeoutToolbarCountdown" style="width: 200px; float: right; text-align: center; margin: 0; padding: 0; font-weight: bold;">' + opts.timeoutWarningInSeconds + ' Second(s) Remain</div>'; 
        innerCode += '<div id="sessionTimeoutToolbarCountdown" style="margin: 0; text-align: left; width: 70%; margin-left: 1%; float: left;"><strong>Sorry!</strong> Your session is about to expire. We do this for your data protection. If you want to continue, Click &nbsp; <img src="'+imgsrc+'" border="0" style="cursor: pointer; cursor: hand; position:absolute;" /></div>'; //src="btn-resume-session.gif"
        innerCode += '</div>'; $('body').append(innerCode); 
        var win = $(window); $("#sessionTimeoutToolbar").stop().animate({ "marginTop": (win.scrollTop()) + "px" }, "slow"
        ); 
        win.scroll(function() { $("#sessionTimeoutToolbar").stop().animate({ "marginTop": (win.scrollTop()) + "px" }, "slow"); });
         $
        var toCall = function() 
        { 
        warningCountdown(timer, opts, opts.timeoutWarningInSeconds);
         }; 
         timer = setTimeout(toCall, 1000); $('#sessionTimeoutToolbar').click(function() { fireKeepAlive(timer, opts); $(this).remove(); $(window).unbind('scroll'); }); $('#sessionTimeoutToolbar').hover(function() { $(this).css("background-color", "#FFFFCF"); }, function() { $(this).css("background-color", "#FFFFAA"); }); win.focus(); return;
    }; 
    function warningCountdown(timer, opts, currentSecond) {
        clearTimeout(timer); timer = null; if ($('#sessionTimeoutToolbar').length == 0) { return; }
        $('#sessionTimeoutToolbarCountdown').html(currentSecond + " Second(s) Remain"); if (currentSecond == 0) { timedOut(timer, opts); return; }
        var toCall = function() { warningCountdown(timer, opts, (currentSecond - 1)); }; timer = setTimeout(toCall, 1100); return;
    }
    function timedOut(timer, opts) {
        if (opts.timeoutDebug) { console.log("Fully timed out, redirecting to the timeout page: " + opts.timeoutURL); }
        $('#sessionTimeoutToolbar').remove(); window.location = opts.timeoutURL; return;
    }
    function fireKeepAlive(timer, opts) {
        if (opts.timeoutDebug) { console.log("User clicked the session toolbar.  Firing keep alive request and restarting the " + opts.timeoutInSeconds + "sec timer."); }
        //clearTimeout(timer); timer = null; $.ajax({ url: "KeepSessionAlive.aspx", cache: false }); initialize(timer, opts, false); return;
        clearTimeout(timer); timer = null; $.ajax({ url: opts.SessionAlive, cache: false }); 
        initialize(timer, opts, false);
         return;
    }
    function initialize(timer, opts, firstInit)
     {
        if (window.location.href.indexOf('.htm') == -1) {
            if (opts.timeoutDebug) { console.log("Session Timeout JS Started: " + opts.timeoutInSeconds + "sec"); }
            var totalTicks = opts.timeoutInSeconds * 1000; var warningTicks = opts.timeoutWarningInSeconds * 1000; var toCall = function() { showToolbar(timer, opts); }; timer = setTimeout(toCall, (totalTicks - warningTicks));
        }
        return;
    };
})(jQuery); 
