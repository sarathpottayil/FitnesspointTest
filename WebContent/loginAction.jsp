<%-- 
    Document   : Login Action
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
   
    String uname=request.getParameter("username");
    String password=request.getParameter("password");
   
   DataBean dataBean=new DataBean();
    dataBean.setUname(uname);
    dataBean.setPassword(password);
    String ro=OperationsDAO.dataCheck(dataBean);
    session=request.getSession();
    if(ro.equals("admin")){
    	session.setAttribute("uname",uname);
    	response.sendRedirect("admin.jsp");
        
    }
    else if(ro.equals("user")){
    	session.setAttribute("uname",uname);
       
        response.sendRedirect("home.jsp");
    }
    else{
      
       response.sendRedirect("index.jsp?val=INVALID USERNAME OR PASSWORD");
    }
    
   
   
    %>
    
    
