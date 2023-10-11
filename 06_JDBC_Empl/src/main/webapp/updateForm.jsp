<%@page import="mypkg.EmplBean"%>
<%@page import="mypkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int mid = Integer.parseInt(request.getParameter("mid"));
EmplDao edao = new EmplDao();
EmplBean eb = edao.getEmplByMid(mid);
out.print(eb.getName());
out.print(eb.getDepart());
out.print(eb.getSalary());
%>

<h1>회원수정</h1>
<form action="updateProc.jsp" method="post">
	<input type="hidden" name="mid" value="<%=mid%>">
	이름 : <input type="text" name="name" value="<%=eb.getName()%>">
	<br> <br>부서번호 : <select name="depart">
		<!-- <option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option> -->
		<%
		for (int i = 1; i < 5; i++) {
			if(i==eb.getDepart())
		{%>
		<option value="<%=i%>" selected><%=i%></option>
		<% }else %>
		<option value="<%=i%>"><%=i%></option>
		<%
		}
		%>
	</select> <br> <br>급여: <input type="text" name="salary"
		value="<%=eb.getSalary()%>"> <br> <br> <input
		type="submit" value="수정하기">
</form>