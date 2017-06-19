<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Selectors tutorial</title>

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <style>
        body {
            padding-top: 50px;
        }

        <c:if test="${not empty param.select}" var="is_select" scope="request">
        .demo ${param.select} {
            font-weight: bold;
            color: #333;
            background-color: #ffc;
            outline: 2px solid red
        }

        </c:if>
    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/idea.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CSS Selectors</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <%--<li><a href="#about">About</a></li>--%>
                <%--<li><a href="#contact">Contact</a></li>--%>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<div class="container">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <header>
                <h2>Задание</h2>
            </header>

            <ul>
                <li>Выбрать <span class="text-primary">input</span> типа <span class="text-primary">checkbox</span>.
                </li>
                <li>Выбрать <span class="text-primary">input</span> типа <span class="text-primary">checkbox</span>,
                    <span class="text-danger">НЕ</span> отмеченный.
                </li>
                <li>Найти все элементы с <span class="text-primary">id=message</span> или <span class="text-primary">message-*</span>.
                </li>
                <li>Найти все элементы с <span class="text-primary">id=message-*</span>.</li>
                <li>Найти все ссылки с расширением <span class="text-primary">href="...zip"</span>.</li>
                <li>Найти все элементы с атрибутом <span class="text-primary">data-action</span>, содержащим <span
                        class="text-primary">delete</span> в списке (через пробел).
                </li>
                <li>Найти все элементы, у которых <span class="text-danger">ЕСТЬ</span> атрибут <span
                        class="text-primary">data-action</span>, но он <span class="text-danger">НЕ</span>
                    содержит <span class="text-primary">delete</span> в списке (через
                    пробел).
                </li>
                <li>Выбрать все чётные элементы списка <span class="text-primary">#messages</span>.</li>
                <li>Выбрать один элемент сразу за заголовком <span class="text-primary">h3#widget-title</span> на том же
                    уровне вложенности.
                </li>
                <li>Выбрать все ссылки, следующие за заголовком <span class="text-primary">h3#widget-title</span> на том
                    же уровне вложенности.
                </li>
                <li>Выбрать ссылку внутри последнего элемента списка <span class="text-primary">#messages</span>.</li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <form action="" method="post" class="form-inline" role="form">

                <div class="form-group">
                    <label class="sr-only" for="select">Selector</label>
                    <input size="50" type="text" class="form-control" name="select" id="select" value="${param.select}"
                           placeholder="Selector ...">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

    <div class="row">
        <%
            String html = "<label>Unchecked <input type=\"checkbox\"></label>\n" +
                    "\n" +
                    "<label>Checked <input type=\"checkbox\" checked></label>\n" +
                    "\n" +
                    "<label>Message <input type=\"text\" id=\"message\"></label>\n" +
                    "\n" +
                    "<h3 id=\"widget-title\">Сообщения:</h3>\n" +
                    "<ul id=\"messages\">\n" +
                    "   <li id=\"message-1\">Сообщение 1</li>\n" +
                    "   <li id=\"message-2\">Сообщение 2</li>\n" +
                    "   <li id=\"message-3\" data-action=\"delete\">Сообщение 3</li>\n" +
                    "   <li id=\"message-4\" data-action=\"edit do-not-delete\">Сообщение 4</li>\n" +
                    "   <li id=\"message-5\" data-action=\"edit delete\">Сообщение 5</li>\n" +
                    "   <li><a href=\"#\">...</a></li>\n" +
                    "</ul>\n" +
                    "\n" +
                    "<a href=\"http://site.com/list.zip\">Ссылка на архив</a>\n" +
                    "<a href=\"http://site.com/list.pdf\">..И на PDF</a>";
            request.setAttribute("html", html);
        %>
        <div class="col-xs-6">
            <pre><code class="html"><c:out value="${html}" escapeXml="true"/></code></pre>
        </div>
        <div class="col-xs-6 demo">
            ${html}
        </div>
    </div>
</div><!-- /.container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
