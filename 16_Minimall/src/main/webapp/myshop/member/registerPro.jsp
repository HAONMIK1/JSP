<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
	MemberDAO mdao = MemberDAO.getInstance();
	int cnt =mdao.insertMember(mdto);
	
	if(cnt==1){
		response.sendRedirect("../../main.jsp");
	}else{
		response.sendRedirect("register.jsp");
	}

%>
