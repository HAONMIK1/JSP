<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
result<br>

<% 
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>

name: <%=name%>
color: <%=color%> <br>

<img src="../images/green.jpg">