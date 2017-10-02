<%--
  Created by IntelliJ IDEA.
  User: kaaneroglu
  Date: 2017-09-24
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
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
            //var val = "";
            $("#submit").click(function(event){
                event.preventDefault();

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
                                $('<td>').text(pdata.agencyId),
                                 //"<td><a href='#' class='btn btn-danger'"+ "id='deleteagt' value='10' >Delete</a></td>"
                                 "<td>",
                                 $('<a href=\'#\' class=\'btn btn-warning\' id=\'updateagt\'>').text('Update ' +pdata.agtFirstName),
                                 "<td>",
                                 $('<a href=\'#\' class=\'btn btn-danger\' id=\'deleteagt\'>').text('Delete ' +pdata.agtFirstName)
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
            });

            $("#deleteagt").click(function(event){
                event.preventDefault();
                $("#welcomediv").show();

            })
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
                <li><a href="agent.jsp">Agents</a></li>
                <li><a href="#">Customers</a></li>
                <li><a href="#">Suppliers</a></li>
                <%--<li class="active"><a href="webapi/agents">Say Hello to all the Agents (JSON format) <span class="sr-only">(current)</span></a></li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
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
                <strong>Well hello there!</strong> You have successfully logged in <a href="#" class="alert-link">Select display below to get the agents</a>.
            </div>

            <form class="form-horizontal" method="get">
                <table>
                    <tr>
                        <td><input type="button" value="Display Agents" id="submit" class="btn btn-success"> </td>

                    </tr>
                </table>
            </form>
            <div id="tablediv">
                <table class="table table-striped table-hover " id="agentstable">
                    <tr>
                        <th>Agent ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Agency ID</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
