<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid =request.getParameter("userid");
	
	MemberDAO mdao =MemberDAO.getInstance();
	boolean ischeck = mdao.searchID(userid); 
	String str="";
	if(ischeck){
		str= "NO";
		out.print(str);
	}else{
		str="YES";
		out.print(str);
	}
%>            
