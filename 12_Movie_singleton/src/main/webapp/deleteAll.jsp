<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
<% 
	MovieDao mdao = MovieDao.getInstance();
	System.out.println("deleteAll.jsp mdao:" + mdao);
	String[] rowcheck = request.getParameterValues("rowcheck");
	
	for(int i = 0; i < rowcheck.length; i++){
		System.out.print(rowcheck[i] + " ");
	}
	
	int cnt = mdao.deleteCheckData(rowcheck); //3 
	String msg = "";
	
	if(cnt != -1){
		msg = "삭제 성공"; 
	}else{
		msg = "삭제 실패";
	}
%>
<script type="text/javascript">
	alert("<%=msg %>")
	location.href = "list.jsp";
</script>