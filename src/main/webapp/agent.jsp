<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP Page for displaying agents with GET method from RESTful service
 * Date: October 2017
 *
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            $("#tablediv").hide();
            $("#currentagents").hide();

            //function for clicking submit button
            $("#submit").click(function(event){
                event.preventDefault();
                //ajax to run GET from RESTful service
                $.ajax({
                    type: "GET",
                    dataType:"json",
                    url:  "webapi/agents",
                    success: function(data) {
                        console.log("response:" + data);
                        $.each(data, function(j, pdata) {
                             $('<tr>').append(
                                $('<td>').text(pdata.agentId),
                                $('<td>').text(pdata.agtFirstName),
                                $('<td>').text(pdata.agtLastName),
                                $('<td>').text(pdata.agtEmail),
                                $('<td>').text(pdata.agencyId)
                            ).appendTo('#agentstable');
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! '+textStatus);
                    }
                });
                $("#tablediv").show();
                $("#welcomediv").hide();
                $("#submit").hide();
                $("#currentagents").show();
            });
        });
    </script>
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
        <div class="well bs-component">
            <div id="welcomediv" class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <a href="#" class="alert-link">Select display below to get the agents</a>.
            </div>

            <form class="form-horizontal" method="get">
                <table>
                    <tr>
                        <td><input type="button" value="Display Agents" id="submit" class="btn btn-success"> </td>

                    </tr>
                </table>
            </form>
            <h1 id="currentagents" class="text-danger">Current agents at Travel Experts:</h1>
            <div id="tablediv">
                <table class="table table-striped table-hover " id="agentstable">
                    <tr>
                        <th>Agent ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Agency ID</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
