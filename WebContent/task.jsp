<%-- 
    Document   : Task
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>
<%@page import="com.dao.CalorieCalculation" %>

<% 
session=request.getSession();
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
String user = (String) session.getAttribute("uname");
if (user==null || user=="") {
    response.sendRedirect("index.jsp");
}
%>
<%DataBean ob=null;
DataBean dataBean=new DataBean();
int c=0;
boolean flag=OperationsDAO.check(user);
if(flag){
    ob=OperationsDAO.checkTask(user);
    
if(ob.getCount()==2){
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
  <form action="enterTasktwo.jsp">
  <p>ENTER THE TIME IN MINUTES SPENT FOR <%=ob.getTask1().toUpperCase()%></p><input type="number" name="time1"><br>
 <p> ENTER THE TIME IN MINUTES SPENT FOR <%=ob.getTask2().toUpperCase()	%></p><input type="number" name="time2"><br>
  <input type="hidden" name="username" value=<%=user %>>
 
  <% 
  session.setAttribute("task2",ob.getTask2());
  session.setAttribute("task1",ob.getTask1());
  %>
 
  <input type="submit"value="submit">
  </form>
  <% 
}

else if(ob.getCount()==1){
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
  <form action="enterTaskone.jsp">
  <p>ENTER THE TIME IN MINUTES SPENT FOR  <%=ob.getTask1().toUpperCase()%></p><input type="number" name="time1"><br>
  <input type="hidden" name="username" value=<%=user %>>
  <%
  session.setAttribute("task1",ob.getTask1());
  %>
 
   <input type="submit"value="submit">
  </form>
  <% 
}
else{
	response.sendRedirect("bmr.jsp");
}
}
else{
	response.sendRedirect("home.jsp?val=UPDATE YOUR DETAILS FIRST");
}
%>
