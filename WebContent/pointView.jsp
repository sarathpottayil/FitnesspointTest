<%-- 
    Document   : Point View
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.dao.OperationsDAO" %>
<%@ page import="com.bean.DataBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%
session=request.getSession();

String user=(String)session.getAttribute("uname");
int point=OperationsDAO.viewPoints(user);
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

if (user==null || user=="") {
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
					<li><a href="pointView.jsp">REWARDS</a></li>
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
   
      <table align="center">

<tr>
	
	<td align="center"><b>POINTS EARNED</b></td>
</tr>
     
 
   <tr>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><input type="text" value="<%= point%>" readonly="true"> </span></div></td>
	
	</tr>
  
  

</table>