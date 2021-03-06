<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP home page for the site
 * Date: October 2017
 *
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Travel Experts Agents Web Service </title>
        <link rel="stylesheet" href="bootstrap.css">

    </head>
    <body class style>


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


        <div class="jumbotron">
            <h1>Agents Database</h1>
            <p>This is a prototype web site that consumes the Agents Restful web Service developed by our team.</p>
            <p><a class="btn btn-primary btn-lg" href="agent.jsp">Click to start...</a></p>
        </div>

    </body>
</html>
