<%-- 
    Document   : newUserAddAction
    Created on : Nov 5, 2019
    Author     : Fitness Point
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
   
    String uname=request.getParameter("uname");
    String password=request.getParameter("pass");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    int age=Integer.parseInt(request.getParameter("age"));
    String gender=request.getParameter("gender");
    
    DataBean dataBean=new DataBean();
    dataBean.setUname(uname);
    dataBean.setPassword(password);
    dataBean.setName(name);
    dataBean.setEmail(email);
    dataBean.setAge(age);
    dataBean.setGender(gender);
    
    boolean flag=OperationsDAO.insertUser(dataBean);
    if(flag){
        
        response.sendRedirect("index.jsp?val=LOGIN HERE");
    }
    else{
    	
      out.print("user exist enter a different username");
       response.sendRedirect("newUser.jsp?val=Username already exist..!!!!");
    }
    
   
   
    %>
    
    
