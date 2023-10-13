<%@page import="board.EmplDao"%>
<%@page import="board.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateProc.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");
int mid = Integer.parseInt(request.getParameter("mid"));
String name = request.getParameter("name");
int depart = Integer.parseInt(request.getParameter("depart"));
int salary = Integer.parseInt(request.getParameter("salary"));

EmplBean eb = new EmplBean();

eb.setMid(mid);
eb.setName(name);
eb.setDepart(depart);
eb.setSalary(salary);

String msg;
String url;

EmplDao edao = new EmplDao();

int cnt = edao.updateData(eb);
if (cnt != -1) {
	msg = "수정성공";
	url = "list.jsp";
} else {
	msg = "수정 실패";
	url = "updateForm.jsp";
}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>?mid=<%=mid%>";
</script>
