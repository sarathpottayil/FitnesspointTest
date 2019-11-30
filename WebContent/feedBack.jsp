<%-- 
    Document   :Feedback
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@ page import="java.io.*"%>
<%@page import=" java.text.SimpleDateFormat"%>
<%@page import=" java.util.Date"%>
<%@ page import="com.dao.OperationsDAO"%>
<%@ page import="com.bean.DataBean"%>
<%@ page import="java.util.ArrayList"%>
<%
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
		<form align="center" action="EnterFeedBack.jsp">
			<h1>ENTER YOUR FEEDBACK</h1>
			<table align="center">
				<%
					String pattern = "yyyy-MM-dd";
					SimpleDateFormat rdate = new SimpleDateFormat(pattern);
					Date date = new Date();
					String da = rdate.format(date);
				%>
				<td><input type="hidden" name="date" value=<%=da%>></td>
				</tr>
				<tr>
					<td><input type="hidden" name="user" value=<%=user%>></td>
				</tr>
				<tr>
					<td>COMMENT::</td>
					<td><input type="text" name="comment"></td>
				</tr>

				<tr>
					<td><input type="submit" value="submit"></td>
				</tr>
			</table>
		</form>
		<%


	DataBean dataBean=new DataBean();
	
	ArrayList<DataBean> eb=OperationsDAO.userViewFeedback(user);
 		int size=0;
 		size=eb.size();
      if(size==0){%>
    	  <h3 align="center">YOU HAVE NOT GIVEN ANY FEEDBACKS</h3>
      <% }else{%> <table   align="center">

<tr>
	<td align="center">Sl.No</td>
	
	<td align="center">USERNAME</td>	
		<td align="center">DATE</td>
   <td align="center">COMMENTS</td>
	<td align="center">ACTION</td>
</tr>
      <% 
      int i=0;
      
 			for(DataBean it:eb){
 				
 			%>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%= ++i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getUname()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getDa()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getComment()%></span></div></td>
	<td><a href="userDeleteFeedBackAction.jsp?sl=<%=it.getSl()%>"><img src="images/delete.png" style="height: 23px;"></a>
	
	
	
	<a href="userEditFeedBackAction.jsp?sl=<%=it.getSl()%>"><img src="images/edit.jpg" style="height: 23px;"></a></td>
	
	
	</tr>
  
  <% } }%>

</table>
</body>
</html>
