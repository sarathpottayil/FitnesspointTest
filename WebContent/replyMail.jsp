<%@page import="com.dao.*" %>
<%@page import="com.bean.*" %>
<% 
String user=request.getParameter("sl");
String from="fitnesspointproject@gmail.com";
String mailpass="9751557598";
DataBean db=new DataBean();
db.setUname(user);
String to=OperationsDAO.getMail(db);
String msg="THANK YOU FOR YOUR VALUABLE FEEDBACK..!!";
String sub="REPLy FROM FITNESS FEEDBACK";
Emailer.send(from, mailpass, to, sub, msg);
response.sendRedirect("admin.jsp?val=REPLY SEND..!!!");

%>