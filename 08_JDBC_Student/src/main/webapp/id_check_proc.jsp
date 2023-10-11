<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="myPkg.StudentDao"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String userid =request.getParameter("userid");
	
	boolean ischeck = sdao.searchID(userid); 
	String str="";
	if(ischeck){
		str= "NO";
		out.print(str);
	}else{
		str="YES";
		out.print(str);
	}
%>            
