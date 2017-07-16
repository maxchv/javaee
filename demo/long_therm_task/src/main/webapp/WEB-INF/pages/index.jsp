<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Long therm operation</title>
    <style>
        div.run {
            display: inline-block;
        }
    </style>
</head>
<body>
<h2>Long therm task!</h2>
<form method="post">
    <input type="hidden" name="task" value="run"/>
    <button type="submit">Add task</button>
    <div>
        <%--@elvariable id="result" type="java.util.List"--%>
        <c:forEach items="${result}" var="item" varStatus="status">
        <div class="run">
            <span>${status.index+1}</span>
            <figure>
                <img src="https://media.giphy.com/media/ctcngLvL15Ble/giphy.gif" alt="wait"/>
            </figure>
        </div>
        </c:forEach>
    </div>

    <footer>
        <strong>${summary}</strong>
    </footer>
</form>
</body>
</html>
