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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
   $(function(){
      //alert(1);
   });
   
  /*  function writeSave(){
	   alert(2);
   } */
</script>        
content.jsp(3가지) => replyForm.jsp<br>
<%
String ref = request.getParameter("ref");
String re_step = request.getParameter("re_step");
String re_level = request.getParameter("re_level");
String pageNum = request.getParameter("pageNum");

System.out.println(ref+"/"+re_step+"/"+re_level); // 부모 정보 3가지
%>
<body bgcolor="<%=bodyback_c%>">
	<b>답글쓰기</b>
	<form method="post" name="writeForm" action="replyProc.jsp"> <!-- onsubmit="return writeSave()" -->
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="re_step" value="<%=re_step %>">
		<input type="hidden" name="re_level" value="<%=re_level %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		
		<table width="450" bgcolor="<%=bodyback_c%>" align="center">
			<tr>
				<td align="right" colspan="2" bgcolor="<%=value_c%>">
					<a href="list.jsp">글목록</a>
				</td>
			</tr>
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">이 름</td>
				<td width="300">
					<input type="text" name="writer" maxlength="10" value="홍길동">
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">제 목</td>
				<td width="300">
					<input type="text" name="subject" maxlength="50" value="[답글]어떤글">
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">Email</td>
				<td width="300">
					<input type="text" name="email" maxlength="10" value="aa@xx.com">
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">내 용</td>
				<td width="300">
					<textarea name="content" id="ta" rows="15" cols="50">호호호</textarea>
				</td>
			</tr>
			
			<tr>
				<td width="150" bgcolor="<%=value_c%>" align="center">비밀번호</td>
				<td width="300">
					<input type="password" name="passwd" maxlength="10" value="1234">
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="<%=value_c%>" align="center">
					<input type="submit" value="글쓰기" onClick="return writeSave()"><!-- onClick="return writeSave()" -->
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'"> 
				</td> 
				
			</tr>
			
		</table>
	</form>
</body>