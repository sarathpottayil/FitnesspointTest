<%-- 
    Document   : Delete Action
    Created on : Oct 30, 2019
    Author     : ajai
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
String user=request.getParameter("user");
DataBean dataBean=new DataBean();
dataBean.setUname(user);
boolean flag=OperationsDAO.del(dataBean);

if(flag){
    
    response.sendRedirect("logout.jsp?str='logged out succesfully..!!!'");
}
else{
  
   response.sendRedirect("error.html");
}

%>