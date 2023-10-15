<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MovieDao dao = new MovieDao();
	ArrayList<MovieBean>lists = dao.list();
%>
<script type="text/javascript" src="js/jquery.js"></script>    
<script type="text/javascript">
function selectDelete() {
	flag = false;
	rcheck = document.getElementsByName("rowcheck");
	for(var i=0;i<rcheck.length;i++){
		if(rcheck[i].checked){
			flag = true;
		}
	}
	if(!flag){
		alert('하나라도 선택하세요');
		return; // 
	}
	
	document.myform.submit(); // 
}
function allDelete(obj) {
	check = obj.checked;
	//alert(check);
	
	rcheck = document.getElementsByName("rowcheck");
	//alert('rcheck.length:' + rcheck.length);
	
	if(check){ // 
		for(var i=0;i<rcheck.length;i++){
			rcheck[i].checked=true;
		}
	}else{
		for(var i=0;i<rcheck.length;i++){
			rcheck[i].checked=false;
		}
	}
}
</script>
<form name="myform" action="deleteAll.jsp">
	<input type="button" value="삭제" onclick="selectDelete()"> 
	<input type="button" value="추가" onClick="location.href='insertForm.jsp'">
	<table border="1">
		<tr>
			<th><input type="checkbox" name="allcheck" onclick="allDelete(this)"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>좋아하는 장르</th>
			<th>즐겨보는 시간대</th>
			<th>동반관객수</th>
			<th>개선사항</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
	for(int i=0; i<lists.size();i++) {
		MovieBean mb = lists.get(i);
	%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=mb.getNum()%>"></td>
			<td><%=mb.getNum() %></td>
			<td><%=mb.getId() %></td>
			<td><%=mb.getName() %></td>
			<td><%=mb.getAge() %></td>
			<td><%=mb.getGenre() %></td>
			<td><%=mb.getTime() %></td>
			<td><%=mb.getPartner() %></td>
			<td><%=mb.getMemo() %></td>

			<td><a href="updateForm.jsp?num=<%=mb.getNum() %>">수정</a></td>

			<td><a href="delete.jsp?num=<%=mb.getNum() %>">삭제</a></td>
		</tr>
		<%} %>
	</table>
</form>