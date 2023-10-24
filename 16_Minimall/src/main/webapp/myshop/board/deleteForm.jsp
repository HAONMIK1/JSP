<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    %>
<script type="text/javascript">
function del() {
	if($(input[name=passwd]).val()==""){
		alert("비번 써");
		return false;
	}
}
</script>
<h1> 글삭제 </h1>
<form  method="post" action="deleteProc.jsp" onsubmit="return del()">
<table>
	<tr>
		<th>비밀번호를 입력해 주세요</th>
	</tr>
	<tr>
		<td>
		 비밀번호 : <input type="password" name="passwd" >
		 <input type="hidden" name="num" value="<%=num %>"> 
		<%--  <input type="hidden" name=pageNum value="<%=pageNum%>">  --%>
		</td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="글 삭제" onclick="location.href='deleteProc.jsp?pageNum=<%=pageNum%>'">
		<input type="button" value="글 목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"> 
		</td>
	</tr>
</table>
</form>