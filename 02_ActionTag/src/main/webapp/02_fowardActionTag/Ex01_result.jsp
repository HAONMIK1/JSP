<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
result

<%

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String age = request.getParameter("age");

%>
name: <%= name %>
pw: <%= pw %>
age: <%=age %>살


