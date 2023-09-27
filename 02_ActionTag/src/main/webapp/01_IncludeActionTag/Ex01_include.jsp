<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01 include

<% 
	String age = request.getParameter("age");
	String addr = request.getParameter("address");
	String name = request.getParameter("name");
%>

age: <%=age%>
addr: <%=addr%>
name: <%=name%>