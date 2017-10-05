<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP successfull login confirmation page
 * Date: October 2017
 *
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%-- checks if the user is logges in via sessions--%>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == ""))
    {
        response.sendRedirect("login.jsp");

    }
%>
<html>
<head>
    <title>Travel Experts Agents Web Service </title>
    <link rel="stylesheet" href="bootstrap.css">

</head>
<body>
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
                <li><a href="agent.jsp">Display Agents</a></li>
                <li><a href="agentpost.jsp">Add Agents</a></li>
                <li><a href="agentput.jsp">Update Agents</a></li>
                <li><a href="agentdelete.jsp">Delete Agents</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%-- checks if the user is logges in via sessions--%>
                <%
                    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == ""))
                    {
                        out.print("<li><a href=\"login.jsp\">Login</a></li>");

                    }
                    else
                    {
                        out.print("<li><a href=\"logout.jsp\">Logout</a></li>");
                    }
                %>

            </ul>
        </div>
    </div>
</nav>
    <div class="row">
        <div class="well bs-component col-lg-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Well hello there!</h3>
                </div>
                <div class="panel-body">
                    You have successfully logged in <a href="#" class="alert-link">Select a link from the navigation bar to start</a>.
                </div>
            </div>

        </div>
    </div>
</body>
</html>
