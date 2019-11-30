<%-- 
    Document   : Forget Password Action
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>



<%  
String username=request.getParameter("username");
String email=request.getParameter("email");
DataBean dataBean=new DataBean();
dataBean.setUname(username);
dataBean.setEmail(email);

String str=OperationsDAO.forgetPass(dataBean);

if(str!=null){
   %>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">


</head>
<body class="bgimagefade">
	<div align="center">
		<div
			style="background-color: white; margin-top: -28px; width: 1363px;">
			<div align="left">
				<img src="images/logosmalll.png">
			</div>
			<div style="float: right; margin-top: -59px;">

				<ul>
					<li><a href="contactUs.jsp">CONTACT US</a></li>
					<li><a href="aboutUs.jsp">ABOUT US</a></li>

					<li><a href="index.jsp" class="headtext">HOME</a></li>
				</ul>

			</div>
		</div>
		
			<form name="login" action="newPasswordAction.jsp" method="post"
				style="border: 10px">

				<h2 style="align: center;color:#0000b3"><%=username.toUpperCase() %> SET YOUR NEW PASSWORD</h2>
				<input type="hidden" name="username" value= <%=username %> >
				<input type="text" name="newpassword" placeholder="enter your new password" required><br>
				<input type="submit" value="update">
			</form>
</div>
</body>
    
    
    
<%}
else{
	
   response.sendRedirect("forgetPassword.jsp?val=invalid username or email..!!!");
}

%>