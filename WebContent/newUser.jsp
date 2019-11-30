<%-- 
    Document   : New User
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body class="enterdetailsbg">
	<div style="background-color: white; margin-top: -28px; width: 1363px;">
		<div>
			<img src="images/logosmalll.png">
		</div>
		<div>

			<ul>
				<li><a href="contactUs.jsp" class="headtext">CONTACT US</a></li>
				<li><a href="aboutUs.jsp" class="headtext">ABOUT US</a></li>

				<li><a href="index.jsp" class="headtext">HOME</a></li>
			</ul>

		</div>
	</div>
	<div align="center">
	
		<form method="post" name="new user" action="newUserAddAction.jsp"
			style="border: 10px; border-color: black;">
			<h1>ENTER PERSONAL DETAILS</h1>
			<label name="msg" value="<%=val%>"
						style="color: red; font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier"><%=val%></label>
			<table>
				<tr>
					<td><b>FULLNAME*</b></td>
					<td><input type="text" name="name" placeholder="FULLNAME"
						required /></td>
				</tr>
				<tr>
					<td><b>AGE</b></td>
					<td><input type="number" name="age" placeholder="AGE" required></td>
				</tr>
				<tr>
					<td><b>GENDER*
							<td><b>MALE<input type="radio" name="gender"
									value="male"> FEMALE<input type="radio" name="gender"
									value="female"></B></td>
				</tr>
				<tr>
					<td><b>USERNAME*</b></td>
					<td><input type="text" name="uname" required
						placeholder="USERNAME" /></td>

				</tr>
				<tr>
					<td><b>PASSWORD*</b></td>
					<td><input type="password" name="pass" required
						placeholder="PASSWORD" /></td>
				</tr>
				<tr>
					<td><b>EMAIL ID*</b></td>
					<td><input type="email" name="email" required
						placeholder="EMAIL" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="SIGN UP"></td>
				</tr>
			</table>

		</form>
		<div align="center"></div>
	</div>
</body>
</html>
