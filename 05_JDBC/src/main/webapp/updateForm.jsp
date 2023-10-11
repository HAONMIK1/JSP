<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>JDBC -update - 폼페이지</h1>
<form action="updateviaForm.jsp" method="post">
<table border="1">
<tr>
	<th colspan="2">회원정보를 입력하세요</th>
</tr>
<tr>
	<th>아이디</th>
	<td> <input type="text" name="id"> </td>
</tr>
<tr>
	<th>패스워드</th>
	<td> <input type="password" name="pw"> </td>
</tr>
<tr align="center">
		<td colspan="2"> <input type="submit" value="확인">
		 <input type="reset" value="취소"> </td>
</tr>
</table>
</form>