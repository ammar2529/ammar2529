
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeepSessionAlive.aspx.cs" Inherits="WebProject.KeepSessionAlive" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Keep Session Alive</title>
    <!-- Meta refresh disabled for testing to avoid interference -->
    <!-- <meta id="MetaRefresh" http-equiv="refresh" content="10;url=KeepSessionAlive.aspx" runat="server" /> -->
    <script type="text/javascript" language="javascript">
        // Log to confirm script is running
        console.log("JavaScript initialized at: " + new Date().toLocaleString());

        // Set window status
        window.status = "<%=WindowStatusText%>";

        // Function to check session status via AJAX
        function checkSession() {
            console.log("Checking session status...");
            $.ajax({
                url: 'CheckSession.aspx',
                type: 'GET',
                success: function (data) {
                    console.log("Session check response: " + data);
                    if (data === "expired") {
                        console.log("Session expired, redirecting..."); // BREAKPOINT HERE
                        window.location.href = "BudastoorLogin.aspx";
                    } else {
                        console.log("Session is active");
                    }
                },
                error: function () {
                    console.log("Error checking session, redirecting..."); // BREAKPOINT HERE
                    window.location.href = "BudastoorLogin.aspx";
                }
            });
        }

        // Session timeout warning and console countdown
        var timeoutDuration = 10000; // 10 seconds in milliseconds
        var timeLeft = timeoutDuration / 1000; // Convert to seconds for countdown

        // Console countdown timer
        console.log("Starting countdown for session timeout...");
        var countdown = setInterval(function () {
            console.log("Session expires in: " + timeLeft + " seconds");
            timeLeft--;
            if (timeLeft < 0) {
                clearInterval(countdown); // Stop countdown when time is up
                console.log("Session has expired!"); // BREAKPOINT HERE
                checkSession(); // Check session status on timeout
            }
        }, 1000); // Update every second

        // Session timeout warning alert
        setTimeout(function () {
            console.log("Showing session timeout alert...");
            alert("Your session is about to expire! Please save your work.");
            checkSession(); // Check session status before redirect
        }, timeoutDuration - 2000); // Warn 2 seconds before timeout

        // Initial session check on page load
        $(document).ready(function () {
            checkSession();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>Session is active. Last refresh: <%=WindowStatusText%></span>
        </div>
    </form>
</body>
</html>
