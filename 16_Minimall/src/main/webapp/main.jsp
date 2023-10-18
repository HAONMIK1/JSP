<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
main.jsp<%=request.getContextPath()%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" type="text/css">
<style type="text/css" >

td:first-child {
	background-color: yellow;
}
</style>
<br>
[로그인 화면]
<form method="post" action="loginPro.jsp">
	<table border="1" width="350" height="200">
		<tr>
			<td align="center">아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td align="center">비번</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
			<input type="submit" value="로그인" >
			<input type="button" value="회원가입" onclick="location.href='myshop/member/register.jsp'">
			<input type="button" value="아이디 찾기" onclick="location.href='findid.jsp'">
			<input type="button" value="비번 찾기" onclick="location.href='findpassword.jsp'">
			</td>
		</tr>
	</table>

</form>