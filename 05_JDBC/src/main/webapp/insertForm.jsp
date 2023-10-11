<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>register 테이블에 래코드 삽입 예제</h1><br>
<form action="insertProc.jsp" method="post">
아이디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pw"><br>
이름 : <input type="text" name="name"><br>
성별 : <input type="radio" name="gender" value="남">남 <input type="radio" name="gender"value="여">여<br>
e-mail : <input type="text" name="email">@ 
<select name="mail">
<option>daum.net</option>
<option>naver.naver</option>
<option>nate.com</option>
<option>goole.com</option>
<option>yahoo.net</option>
</select><br>

<input type="submit" value="보내기">

</form>
