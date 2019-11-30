<%-- 
    Document   : Enter Feedback
    Created on : Nov 05, 2019
    Author     : Fitness Point
--%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>




<%  
   
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String user=request.getParameter("user");
    int age=Integer.parseInt(request.getParameter("age"));
    String gender=request.getParameter("gender");
    int height=Integer.parseInt(request.getParameter("height"));
    int weight=Integer.parseInt(request.getParameter("weight"));
    
    DataBean dataBean=new DataBean();
    dataBean.setUname(user);
    dataBean.setHeight(height);
    dataBean.setWeight(weight);
    dataBean.setName(name);
    dataBean.setEmail(email);
    dataBean.setAge(age);
    dataBean.setGender(gender);
    boolean flag=OperationsDAO.updateUserData(dataBean);
    if(flag){
        
        response.sendRedirect("success.html");
    }
    else{
      
       response.sendRedirect("error.html");
    }


    %>

