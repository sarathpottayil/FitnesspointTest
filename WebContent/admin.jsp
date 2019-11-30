<%-- 
    Document   : Admin
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
	String val = "";
	try {
		val = request.getParameter("val");
		if (val.equals(null)) {
			val = "";
		}
	} catch (Exception e) {
		val = "";
	}
	
	session=request.getSession(false);
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
    String userName = (String) session.getAttribute("uname");
    if (userName==null || userName=="") {
        response.sendRedirect("index.jsp");
    }
	%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="homebackground">
	<div align="center">
		<div
			style="background-color: white; margin-top: -28px; width: 1363px;">
			<div align="left">
				<img src="images/logosmalll.png">
			</div>
			<div style="float: right; margin-top: -59px;">

				<ul>
				<li><a href="logout.jsp">Logout</a></li>
				<li><a href="viewUsers.jsp">View Users</a></li>
				<li><a href="feedBackView.jsp">View Feedback</a></li>
					
				</ul>

</div>
			<div align="center"
					style="color: red; font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier">
					<label name="msg" value="<%=val%>"><%=val%></label>
				</div>
		</div>
		<div><h1> WELCOME <%=userName.toUpperCase()%></h1></div>
</body>
</html>