<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="Ex05_result.jsp" method="post">
이름: <input type="text" name="name"><br>
비번: <input type="password" name="pw"><br>
과목점수 <br>
<%
	String[] subject = {"국어","영어","수학","음악"};
	for(int i=0; i<subject.length;i++){
%>
<%= subject[i] %>: <input type="text" name="jumsu" value="10"><br>
<%} %>
좋아하는 그룹: <br>
<select name="group" multiple="multiple">
	<option value="블랙핑크">블랙핑크</option>
	<option value="트와이스">트와이스</option>
	<option value="에스파">에스파</option>
	<option value="르세라핌">르세라핌</option>
	<option value="뉴진스">뉴진스</option>
	<option value="아이브">아이브</option>
</select>
<input type="submit" value="전송">
<input type="reset" value="취소">
</form>