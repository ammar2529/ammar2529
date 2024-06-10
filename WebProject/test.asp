<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
    <% 
        dim showLabel
        if (ShowLabel) {%>
<label>This will not be shown if the ShowLabel property evaluates false</label>
<%}%>

Name is:    <%=Request.QueryString("name") & "<br>"%>
    email is:    <%=Request.QueryString("email") & "<br>"%>
</body>
</html>