<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>    
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">

	body{
		text-align: center;
	}
	table{
		margin : auto;
	}
</style>   
list.jsp=>content.jsp<br>

글내용 보기
<%-- <jsp:useBean id="bb" class="board.BoardBean"/> --%>
<%
	request.setCharacterEncoding("UTF-8");
	int num =Integer.parseInt(request.getParameter("num"));
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb= bdao.getArticle(num); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body bgcolor="<%=bodyback_c %>">
<h1>글내용보기</h1>
<table width="500" border="1" bgcolor="<%=bodyback_c%>" align="center">
	<tr>
		<td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
		<td align="center" width="125" ><%=bb.getNum() %></td>
		<td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
		<td align="center" width="125"><%=bb.getReadcount() %></td>
	</tr>
	<tr>
		<td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
		<td align="center" width="125"><%=bb.getWriter() %></td>
		<td align="center" width="125" bgcolor="<%=value_c%>">작성일</td>
		<td align="center" width="125"><%= sdf.format(bb.getReg_date()) %></td>
	</tr>
	<tr>
   		<td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
   		<td  align="center" width="375"colspan=3 ><%= bb.getSubject() %></td>
   	</tr>
   	
   	<tr>
   		<td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
   		<td align="left" width="375" height = "100" colspan=3><%= bb.getContent() %></td>
   	</tr>
   	
   	<tr>
		<td bgcolor="<%=value_c%>" colspan="4" align="right">
			<input type="button" value="글수정">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'" >
			<input type="button" value="답글쓰기">
			<input type="button" value="글목록" onClick="location.href='list.jsp'">
		</td>
	</tr>
</table>
</body>