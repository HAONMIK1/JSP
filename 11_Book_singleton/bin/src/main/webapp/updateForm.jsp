<%@page import="myPkg.BookDao"%>
<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp(no)
=>updateForm.jsp<br>
<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>
<%
	BookDao bdao = BookDao.getInstance();
	System.out.println("updateForm.jsp bdao:" + bdao);
%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	out.println("no:" + no);
	BookBean bb = bdao.getBookByNo(no); 
	System.out.println(bb.getBookstore()); // 교보문고 yes24 
	String[] kind={"유료","무료"};
	String[] bookstore={"교보문고","알라딘","yes24","인터파크"};
%>	
<h1>도서 정보 수정</h1>
	<form name="myform" action="updateProc.jsp" method="post">
		<input type="hidden" name="no" value="<%=no%>">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=bb.getTitle()%>"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="<%=bb.getAuthor()%>">
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="<%=bb.getPublisher()%>">
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=bb.getPrice()%>">
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="day" value="<%=bb.getDay()%>">
			</tr>

			<tr>
				<td>배송비</td>
				<%-- <td>유료 <input type="radio" name="kind" value="유료" <%if(bb.getKind().equals("유료")){%> checked <%} %>> 
					무료 <input type="radio" name="kind" value="무료" <%if(bb.getKind().equals("무료")){%> checked <%} %>>
				</td>  --%>
				<td>
					<%
						for(int i=0; i<kind.length; i++){
					%>
							<%= kind[i] %> <input type='radio' name='kind' value='<%= kind[i] %>' <%if(bb.getKind().equals(kind[i])){%> checked <%}%>>
					<%								
						} //for
					%>
				</td>
			</tr>
			<tr>
				<td>구입가능 서점</td>
				<%-- <td>교보문고 <input type="checkbox" name="bookstore" value="교보문고" <%if(bb.getBookstore().contains("교보문고")){%> checked <%} %>>
					알라딘 <input type="checkbox" name="bookstore" value="알라딘" <%if(bb.getBookstore().contains("알라딘")){%> checked <%} %>>
					yes24 <input type="checkbox" name="bookstore" value="yes24" <%if(bb.getBookstore().contains("yes24")){%> checked <%} %>>
					인터파크 <input type="checkbox" name="bookstore" value="인터파크" <%if(bb.getBookstore().contains("인터파크")){%> checked <%} %>>
				</td> --%>
				
				<td>
					<%
					for(int i=0; i<bookstore.length; i++){ 
				%>
				
					<%=bookstore[i]%><input type="checkbox" name="bookstore" value="<%=bookstore[i]%>" 
					<%if(bb.getBookstore().contains(bookstore[i])){ %>checked<%} %>>
				
				<%
					} //for
				%>
				</td>
				
			</tr>
			<tr>
				<td>보유수량</td>
				<td>
					<select name="count" id="count">
						<option value="선택">선택
						<%-- <option value="1" <%if(bb.getCount() == 1){%>selected<%} %>>1
						<option value="2" <%if(bb.getCount() == 2){%>selected<%} %>>2
						<option value="3" <%if(bb.getCount() == 3){%>selected<%} %>>3
						<option value="4" <%if(bb.getCount() == 4){%>selected<%} %>>4
						<option value="5" <%if(bb.getCount() == 5){%>selected<%} %>>5 --%>
						<%
							for(int i=1;i<=5;i++){
						%>
								<option value="<%=i %>" <%if(bb.getCount() == i){%>selected<%} %>><%=i %></option>
						<%									
							}//for
						%>
						
					</select>
				</td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="수정하기" > 
		<input type="reset"	value="취소">
	</form>
	
	
	