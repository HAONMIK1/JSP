<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="Ex03_result.jsp">
<h1>Resquest 내장 객체 예제 1</h1>
이름: <input type="text" name='name'>
<br>
나이: <input type="text" name='age'>
<br>
성별: 남자<input type="radio" name='gender' value="m">
	 여자<input type="radio" name='gender' value="f">
<br>
<br>
취미: <select name='hobby'>
	 <option value="JAVA">java공부
	 <option value="HTML">HTML공부
	 <option value="JSP">JSP공부
	</select>
<br>
<br>
색선택: <select name='color'>
	 <option>바탕색
	 <option value="blue">파랑색
	 <option value="yellow">노란색
	</select>
<br>
<br>
<input type="submit" value="보내기" >
</form>