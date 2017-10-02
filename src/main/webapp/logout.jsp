<%--
  Created by IntelliJ IDEA.
  User: kaaneroglu
  Date: 2017-10-01
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == ""))
    {
        response.sendRedirect("login.jsp");

    }
%>
<html>
<head>
    <title>Travel Experts Agents Web Service</title>
    <link rel="stylesheet" href="bootstrap.css">
</head>
<body>
    <%
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
    %>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Travel Experts</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="agent.jsp">Agents</a></li>
                    <li><a href="#">Customers</a></li>
                    <li><a href="#">Suppliers</a></li>
                    <%--<li class="active"><a href="webapi/agents">Say Hello to all the Agents (JSON format) <span class="sr-only">(current)</span></a></li>--%>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>



    <div class="row">
        <div class="col-lg-6">

                <div class="alert alert-dismissible alert-info">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Good day!</strong> You <a href="#" class="alert-link">have successfully logged out.</a>
                </div>

        </div>
    </div>

</body>
</html>
