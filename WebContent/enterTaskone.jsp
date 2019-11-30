<%-- 
    Document   : Edit Task
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>

<% 
session=request.getSession();

String task1=(String)session.getAttribute("task1");
String user=request.getParameter("username");
int time1=Integer.parseInt(request.getParameter("time1"));





DataBean dataBean=new DataBean();
dataBean.setUname(user);

dataBean.setTime1(time1);

dataBean.setTask1(task1);
boolean flag=OperationsDAO.insertTime1(dataBean);
if(flag){
    
	boolean flag2=OperationsDAO.insertPoints1(user,task1);
	if(flag2){
	    
	    response.sendRedirect("home.jsp?val=TODAYS TASK COMPLETED");
	}
	else{
	  
	   response.sendRedirect("error.html");
	}
}
else{
  
   response.sendRedirect("error.html");
}

//out.print(user);

%>
