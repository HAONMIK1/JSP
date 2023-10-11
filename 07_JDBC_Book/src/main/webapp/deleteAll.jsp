<%@page import="mypkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp
<%
	String[] rowcheck = request.getParameterValues("rowcheck");
	BookDao dao = new BookDao();
	int cnt=0;
	for(int i=0; i<rowcheck.length;i++){
		int no = Integer.parseInt(rowcheck[i]);
	 cnt += dao.deletetebook(no);
	}
	String msg;
	String url;
	if(rowcheck.length==cnt){
		msg="삭제 성공";
	}else{
		msg="삭제 실패";
		}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="list.jsp";
</script>
