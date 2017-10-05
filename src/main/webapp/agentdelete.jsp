<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP Page for deleting agents with DELETE method from RESTful service
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

    <div>
        <div class="bs-component">
            <div id="welcomediv" class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Welcome!</strong> <a href="#" class="alert-link">Select an agent from dropdown list to delete</a>.
            </div>
            <div>
                <div class="form-group col-lg-2">
                    <select class="form-control" id="agentselect">
                        <option>Select an Agent</option>
                    </select>
                </div>
                <script>
                    //get all the agent firstname and lastname and put in the dropdown list
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
                    });

                    //call DELETE method when user selects an agent from dropdown
                    $("#agentselect").change(function(){
                        if (confirm("Confirm to delete this agent by clicking OK or cancel"))
                        {
                            //alert($("#agentselect").val());
                            $.ajax({
                                url:"webapi/agents/"+ $("#agentselect").val(),
                                type:"DELETE",
                                contentType:"application/json",
                                cache:false,
                                dataType:"html",
                                success:function(){ alert("Agent Deleted"),location.reload(); }
                            });
                        }
                    });
                </script>
            </div>
        </div>
    </div>
</body>
</html>
