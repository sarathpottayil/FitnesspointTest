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
int sl=Integer.parseInt(request.getParameter("sl"));
DataBean dataBean=new DataBean();
dataBean.setSl(sl);
boolean flag=OperationsDAO.delFeedback(dataBean);
if(flag){
    
    response.sendRedirect("feedBackView.jsp");
}
else{
  
   response.sendRedirect("error.html");
}
%>