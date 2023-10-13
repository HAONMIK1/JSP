<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	%>
	<jsp:useBean id="dao" class="board.BookDao"/>
	
	<% 
	int no = Integer.parseInt(request.getParameter("no"));
	int cnt = dao.deletetebook(no);
	String msg;
	String url;
	if(cnt!=-1){
		msg="삭제성공";
	}else{
		msg="삭제 실패";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="list.jsp";
</script>
