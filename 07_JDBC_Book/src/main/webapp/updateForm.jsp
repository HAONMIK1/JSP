<%@page import="mypkg.BookDao"%>
<%@page import="mypkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm
<br>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BookDao dao = new BookDao();
	BookBean bb= dao.getselect(no);
%>
<%=bb.getAuthor() %>
<%=bb.getBookstore()%>
<%=bb.getDay() %>
<%=bb.getPrice() %>
insertForm.jsp <br>
<h1>도서 정보 입력</h1>
	<form name="myform" action="updateProc.jsp" method="post">
	<input type="hidden" name="no" value="<%=no%>">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value=<%=bb.getTitle() %>></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="<%=bb.getAuthor() %>">
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="<%=bb.getPublisher() %>">
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=bb.getPrice() %>">
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="day" value="<%=bb.getDay() %>">
			</tr>

			<tr>
				<td>배송비</td>
				<td>
					<% String[] kind ={"유료","무료"};
					for(int i=0;i<kind.length;i++){
					%>
					<%=kind[i]%> <input type="radio" name="kind" value="<%=kind[i]%>"<%if(bb.getKind().equals(kind[i])){ %> checked<%}%> >
					<%} %> 
					<%-- 유료 <input  type="radio" name="kind" value="유료"<%if(bb.getKind().equals("유료")){ %> checked<%} %>> 
					무료 <input type="radio" name="kind" value="무료"<%if(bb.getKind().equals("유료")){ %> checked<%}%> > --%>
				
			</tr>
			<tr>
				<td>구입가능 서점</td>
				<td>
					<% String[] bookstore ={"교보문고","알라딘","yes24","인터파크"};
					for(int i=0;i<bookstore.length;i++){
					%>
				<%=bookstore[i]%> <input type="checkbox"  name="bookstore" value="<%=bookstore[i]%>" <%if(bb.getBookstore().contains(bookstore[i])){ %> checked<%} %>>
				<%} %>
				</tr>
			<%-- 	
				교보문고 <input type="checkbox"  name="bookstore" value="교보문고" <%if(bb.getBookstore().contains("교보문고")){ %> checked<%} %>>
				알라딘 <input type="checkbox" name="bookstore" value="알라딘" <%if(bb.getBookstore().contains("알라딘")){ %> checked<%} %>>
				yes24 <input type="checkbox" name="bookstore" value="yes24" <%if(bb.getBookstore().contains("yes24")){ %> checked<%} %>>
				인터파크 <input type="checkbox" name="bookstore" value="인터파크" <%if(bb.getBookstore().contains("인터파크")){ %> checked<%} %>>
				 --%>	
					<%-- String[] bookstore = bb.getBookstore().split(" ");
				
					for(int i=0;i<bookstore.length;i++){
					if(bookstore[i].equals("교보문고")){ %>
					교보문고 <input type="checkbox"  name="bookstore" value="교보문고" checked>
					<% }else{%>
					교보문고 <input type="checkbox"  name="bookstore" value="교보문고" >
					<%}if(bookstore[i].equals("알라딘")){ %>
					알라딘 <input type="checkbox" name="bookstore" value="알라딘" checked>
					<%}else{%>
					알라딘 <input type="checkbox" name="bookstore" value="알라딘" >
					<%}if(bookstore[i].equals("yes24")){ %>
					yes24 <input type="checkbox" name="bookstore" value="yes24" checked>
					<%}else{%>
					yes24 <input type="checkbox" name="bookstore" value="yes24" >
					<%}if(bookstore[i].equals("인터파크")){ %>
					인터파크 <input type="checkbox" name="bookstore" value="인터파크" checked>
					<%}else{%>
					인터파크 <input type="checkbox" name="bookstore" value="인터파크" ><%} }%> --%>
			
			<tr>
				<td>보유수량</td>
				<td><select name="count" id="count">
						<option value="선택">선택
						<%
						for(int i=1 ;i<6;i++){
						%>
						<option value="<%=i %>" <%if(bb.getCount()==i){%>selected<%}%>><%=i %>
				<%} %>
				</select></td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="수정하기" > 
		<input type="reset"	value="취소">
	</form>