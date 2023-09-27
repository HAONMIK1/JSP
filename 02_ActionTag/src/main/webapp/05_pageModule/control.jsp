<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String device= request.getParameter("device");

%>
 <!-- xml 문법 여기 중간에 주석달기 안돼 -->
<jsp:forward page="template.jsp">
	<jsp:param value="<%=device%>" name="device"/>
</jsp:forward>