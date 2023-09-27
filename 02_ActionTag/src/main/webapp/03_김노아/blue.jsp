<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
	request.setCharacterEncoding("UTF-8");
%>
result<br>

<%

	String name = request.getParameter("name");


%>
이름: <%= name %><br>
<img src="../images/blue.jpg">