<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	MovieDao mdao = new MovieDao();
	boolean cnt = mdao.idCheck(userid);
	String str ="";
	if(cnt){
		str="NO";
		out.print(str);
	}
	else{
		str="YES";
		out.print(str);
	}
%>