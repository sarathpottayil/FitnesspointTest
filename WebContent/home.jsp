<%-- 
    Document   : Home
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
		</div><b>
		<div><h1> WELCOME <%=userName.toUpperCase()%></h1></div>
		<form action="dataInsert.jsp" method="post" name="data" class="formclass">
			<h2 style="color:red;font-family: courier;">UPDATE YOUR PROGRESS</h2>
			HEIGHT<input type="number" name="height" placeholder="Height"
				required> <br> WEIGHT<input type="number"
				onchange="setTwoNumberDecimal" min="0" step="0.1" value="0.00"
				name="weight" placeholder="Weight" required /><br> ACTIVITY<select
				name="activity" class="selectstyle">
				<option>select your todays activity</option>
				<option>very light</option>
				<option>light</option>
				<option>Moderate</option>
				<option>Heavy</option>
				<option>Very Heavy</option>
			</select><br>
			</b>
			<input type="submit" value="UPDATE">
		</form>
		
		<div class="homepara" style=" letter-spacing: .05em;font-size: 18px">
		<p>     Fitness is very important for good health. Besides feeling better mentally, exercising can help protect you from heart disease, stroke, obesity, diabetes, and high blood pressure; and it can make you look younger, increase and maintain bone density, improve the quality of your life, and may keep you from getting sick. Exercising also helps you control stress better, and can make you feel happier and less nervous.Little by little, adding daily exercise will help you begin to feel better. Eating healthy foods is important for good health, too. Changing the kinds of food you eat means paying attention to what you eat and how much you eat. Depending on your location of employment, it may be nearly impossible to get healthy food from vending machines or in a cafeteria, so you will need to be smart and make a good food plan for yourself. It is important to eat a healthy breakfast; eat more fruits, vegetables, salads, whole-grain breads, and egg whites; and foods that are boiled or grilled – not fried. Ask your doctor or a dietician about starting a healthy, balanced diet.

		</p>
		</div>
		
		
		
</body>
</html>