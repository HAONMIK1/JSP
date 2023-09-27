<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>member 테이블에 레코드 삽입</h2>

<form action="insertProc.jsp" method="post">
	아이디: <input type="text" name="id"><br>
	패스워드: <input type="text" name="pw"><br>
	이름: <input type="text" name="name"><br>
<input type="submit" value="전송"> 
</form>