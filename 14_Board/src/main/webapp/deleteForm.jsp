<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> 글삭제 </h1>
<form>
<table>
	<tr>
		<th>비밀번호를 입력해 주세요</th>
	</tr>
	<tr>
		<td>
		 비밀번호 : <input type="password" name="passwd" >
		</td>
	</tr>
	<tr>
		<td>
		<input type="button" value="글 삭제" onclick="location.href='deleteProc.jsp'">
		<input type="button" value="글 목록" onclick="location.href='list.jsp'"> 
		</td>
	</tr>
</table>
</form>