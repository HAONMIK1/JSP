<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 웹어플리케이션의 정보를 저장하고 있는 내장 객체
웹 어플리케이션당 1개가 생선 -->
Ex02_application.jsp<br>

<%
String conPath = application.getContextPath();
String path=application.getRealPath("/");
%>
conPath : <%= conPath%>
path : <%= path%>
