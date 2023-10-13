<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
글내용 보기
<%
	request.setCharacterEncoding("UTF-8");

	int num =Integer.parseInt(request.getParameter("num"));
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb= bdao.SelectNum(num);
	
%>
<h1>글내용보기</h1>
<table border="1">
	<tr>
		<td>글번호</td>
		<td><%=bb.getNum() %></td>
		<td>조회수</td>
		<td><%= bb.getReadcount() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=bb.getWriter() %></td>
		<td>작성일</td>
		<td><%=bb.getReg_date() %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=bb.getSubject() %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=bb.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="수정하기">
			<input type="button" value="삭제하기" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
			<input type="button" value="답글쓰기">
			<input type="button" value="글목록" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>
