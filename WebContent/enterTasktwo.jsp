<%-- 
    Document   : Enter Task
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>

<% 
session=request.getSession();

String task2=(String)session.getAttribute("task2");
String task1=(String)session.getAttribute("task1");


String user=request.getParameter("username");
int time1=Integer.parseInt(request.getParameter("time1"));
int time2=Integer.parseInt(request.getParameter("time2"));
//String task2=request.getParameter("task2");


DataBean dataBean=new DataBean();
dataBean.setUname(user);
dataBean.setTime1(time1);
dataBean.setTime2(time2);
dataBean.setTask1(task1);
dataBean.setTask2(task2);

boolean flag=OperationsDAO.insertTime2(dataBean);
if(flag){
    
	boolean flag2=OperationsDAO.insertPoints(user,task1,task2);
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
