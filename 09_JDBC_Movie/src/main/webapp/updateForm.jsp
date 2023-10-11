<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	MovieDao mdao = new MovieDao();
	MovieBean mb = mdao.selectNum(num);
%>
<h1>수정</h1>
<form action="updateProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<%=mb.getId()%>"> 
				</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="<%=mb.getAge()%>"></td>
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td><input type="checkbox" name="genre">공포 
			<input type="checkbox" name="genre">다큐 
			<input type="checkbox" name="genre">액션 
			<input type="checkbox" name="genre">애니메이션
			</td>
		</tr>
		<tr>
			<td>즐겨보는 시간대</td>
			<td><select name="time">
					<option value="08-10" <%if(mb.getTime()=="08-10") {%>selected<%}%>>08-10</option>
					<option value="10-12" <%if(mb.getTime()=="10-12") {%>selected<%}%>>10-12</option>
					<option value="12-14" <%if(mb.getTime()=="12-14") {%>selected<%}%>>12-14</option>
					<option value="14-16" <%if(mb.getTime()=="14-16") {%>selected<%}%>>14-16</option>
					<option value="16-18" <%if(mb.getTime()=="16-18") {%>selected<%}%>>16-18</option>
					<option value="18-20" <%if(mb.getTime()=="18-20") {%>selected<%}%>>18-20</option>
			</select></td>
		<tr>
			<td>동반 관객수</td>
			<td><input type="radio" name="partner" value="1"  <%if(mb.getPartner() == 1) {%>checked<%}%>>1 <input
				type="radio" name="partner" value="2" <%if(mb.getPartner() == 2) {%>checked<%}%>>2 <input type="radio"
				name="partner" value="3" <%if(mb.getPartner() == 3) {%>checked<%}%>>3 <input type="radio"
				name="partner" value="4" <%if(mb.getPartner() == 4) {%>checked<%}%>>4 <input type="radio"
				name="partner" value="5" <%if(mb.getPartner() == 5) {%>checked<%}%>>5</td>
		</tr>
		<tr>
			<td>영화관 개선사항</td>
			<td><input type="text" value="<%=mb.getMemo()%>"></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="수정하기" id="sub">
			</td>
		</tr>
	</table>
</form>
