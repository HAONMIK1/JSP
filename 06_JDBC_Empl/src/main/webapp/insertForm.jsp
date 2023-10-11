<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원가입</h1>
<form action="insertProc.jsp" method="post">
이름 : <input type="text" name="name">
<br><br>부서번호 :
<select name="depart">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
</select>
<br><br>급여: <input type="text" name="salary">
<br><br>
 <input type="submit" value="가입하기">
</form>