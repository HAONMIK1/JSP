<%@page import="myPkg.BookDao"%>
<%@page import="myPkg.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    	table{
    		text-align: center;
    		width: 80%;
    		margin: auto;
    		margin-top: 50px;
    		border-spacing: 0px;
    	}
    	
    	table th {
    		background: pink;
    	}
    
    </style>
<script type="text/javascript">
	function insert(){
		location.href='insertForm.jsp';
	}
	function allCheck(obj){ // 
		var chkobj = document.getElementsByName("rowcheck");
	
		var check = obj.checked; // true, false
		//alert("check:" + check);
		if(check){ // 때
			for(var i=0;i<chkobj.length;i++){
				chkobj[i].checked = true;
			}
		}else{ // 때
			for(var i=0;i<chkobj.length;i++){
				chkobj[i].checked = false;
			}
		}
	}// allCheck
	
	function selectDelete(){ 
		//alert(2);
		var flag = false;
		var chkobj = document.getElementsByName("rowcheck");
		for(i=0;i<chkobj.length;i++){
			if(chkobj[i].checked){
				flag = true;
			}
		}
		if(!flag){
			alert('삭제할 체크박스 하나라도 선택하세요');
			return;// 왜쓰나?
		}
		
		document.myForm.submit();
		
	}//selectDelete
	
</script>    
list.jsp<br>
<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>

<%
	BookDao bdao = BookDao.getInstance(); 
	/* myPkg.BookDao bdao = new myPkg.BookDao(); */ 
	System.out.println("list.jsp bdao:" + bdao);
%>    
<% 
	ArrayList<BookBean> lists = bdao.getAllBooks();
%> 
<form name="myForm" action="deleteAll.jsp">
<input type="button" value="삭제" onClick="selectDelete()">
<!-- <input type="button" value="추가" onClick="location.href='insertForm.jsp'"> -->
<input type="button" value="추가" onClick="insert()">

<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" onClick="allCheck(this)"></th> 
		<!-- this가 되는겁니다. -->
		<th>번호</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>가격</th>
		<th>입고일</th>
		<th>배송비</th>
		<th>구입 가능 서점</th>
		<th>보유수량</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i=0; i<lists.size(); i++){
			BookBean bb = lists.get(i);
	%>
		<tr align="center">
			<td><input type="checkbox" name="rowcheck" value="<%=bb.getNo()%>"></td><!-- rowcheck=4 8 -->
			<td><%=bb.getNo()%></td>
			<td><%=bb.getTitle()%></td>
			<td><%=bb.getAuthor()%></td>
			<td><%=bb.getPublisher()%></td>
			<td><%=bb.getPrice()%></td>
			<td><%=bb.getDay()%></td>
			<td><%=bb.getKind()%></td>
			<td><%=bb.getBookstore()%></td>
			<td><%=bb.getCount()%></td>
			<td>
				<a href="updateForm.jsp?no=<%=bb.getNo()%>">수정</a>
			</td>
			<td>
				<a href="deleteProc.jsp?no=<%=bb.getNo()%>">삭제</a>
			</td>
		</tr>
	<%} %> <!-- for -->
	
</table>
</form>
<br><br>
<a href="insertForm.jsp">삽입</a>





