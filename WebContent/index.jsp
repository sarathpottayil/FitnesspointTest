<%-- 
    Document   : Index
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

					<li><a href="" class="headtext">HOME</a></li>
				</ul>

			</div>
		</div>

		<!-- Tabs Titles -->

		<!-- Icon -->


		<!-- Login Form -->
		<div class="wholediv">

			<form name="login" action="loginAction.jsp" method="post"
				style="border: 10px">

				<h2 style="align: center;color:#0000b3">Sign in</h2>
				<div align="center"
					style="color: red; font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier">
					<label name="msg" value="<%=val%>"><%=val%></label>
				</div>
				<input type="text" name="username" placeholder="username" required><br>
				<input type="password" name="password" placeholder="password"
					required><br> <input type="submit" value="LOGIN">
			</form>
			<div
				style="background-color: white; margin-top: 55px; padding-bottom: 10px;border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;">
				<a href="newUser.jsp">sign up</a><br> <a href="forgetPassword.jsp">Forgot
					Password?</a> <br>
			</div>
		</div>

		<!-- Remind Passowrd -->

	</div>

</body>
</html>
