<%-- 
    Document   : DeleteFeedBackAction
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
String ecomment=request.getParameter("comment");
DataBean dataBean=new DataBean();
dataBean.setComment(ecomment);
dataBean.setSl(Integer.parseInt(request.getParameter("id")));
boolean flag=OperationsDAO.editFeedback(dataBean);
if(flag){
    
    response.sendRedirect("feedBack.jsp?val='feedback edited..!!'");
}
else{
  
   response.sendRedirect("error.html");
}
%>