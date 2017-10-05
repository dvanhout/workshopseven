<%--
 * Project Workshop 7 CMPP264(JSP)
 * Author: Kaan
 * Purpose: JSP page that checks the login information from the database
 * Date: October 2017
 *
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
    String sql = "select * from agents where agtFirstName='" + username + "' and agtLastName='" + password + "'";
    ResultSet rs;
    rs = stmt.executeQuery(sql);
    if (rs.next())
        {
            session.setAttribute("username",username);
            response.sendRedirect("loginOk.jsp");
        }
        else
            response.sendRedirect("error.jsp");
     %>

</html>
