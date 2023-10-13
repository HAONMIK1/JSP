<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	%>
<jsp:useBean id="dao" class="board.BookDao"/>
<jsp:useBean id="bb" class="board.BookBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<% 
	String[] bookstore = request.getParameterValues("bookstore");

	String book="";
	for(int i=0;i<bookstore.length;i++)
		book += bookstore[i]+" ";
	bb.setBookstore(book);
	int cnt = dao.upadatebook(bb);
	String msg;
	String url;
	if(cnt!=-1){
		msg="수정성공";
		url="list.jsp";
	}else{
		msg="수정 실패";
		url="updateForm.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
