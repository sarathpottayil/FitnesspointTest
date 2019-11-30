<%-- 
    Document   : BMR
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>
<%String val = "";
try {
	val = request.getParameter("val");
	if (val.equals(null)) {
		val = "";
	}
} catch (Exception e) {
	val = "";
} %>
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
		</div><h2 style="color:red;">YOU NEED TO FOLLOW</h2>
<%
session=request.getSession();

String user=(String)session.getAttribute("uname");





session=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");

if (user==null || user=="") {
    response.sendRedirect("index.jsp");
}

ArrayList<String> eb=OperationsDAO.bmrCalculator(user);
 		int size=0;
 		size=eb.size();
      if(size!=0){
    	  for(String it:eb){
    		  %>
    		
    		  
    		  
    		 <input type="text" value=" <%out.println(it.toUpperCase());%>" readonly="true" style="width: 1000px;"><br>
    		 
    		
    		 <%
    	  }%>
    	  <a href="task.jsp"><input type="button" value="UPDATE YOUR TASK DONE"></a><%
      }
      
%>