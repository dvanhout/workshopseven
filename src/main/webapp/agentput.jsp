<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP Page for updating agents with PUT method from RESTful service
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
    <div>
        <div class="bs-component">
            <div id="welcomediv" class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Howdy!</strong> <a href="#" class="alert-link">Select an agent from dropdown list to view and update</a>.
            </div>

            <div id="dropdownlist" class="form-group col-lg-2">
                <select class="form-control" id="agentselect" onchange="getAgent(this.value)">
                    <option>Select an Agent</option>
                </select>
            </div>

            <div id="agentdetail" class="col-lg-6">
                <form class="form-horizontal">
                    <fieldset>

                        <div class="form-group">
                            <label for="AgentId" class="col-lg-2 control-label">Agent ID</label>
                            <div class="col-lg-10">
                                <input type="number" class="form-control" id="AgentId" disabled="disabled">
                            </div>
                        </div>
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
                                <button id="update" class="btn btn-primary">Update Agent</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <script>
                //populate the dropdown with agent names as page loads
                $(document).ready(function(){
                    $.get("webapi/agents",
                        function(data){
                            for (i=0; i<data.length; i++)
                            {
                                $("#agentselect").append("<option value='"
                                    + data[i].agentId
                                    + "'>"
                                    + data[i].agtFirstName
                                    + " "
                                    + data[i].agtLastName
                                    + "</option>");
                            }
                        },
                        "json");

                    $("#agentdetail").hide();
                });

                //call the PUT method when user clicks the update button
                $("#update").click(function(){
                    data =
                        '{ "agentId":0, "agtFirstName":"' + $("#AgtFirstName").val()
                        + '", "agtMiddleInitial":"' + $("#AgtMiddleInitial").val()
                        + '", "agtLastName":"' + $("#AgtLastName").val()
                        + '", "agtBusPhone":"' + $("#AgtBusPhone").val()
                        + '", "agtEmail":"' + $("#AgtEmail").val()
                        + '", "agtPosition":"' + $("#AgtPosition").val()
                        + '", "agencyId":' + $("#AgencyId").val()
                        + ' }';

                    $.ajax({
                        url:"webapi/agents/"+ $("#agentselect").val(),
                        type:"PUT",
                        data:data,
                        contentType:"application/json",
                        cache:false,
                        dataType:"html",
                        success:function(){ alert("Agent Updated") }
                    });
                    alert("Request Submitted");
                });

                //when user selects an agent from dropdown, populate the fields for that agent
                $("#agentselect").change(function(){

                    $.get("webapi/agents/"+ $("#agentselect").val(),
                        function(data){
                            $('#AgtFirstName').val(data.agtFirstName);
                            $('#AgtMiddleInitial').val(data.agtMiddleInitial);
                            $('#AgtLastName').val(data.agtLastName);
                            $('#AgtBusPhone').val(data.agtBusPhone);
                            $('#AgtEmail').val(data.agtEmail);
                            $('#AgtPosition').val(data.agtPosition);
                            $('#AgencyId').val(data.agencyId);
                            $('#AgentId').val(data.agentId);

                        },
                        "json");

                    $("#agentdetail").show();

                });
            </script>

        </div>
    </div>
</body>
</html>
