<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01 include
<% request.setCharacterEncoding("UTF-8"); %>
<% 
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
%>

name: <%=name%>
pw: <%=pw%>
<jsp:forward page="Ex01_result.jsp">
	<jsp:param value="30" name="age"/>
</jsp:forward>