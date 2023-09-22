<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
String color = request.getParameter("color");

if (gender.equals("m")) {
	gender = "남자";
} else
	gender = "여자";
%>
<h1>RESULT</h1>

이름:<%=name%><br>
나이:<%=age%><br>
성별:<%=gender%><br>
취미:<%=hobby%><br>
색선택:<%=color%><br>

<img src="../images/<%=color%>.jpg"></img>



