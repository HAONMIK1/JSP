<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex02_form.jsp
<br>
<form method="post" action="Ex02_result.jsp">
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr"></td>
		</tr>
		<tr>
			<td><input type="submit" value="전송"></td>
			<td><input type="reset" value="취소" ></td>
		</tr>

	</table>
</form>