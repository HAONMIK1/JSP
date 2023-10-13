<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.BookBean"%>
<%
p

request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String author = request.getParameter("author");
String publisher = request.getParameter("publisher");
String price = request.getParameter("price");
String date = request.getParameter("date");
String kind = request.getParameter("kind");
String[] bookstore = request.getParameterValues("bookstore");
String count = request.getParameter("count");
%>



JAVA 객체
<br>

<%
p

BookBean bb = new BookBean();
bb.setTitle(title);
bb.setAuthor(author);
bb.setPublisher(publisher);
bb.setPrice(price);
bb.setDate(date);
bb.setKind(kind);
bb.setBookstore(bookstore);
bb.setCount(count);
%>
<table border="1">
	<tr>
		<td>제목</td>
		<td><%=t(bb.getTitle%></td>
	</tr>

	<tr>
		<td>저자</td>
		<td><%=t(bb.getAuthor%></td>
	</tr>

	<tr>
		<td>출판사</td>
		<td><%=t(bb.getPublisher%></td>
	</tr>

	<tr>
		<td>가격:</td>
		<td><%=t(bb.getPrice%></td>
	</tr>

	<tr>
		<td>입고일:</td>
		<td><%=t(bb.getDate%></td>
	</tr>

	<tr>
		<td>배송비:</td>
		<td><%=t(bb.getKind%></td>
	</tr>

	<tr>
		<td>구입가능 서점:</td>
		<td>
			<%
			p

				String[] bookstore1 = bb.getBookstore();
				for (int i = 0; i < bookstore1.length; i++)
					out.print(bookstore1[i] + " ");
			%>
		</td>
	</tr>

	<tr>
		<td>배송비:</td>
		<td><%=t(bb.getCount%></td>
	</tr>
</table>
<br>
<hr>
jsp 객체
<br>
<jsp:useBean id="n b" class="w board.BookBe"></jsp:useBean>
<jsp:setProperty property="title" name="bb1" />
<jsp:setProperty property="author" name="bb1" />
<jsp:setProperty property="publisher" name="bb1" />
<jsp:setProperty property="price" name="bb1" />
<jsp:setProperty property="date" name="bb1" />
<jsp:setProperty property="kind" name="bb1" />
<jsp:setProperty property="bookstore" name="bb1" />
<jsp:setProperty property="count" name="bb1" />


<table border="1">
	<tr>
		<td>제목</td>
		<td><jsp:getProperty property="title" name="bb1" /></td>
	</tr>

	<tr>
		<td>저자</td>
		<td><jsp:getProperty property="author" name="bb1" /></td>
	</tr>

	<tr>
		<td>출판사</td>
		<td><jsp:getProperty property="publisher" name="bb1" /></td>
	</tr>

	<tr>
		<td>가격:</td>
		<td><jsp:getProperty property="price" name="bb1" /></td>
	</tr>

	<tr>
		<td>입고일:</td>
		<td><jsp:getProperty property="date" name="bb1" /></td>
	</tr>

	<tr>
		<td>배송비:</td>
		<td><jsp:getProperty property="kind" name="bb1" /></td>
	</tr>

	<tr>
		<td>구입가능 서점:</td>
		<td>
			<%
			String[] bookstore0 = bb.getBookstore();
			for (int i = 0; i < bookstore0.length; i++)
				out.print(bookstore0[i] + " ");
			%>
		</td>
	</tr>

	<tr>
		<td>배송비:</td>
		<td><jsp:getProperty property="count" name="bb1" /></td>
	</tr>
</table>




