<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=11;
	switch(num%2){
	case 0: out.print("짝수"); break;
	case 1: out.print("홀수"); break;
	
	}
%>