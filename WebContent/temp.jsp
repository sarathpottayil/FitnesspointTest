<%-- 
    Document   : BMI
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>

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
<%
session=request.getSession();

String user=(String)session.getAttribute("uname");


ArrayList<DataBean> eb=OperationsDAO.bmiCalculator(user);
 		int size=0;
 		size=eb.size();
      if(size!=0){
    	  for(DataBean it:eb){
    		  
    		  %>
    		  
    		<html>
    		<head>

    		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    		<title>Home</title>
    		<link rel="stylesheet" type="text/css" href="style.css">


    		</head>
    		<body class="homebackground">
    			<div >
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
    					
    				</div>
    		  <div align="center"
    							style="color: red; background-color: #0000cd52;font-weight: bold; font-size: 20px; padding-top: 20px; font-family: courier">
    							
    						YOUR BMI::<input type="text" value="<%=it.getBmi()%>" readonly="true">
    						</div>
    		  
    		  <div    style=" padding-left: 304px;">
    		  <img src="images/bmi.png">
    		  </div>
    		  </div>
    		  
    	<%	 
    	  }
      }
      
%>