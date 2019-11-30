<%-- 
    Document   : View Users
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.OperationsDAO"%>
<%@page import="com.bean.DataBean"%>
<%
	ArrayList<DataBean> eb = OperationsDAO.viewUserProfile();
	int size = 0;
	size = eb.size();
	if (size == 0) {
%>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<h3 align="center">NO DATA TO SHOWN</h3>
<%
	} else {
%>


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

					<li><a href="feedBackView.jsp">View Feedback</a></li>
					<li><a href="admin.jsp">Home</a></li>
				</ul>

</div>
			<div align="center"
					style="color: red; font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier">
					<label name="msg" value="<%=val%>"><%=val%></label>
				</div>
		</div>
<table  align="center">
	<tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14">USERNAME</span></td>
		<td width="12" height="20" align="center"><span
			style="font-size: 14">NAME</span></td>
		<td width="12" height="20" align="center"><span
			style="font-size: 14">EMAIL</span></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14">HEIGHT</span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14">WEIGHT</span>
			</div></td>
		
<td width="43" align="center"><div align="center">
				<span style="font-size: 14">AGE</span>
			</div></td>
		
<td width="43" align="center"><div align="center">
				<span style="font-size: 14">GENDER</span>
			</div></td>
	<td width="43" align="center"><div align="center">
				<span style="font-size: 14">DELETE</span>
			</div></td>

<%
		for (DataBean it : eb) {
	%>
 
  <tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=it.getUname()%></span></td>
 <td width="12" height="20" align="center"><span
			style="font-size: 14"><%=it.getName()%></span></td>
 <td width="12" height="20" align="center"><span
			style="font-size: 14"><%=it.getEmail()%></span></td>
<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getHeight()%></span>
			</div></td>
	<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getWeight()%></span>
			</div></td>
	<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=it.getAge()%></span></td>
    <td width="12" height="20" align="center"><span
			style="font-size: 14"><%=it.getGender()%></a></span></td>
	<td><width ="43" align="center">
			<div align="center">
				<span style="font-size: 14"><a
					href="deleteAction.jsp?user=<%=it.getUname()%>"><img src="images/delete.png" style="height: 23px;"></a></span>
			</div></td>
	</tr>
	
	
  
  <%
		    	}
		    	}
		    %>

</table>
