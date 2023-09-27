<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_form.jsp
<form method="post" action="Ex03_result.jsp">
학번: <input type="text" name="hakbun"><br>
이름: <input type="text" name="name"><br>
좋아하는 노래: 
<input type="radio" name="sing" value="좋은날">좋은날
<input type="radio" name="sing" value="광화문에서">광화문에서
<input type="radio" name="sing" value="잊지말기로해">잊지말기로해
<input type="radio" name="sing" value="너랑나">너랑나<br>
좋아하는 걸그룹: 
<select name="girl">
	<option value="트와이스">트와이스</option>
	<option value="있지">있지</option>
	<option value="르세라핌">르세라핌</option>
	<option value="뉴진스">뉴진스</option>
</select>
<input type="submit" value="입력완료">
</form>