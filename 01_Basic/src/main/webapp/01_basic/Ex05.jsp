<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String str = "";	
	int num = 9;
	if(num>10){
		out.print("10보다 크다");
	}else if(num<10){
		out.print("10보다 작다");
	}else{
		out.print("10과 같다");
	}
	%>
