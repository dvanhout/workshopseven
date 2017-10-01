<%--
  Created by IntelliJ IDEA.
  User: kaaneroglu
  Date: 2017-10-01
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*" %>
<%@ page import="com.travelexperts.database.TravelExpertsDB" %>

<html>
<head>
    <title>Login</title>
</head>
<body>

    <%
    String username = request.getParameter("username");
    String password= request.getParameter("password");


    Connection conn = TravelExpertsDB.getConnection();
    Statement stmt = conn.createStatement();
    String sql = "select * from agents where AgtUsername='" + username + "' and AgtPassword='" + password + "'";
    ResultSet rs;
    rs = stmt.executeQuery(sql);
    if (rs.next())
        {
            session.setAttribute("username",username);
            response.sendRedirect("agent.jsp");
        }
        else
            response.sendRedirect("error.jsp");
     %>

</html>
