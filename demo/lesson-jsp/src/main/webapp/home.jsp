<%@ page import="java.util.Enumeration" %>>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>home</h1>
    <div>
        <header>
            <h2>Init parameters</h2>
        </header>
        <table>
<%
    Enumeration<String> names = config.getInitParameterNames();

    while(names.hasMoreElements()) {
        out.println("<tr>");
        out.println("<td>");
        String name = names.nextElement();
        out.println(name);
        out.println("<td>");
        out.println("<td>");
        String value = config.getInitParameter(name);
        out.println(value);
        out.println("<td>");
        out.println("</tr>");
    }
%>
        </table>
    </div>
</body>
</html>
