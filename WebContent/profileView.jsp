<%-- 
    Document   : Profile View
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>
<%
session=request.getSession();





session=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
String userName = (String) session.getAttribute("uname");
if (userName==null || userName=="") {
    response.sendRedirect("index.jsp");
}

ArrayList<DataBean> eb=OperationsDAO.viewProfile(userName);
 		int size=0;
 		size=eb.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
     <head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="style.css">


</head>
<body class="homebackground">
	<div align="center">
		<div
			style=" margin-top: -28px; width: 1363px;background-color: white;">
			<div align="left">
				<img src="images/logosmalll.png">
			</div>
			<div style="float: right; margin-top: -59px;">

				<ul>
					<li><a href="logout.jsp">LOGOUT</a></li>
					<li><a href="temp.jsp">BMI</a></li>
					<li><a href="feedBack.jsp">FEEDBACK</a></li>

					<li><a href="task.jsp">TASK</a></li>
					
					<li><a href="home.jsp">HOME</a></li>
				</ul>


			</div>
			</div>
      <table align="center">
      

<% 
 			for(DataBean it:eb){
 			
 			%>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><b>Name:</b><%=it.getName() %></a></span></td></tr>
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><b>Email:</b><%=it.getEmail() %></a></span></td></tr>
	
	<tr><td width="43" align="center"><div align="center" ><span style="font-size: 14"><b>height:</b><%=it.getHeight()%></span></div></td></tr>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><b>weight:</b><%=it.getWeight()%></span></div></td></tr>
	<tr><td width="12" height="20" align="center"><span style="font-size: 14"><b>Age:</b><%=it.getAge() %></a></span></td></tr>
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><b>Gender:</b><%=it.getGender() %></a></span></td></tr>
	
	<tr><td><div align="center" ><span style="font-size: 14"><a href="deleteActionUser.jsp?user=<%=it.getUname()%>"><img src="images/delete.png" style="height: 23px;"></a></span></div></td></tr>
	<tr><td><div align="center" ><span style="font-size: 14"><a href="editAction.jsp?user=<%=it.getUname()%>&fname=<%=it.getName()%>&email=<%=it.getEmail()%>height=<%=it.getHeight()%>&weight=<%=it.getWeight()%>"><img src="images/edit.jpg" style="height: 23px;"></a></span></div></td></tr>
	
	
  
  <% } }%>

</table>

