<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%> 
Ex01_form.jsp
<form method="post" action="session1.jsp">
	아이디: <input type="text" name="id">	<br><br>
	비번: <input type="password" name="pw">	<br><br>
	<input type="submit" value="로그인">
</form>