<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteForm.jsp(num,passwd) => deleteProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum =request.getParameter("pageNum");
	String passwd =request.getParameter("passwd");
	BoardDao bdao = BoardDao.getInstance();
	int cnt =bdao.delete(num,passwd);

	if(cnt ==1){
	/* 	int count = bdao.getArticleCount();
		
		int pageSize = 10 ;
		int pageCount = count/pageSize +(count%pageSize==0? 0 : 1);
		if(count<Integer.parseInt(pageNum)){
			response.sendRedirect("list.jsp?pageNum="+ (Integer.parseInt(pageNum) -1));
		}
		else{
			response.sendRedirect("list.jsp?pageNum="+ (pageNum));
		} */
			response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else{
%>
<script type="text/javascript">
alert("비번 맞지 않음");
history.go(-1);
</script>
<%}%>