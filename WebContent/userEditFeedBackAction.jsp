
<%@ page import="java.io.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import=" java.util.Date"%>
<%@ page import="com.dao.OperationsDAO"%>
<%@ page import="com.bean.DataBean"%>
<%@ page import="java.util.ArrayList"%>
<%
	int id=Integer.parseInt(request.getParameter("sl"));
	String user = (String) session.getAttribute("uname");
	
	String val = "";
	try {
		val = request.getParameter("val");
		if (val.equals(null)) {
			val = "";
		}
	} catch (Exception e) {
		val = "";
	}

	session = request.getSession(false);
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");

	if (user == null || user == "") {
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
					<li><a href="logout.jsp">LOGOUT</a></li>
					<li><a href="temp.jsp">BMI</a></li>
					<li><a href="feedBack.jsp">FEEDBACK</a></li>
					<li><a href="rewards.jsp">REWARDS</a></li>
					<li><a href="task.jsp">TASK</a></li>
					<li><a href="profileView.jsp">PROFILE</a></li>
					<li><a href="home.jsp">HOME</a></li>
				</ul>


			</div>
			<div align="center"
				style="color: red; font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier">
				<label name="msg" value="<%=val%>"><%=val%></label>
			</div>
		</div>
		<form align="center" action="editFeedback.jsp">
			<h1>UPDATE YOUR FEEDBACK</h1>
			<table align="center">
				
				<tr>
					<td><input type="hidden" name="id" value=<%=id%>></td>
				</tr>
				<tr>
					<td>UPDATE COMMENT::</td>
					<td><input type="text" name="comment" value=""></td>
				</tr>

				<tr>
					<td><input type="submit" value="submit"></td>
				</tr>
			</table>
		</form>