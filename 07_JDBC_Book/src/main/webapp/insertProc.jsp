<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
폼에서 입력한 모든 항목을 bookbean으로 묶어서 다오 가서 인서트하가ㅣ
인서트 성공 list 이동
<%
	request.setCharacterEncoding("UTF-8");
	%>
<jsp:useBean id="dao" class="mypkg.BookDao"/>
<jsp:useBean id="bb" class="mypkg.BookBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<% 
	String[] bookstore = request.getParameterValues("bookstore");

	String book="";
	for(int i=0;i<bookstore.length;i++)
		book += bookstore[i]+" ";
	bb.setBookstore(book);
	int cnt = dao.insertbook(bb);
	String msg;
	String url;
	if(cnt!=-1){
		msg="삽입성공";
		url="list.jsp";
	}else{
		msg="삽입 실패";
		url="insertForm.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
