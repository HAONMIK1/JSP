<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>
via

name: <%=name%>
color: <%=color%>

<jsp:forward page="<%=color+\".jsp\"%>"/>

forward 액션태그 최종페이지의 주소는 거쳐가는 페이지(=>via.jsp)
request 최종 페이지의 주소가 곧 최종페이지이다
