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
    <div>
        <div class="bs-component">
            <div id="welcomediv" class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Hola! </strong> <a href="#" class="alert-link">Enter new agent details below</a>.
            </div>

            <div id="agentdetail" class="col-lg-6">
                <form class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label for="AgtFirstName" class="col-lg-2 control-label">First Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtFirstName" placeholder="First Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgtMiddleInitial" class="col-lg-2 control-label">Middle Initial</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtMiddleInitial" placeholder="Initial">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgtLastName" class="col-lg-2 control-label">Last Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtLastName" placeholder="Last Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgtBusPhone" class="col-lg-2 control-label">Phone</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtBusPhone" placeholder="Business Phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgtEmail" class="col-lg-2 control-label">Email</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgtPosition" class="col-lg-2 control-label">Position</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="AgtPosition" placeholder="Position">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="AgencyId" class="col-lg-2 control-label">Agency ID</label>
                            <div class="col-lg-10">
                                <input type="number" class="form-control" id="AgencyId">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button id="insert" class="btn btn-primary">Add Agent</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>


            <script>
                $("#insert").click(function(){
                    data = '{ "agtFirstName":"' + $("#AgtFirstName").val()
                        + '", "agtMiddleInitial":"' + $("#AgtMiddleInitial").val()
                        + '", "agtLastName":"' + $("#AgtLastName").val()
                        + '", "agtBusPhone":"' + $("#AgtBusPhone").val()
                        + '", "agtEmail":"' + $("#AgtEmail").val()
                        + '", "agtPosition":"' + $("#AgtPosition").val()
                        + '", "agentId":0'
                        + ', "agencyId":' + $("#AgencyId").val()
                        + ' }';
                    alert(data);
                    $.ajax({
                        url:"webapi/agents/",
                        type:"POST",
                        data:data,
                        contentType:"application/json",
                        cache:false,
                        dataType:"html",
                        success:function(data){ alert("Agent created!"); }
                    });
                });
            </script>

        </div>
    </div>
</body>
</html>
