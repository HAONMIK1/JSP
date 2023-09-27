<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result2.jsp<br>
가입성공
<%
	String msg = request.getParameter("msg");
	out.println("msg:" + msg);
	System.out.println("msg"+ msg);
	
%>
<br>
msg2 : <%=msg  %>

