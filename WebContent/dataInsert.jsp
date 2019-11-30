<%-- 
    Document   : Data Insert
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>



<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>

<% 
session=request.getSession();

String user=(String)session.getAttribute("uname");
int height=Integer.parseInt(request.getParameter("height"));
float weight=Float.parseFloat(request.getParameter("weight"));

String activity=request.getParameter("activity");


DataBean dataBean=new DataBean();
dataBean.setUname(user);

dataBean.setHeight(height);
dataBean.setWeight(weight);

dataBean.setActivity(activity);
boolean flag=OperationsDAO.insertUserData(dataBean);
if(flag){
    
    response.sendRedirect("home.jsp?val=DETAILS UPDATED");
}
else{
  
   response.sendRedirect("home.jsp?val=UPDATION FAILED");
}

//out.print(user);

%>
