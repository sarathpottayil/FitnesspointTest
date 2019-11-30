<%-- 
    Document   : Feedback View
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
ArrayList<DataBean> eb=OperationsDAO.viewFeedback();

DataBean dataBean=new DataBean();

 		int size=0;
 		size=eb.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
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

					<li><a href="viewUsers.jsp">View users</a></li>
					<li><a href="admin.jsp">Home</a></li>
				</ul>

</div>
			
		</div>
      <table   align="center">

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
	<td><a href="replyMail.jsp?sl=<%=it.getUname()%>"><img src="images/delete.png" style="height: 23px;"></a></td>
	</tr>
  
  <% } }%>

</table>
