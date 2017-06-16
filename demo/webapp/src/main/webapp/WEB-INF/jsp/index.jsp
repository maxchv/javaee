<%@ page language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>

<h1><%= request.getAttribute("title") %></h1>
<%
//    response.getWriter().println("start");
//    Enumeration<String> attrs = request.getAttributeNames();
//
//    while (attrs.hasMoreElements()) {
//        String attr = attrs.nextElement();
//        response.getWriter().println("attr: " + attr);
//    }
//    String title = (String) request.getAttribute("title");
//    response.getWriter().println(title);
//    response.getWriter().println("end");
%>

</body>
</html>
