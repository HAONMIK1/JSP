<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
MovieDao mdao = new MovieDao();
int cnt = mdao.delete(num);
if (cnt == 1) {
%>
<script type="text/javascript">
	alert("삭제완료");
	location.href = "list.jsp";
</script>
<%
} else {
	%>
	<script type="text/javascript">
		alert("삭제실패");
		location.href = "list.jsp";
	</script>
	<%

}
%>
