<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp<br>

<form method="post" action="Ex01_result.jsp">
	
	이름 : <input type="text" name="name" id="irum" value="park"> <br><br>
	나이 : <input type="text" name="age" id="nai"> <br><br>
	
	<input type="submit" value="확인">
	<input type="reset" value="취소">
</form>
<!-- 
submit 클릭하면 action으로 넘어가 달라고 요청

name=kim irum=kim(X)
age=20 nai=20(X)
name속성에 value가 들어간다.
 -->