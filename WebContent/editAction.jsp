<%-- 
    Document   : Edit Action
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%
String user=request.getParameter("user");

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
<!DOCTYPE html>
<!--

-->
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
    <body><DIV ALIGN="center">
        <form method="post" name="new user" action="editDataAction.jsp">
            <h1>ENTER YOUR UPDATED DATA</h1>
            <table>
             <tr><td><b>FULLNAME*</b></td><td><input type="text" name="name" required placeholder="fullname"/></td></tr>
             <tr><td><b>AGE*</b></td><td><input type="number"  name="age" placeholder="Age" required ></td></tr>
<tr><td><b>GENDER*:</td><td> MALE</b><input type="radio" name="gender" value="male"> FEMALE<input type="radio" name="gender" value="female"></td></tr>
                
         <tr><td><b>EMAIL ID*</b></td><td><input type="text"  name="email" required placeholder="email"/></td></tr>
         <tr><td><b>HEIGHT*</b></td><td> <input type="number"  name="height" required placeholder="height"/></td></tr>
        <tr><td><b>WEIGHT*</b></td><td><input type="number"  name="weight" required placeholder="weight"/></td></tr>
        <input type="hidden" name="user" value=<%=user%>>
        <tr><td></td><td><input type="submit" value="update" ></td></tr>
            </table>
           
        </form>
        </DIV>
    </body>
</html>
