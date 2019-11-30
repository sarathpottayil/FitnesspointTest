<%-- 
    Document   : EnterFeedBack
    Created on : Nov 5, 2019
    Author     : Fitness Point
--%>


<%@page import="java.sql.*" %>
<%@page import="com.dao.OperationsDAO" %>
<%@page import="com.bean.DataBean" %>
<%@page import="java.util.Date.*" %>
<% 
String user=request.getParameter("user");

String date=request.getParameter("date");
Date da=Date.valueOf(date);
String comment=request.getParameter("comment");


DataBean dataBean=new DataBean();
dataBean.setDa(da);
dataBean.setUname(user);
dataBean.setComment(comment);

boolean flag=OperationsDAO.insertFeedback(dataBean);
if(flag){
    
    response.sendRedirect("feedBack.jsp?val=FEEDBACK ADDED...!!!!");
}
else{
  
   response.sendRedirect("error.html");
}


%>
