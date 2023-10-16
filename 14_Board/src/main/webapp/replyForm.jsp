
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int ref =Integer.parseInt(request.getParameter("ref"));
	String rs_level = request.getParameter("rs_level");
	String rs_step = request.getParameter("rs_step");
	String pageNum = request.getParameter("pageNum");

%>
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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
$(function() {
	alert("1");
})
</script>
    
writeForm.jsp<br>
<body bgcolor="<%=bodyback_c%>">
	<b>글쓰기</b>
	<form method="post" name="reply" action="replyProc.jsp">
		<table width="450" bgcolor="<%=bodyback_c%>" align="center">
			<tr>
				<td align="right" colspan="2" bgcolor="<%=value_c%>">
					<a href="list.jsp">글목록</a>
				</td>
			</tr>
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">이 름</td>
				<td width="300">
					<input type="text" name="writer" maxlength="10" >
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">제 목</td>
				<td width="300">
					<input type="text" name="subject" maxlength="50" >
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">Email</td>
				<td width="300">
					<input type="text" name="email" maxlength="10" >
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">내 용</td>
				<td width="300">
					<textarea name="content" id="ta" rows="15" cols="50"></textarea>
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">비밀번호</td>
				<td width="300">
					<input type="password" name="passwd" maxlength="10">
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="<%=value_c%>" align="center">
					<input type="submit" value="글쓰기" onclick= return writeSave(); >
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
				
			</tr>
			
		</table>
	</form>
</body>