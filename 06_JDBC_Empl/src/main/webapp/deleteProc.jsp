<%@page import="board.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int mid =Integer.parseInt(request.getParameter("mid"));
	EmplDao dao = new EmplDao();
	int cnt = dao.deleteData(mid);
	String msg;
	if(cnt==1){
		msg="삭제 성공";
	}else{
		msg="삭제 실패";
	}	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="list.jsp";
</script>