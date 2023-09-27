<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
ID:
<%=request.getParameter("id") %><br>
PW:
<%=request.getParameter("pw") %><br>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	session.setAttribute("id", id);	
	session.setAttribute("pw", pw);	
%>

<form method="post" action="session2.jsp">
<%-- 	아이디: <input type="text" name="id" value="<%=id %>"> <br> <br>
	비번: <input type="password" name="pw" value="<%=pw %>"> <br> --%>
	<br> 가장 좋아하는 스포츠를 선택하세요<br> 
		<input type="radio" name="sports"value="MMA">MMA 
		<input type="radio" name="sports" value="테니스">테니스
		<input type="radio" name="sports" value="펜싱">펜싱 
		<inputtype="radio" name="sports" value="탁구">탁구 
		<input type="radio"name="sports" value="클라이밍">클라이밍
		<br> 가장 좋아하는 게임 선택하세요. 
		<select name="game">
		<option value="배틀그라운드">배틀그라운드</option>
		<option value="롤">롤</option>
		<option value="메플">메플</option>
		<option value="로아">로아</option>
	</select> <input type="submit" value="전송">
</form>
