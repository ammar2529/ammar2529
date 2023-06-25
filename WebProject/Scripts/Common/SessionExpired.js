// JScript File

(
function ($) {
    $.fn.timeout = function (options) {
        //var opts = $.extend({}, $.fn.timeout.defaults, options); 
        var surl;
        //     if(location.href.indexOf("pages/")>0)
        //           surl=location.href.substring(0,location.href.indexOf("pages/"));
        //      else if(location.href.indexOf("DotNetPages/")>0)
        //           surl=location.href.substring(0,location.href.indexOf("DotNetPages/"));     
        //      else if(location.href.indexOf("Error")>0)
        //           surl=location.href.substring(0,location.href.indexOf("Error"));   

        // To Get the Root
        surl = location.href;

        if (location.href.indexOf("Default") > 0)
            surl = location.href.substring(0, location.href.indexOf("Default"));

        if (location.href.indexOf("default") > 0)
            surl = location.href.substring(0, location.href.indexOf("default"));

        if (location.href.indexOf("Logout") > 0)
            surl = location.href.substring(0, location.href.indexOf("Logout"));

        if (location.href.indexOf("logout") > 0)
            surl = location.href.substring(0, location.href.indexOf("logout"));
        // End To Get the Root

        var timeoutUrl = surl + 'Logout.aspx';
        var SessionAliveUrl = surl + 'KeepSessionAlive.aspx';
        var defaults = {
            timeoutInSeconds: 1140, //60, //1140,         
            timeoutWarningInSeconds: 180, //50, //180,    
            timeoutURL: timeoutUrl,
            SessionAlive: SessionAliveUrl,
            timeoutDebug: false
        }
        var opts = $.extend(defaults, options);
        var timer = null; initialize(timer, opts, true);
        return
        this.each(function () { });
    };
    function showToolbar(timer, opts) {
        var surl, lf;
        //        if (location.href.indexOf("pages/") > 0)
        //            surl = location.href.substring(0, location.href.indexOf("pages/"));
        //        else if (location.href.indexOf("DotNetPages/") > 0)
        //            surl = location.href.substring(0, location.href.indexOf("DotNetPages/"));
        //        else if (location.href.indexOf("Error") > 0)
        //            surl = location.href.substring(0, location.href.indexOf("Error"));


        lf = $('.left-border').offset().left || 0;

        // To Get the Root
        surl = location.href;

        if (location.href.indexOf("Default") > 0)
            surl = location.href.substring(0, location.href.indexOf("Default"));

        if (location.href.indexOf("default") > 0)
            surl = location.href.substring(0, location.href.indexOf("default"));

        if (location.href.indexOf("Logout") > 0)
            surl = location.href.substring(0, location.href.indexOf("Logout"));

        if (location.href.indexOf("logout") > 0)
            surl = location.href.substring(0, location.href.indexOf("logout"));
        // End To Get the Root

        var imgsrc = surl + 'App_Themes/eForms_Theme/Images/btn-resume-session.gif';

        if (opts.timeoutDebug) { console.log("Session Timeout JS Firing Toolbar Display"); }
        clearTimeout(timer); timer = null;
        var innerCode = '<div id="sessionTimeoutToolbar" style="width: 200px; position: absolute; left: 0; top: 0; margin: -25px 0 0 0; padding: 5px 0 5px 0px; text-align: center; font-size: 12px; color:#333333; font-family:trebuchet ms,arial,verdana,sans-serif; background-color: #FFFFAA; width: 942px; cursor: pointer; cursor: hand; z-index: 10001; border-bottom: 1px solid #73ABCB">';
        innerCode += '<div id="sessionTimeoutToolbarCountdown" style="width: 200px; float: right; text-align: center; margin: 0; padding: 0; font-weight: bold;">' + opts.timeoutWarningInSeconds + ' Second(s) Remain</div>';
        innerCode += '<div id="sessionTimeoutToolbarCountdown" style="margin: 0; text-align: left; width: 70%; margin-left: 1%; float: left;"><strong>Sorry!</strong> Your session is about to expire. We do this for your data protection. If you want to continue, Click &nbsp; <img src="' + imgsrc + '" border="0" style="cursor: pointer; cursor: hand; position:absolute;" /></div>'; //src="btn-resume-session.gif"
        innerCode += '</div>'; $('body').append(innerCode);
        $("#sessionTimeoutToolbar").css({ 'left': lf + 15, 'line-height': '20px' }); // Adding left side space if want 0 delete this...
        var win = $(window); $("#sessionTimeoutToolbar").stop().animate({ "marginTop": (win.scrollTop()) + "px" }, "slow"
        );
        win.bind('scroll.sessionbar', function () { $("#sessionTimeoutToolbar").stop().animate({ "marginTop": (win.scrollTop()) + "px" }, "slow"); });
        var toCall = function () {
            warningCountdown(timer, opts, opts.timeoutWarningInSeconds);
        };
        timer = setTimeout(toCall, 1000); $('#sessionTimeoutToolbar').click(function () { fireKeepAlive(timer, opts); $(this).remove(); $(window).unbind('scroll.sessionbar'); }); $('#sessionTimeoutToolbar').hover(function () { $(this).css("background-color", "#FFFFCF"); }, function () { $(this).css("background-color", "#FFFFAA"); }); win.focus(); return;

    };
    function warningCountdown(timer, opts, currentSecond) {
        clearTimeout(timer); timer = null; if ($('#sessionTimeoutToolbar').length == 0) { return; }
        $('#sessionTimeoutToolbarCountdown').html(currentSecond + " Second(s) Remain"); if (currentSecond == 0) { timedOut(timer, opts); return; }
        var toCall = function () { warningCountdown(timer, opts, (currentSecond - 1)); }; timer = setTimeout(toCall, 1100); return;
    }
    function timedOut(timer, opts) {
        if (opts.timeoutDebug) { console.log("Fully timed out, redirecting to the timeout page: " + opts.timeoutURL); }
        $('#sessionTimeoutToolbar').remove();

        //This is our Framework Logout to clear the session
        var inv = new AsyncWidgets.RAInvoker();
        inv.invokeRA({ params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
        });
        AsyncWidgets.user.logout();
        // End

        window.location = opts.timeoutURL; return;
    }
    function fireKeepAlive(timer, opts) {
        if (opts.timeoutDebug) { console.log("User clicked the session toolbar.  Firing keep alive request and restarting the " + opts.timeoutInSeconds + "sec timer."); }
        //clearTimeout(timer); timer = null; $.ajax({ url: "KeepSessionAlive.aspx", cache: false }); initialize(timer, opts, false); return;
        clearTimeout(timer); timer = null; $.ajax({ url: opts.SessionAlive, cache: false });
        initialize(timer, opts, false);
        return;
    }
    function initialize(timer, opts, firstInit) {
        if (window.location.href.indexOf('.htm') == -1) {
            if (opts.timeoutDebug) { console.log("Session Timeout JS Started: " + opts.timeoutInSeconds + "sec"); }
            var totalTicks = opts.timeoutInSeconds * 1000; var warningTicks = opts.timeoutWarningInSeconds * 1000;
            var toCall = function () {
                showToolbar(timer, opts);
            };
            timer = setTimeout(toCall, (totalTicks - warningTicks));

            //This is our Framework code to reset timer on any action performed or web service called
            AsyncWidgets.user.on('actionPerformed', function () {
                clearTimeout(timer); timer = null;
                timer = setTimeout(toCall, (totalTicks - warningTicks));
            });
            // End
        }
        return;
    };
})(jQuery); 
