<%@page import="mypkg.BookDao"%>
<%@page import="mypkg.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
th {
	background-color: blue;
}
</style>
<script type="text/javascript">
	function insert(){
	location.href='insertForm.jsp';
	}
	function allcheck(obj) {
		var chkobj = document.getElementsByName("rowcheck");

		var check = obj.checked;
		//alert(check);
		if (check == true) {
			for (var i = 0; i < chkobj.length; i++) {
				chkobj[i].checked = true;
			}
		} else {
			for (var i = 0; i < chkobj.length; i++) {
				chkobj[i].checked = false;
			}
		}
	}
	function selectDelete() {
		var chkobj = doucument.getElementsByName("rowcheck");
		flag = false;
		for (var i = 0; i < chkobj.length; i++) {
			if (chkobj[i].checked == true)
				flag = true;
		}
		if(!flag){
			alert("삭제할 체크 선택하세요");
		}
		document.myform.submit();
	}
</script>
list.jsp
<br>
<%
BookDao dao = new BookDao();
ArrayList<BookBean> lists = dao.bookselect();
%>
<form action="deleteAll.jsp" name="myform">
<input type="button" value="삭제" onclick="selectDelete()">
<input type="button" value="추가" onclick="insert()">
<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" onclick="allcheck(this)"></th>
		<th>번호</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>가격</th>
		<th>입고일</th>
		<th>배송비</th>
		<th>구입 가능 서점</th>
		<th>보유 수량</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
	for (int i = 0; i < lists.size(); i++) {
		BookBean bb = lists.get(i);
	%><tr>
		<td><input type="checkbox" name="rowcheck" value="<%=bb.getNo()%>"></td>
		<td><%=bb.getNo()%></td>
		<td><%=bb.getTitle()%></td>
		<td><%=bb.getAuthor()%></td>
		<td><%=bb.getPublisher()%></td>
		<td><%=bb.getPrice()%></td>
		<td><%=bb.getDay()%></td>
		<td><%=bb.getKind()%></td>
		<td><%=bb.getBookstore()%></td>
		<td><%=bb.getCount()%></td>
		<td><a href="updateForm.jsp?no=<%=bb.getNo()%>">수정</a></td>
		<td><a href="deleteProc.jsp?no=<%=bb.getNo()%>">삭제</a></td>
		</td>
	</tr>
	<%
	}
	%>
</table>
</form>
<a href="insertForm.jsp">삽입</a>