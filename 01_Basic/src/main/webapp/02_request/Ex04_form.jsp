<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <form method="post" action="Ex04_result.jsp">
이름: <input type="text" name="name"> <br>
비번: <input type="password" name="pw"><br>

[과일선택] <br>
<input type="checkbox" name="fruit" value="포도">포도 <br>
<input type="checkbox" name="fruit" value="수박">수박 <br>
<input type="checkbox" name="fruit" value="오렌지">오렌지 <br>
<input type="checkbox" name="fruit" value="사과">사과
 <br>
 취미:
   <select name='hobby' multiple="multiple" size="3">
	 <option value="JAVA">java공부
	 <option value="HTML">HTML공부
	 <option value="JSP">JSP공부
	</select>
<input type="submit" value="확인">
 
    </form>
