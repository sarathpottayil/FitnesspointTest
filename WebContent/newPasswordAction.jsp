<%-- 
    Document   : New Password Action
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
String newpassword=request.getParameter("newpassword");
String username=request.getParameter("username");
DataBean dataBean=new DataBean();
dataBean.setPassword(newpassword);
dataBean.setUname(username);
boolean flag=OperationsDAO.newPassword(dataBean);

if(flag){
    
    response.sendRedirect("index.jsp?val=LOGIN WITH YOUR NEW PASSWORD");
}
else{
  
   out.println("error.!!!!!!!");
}

%>



