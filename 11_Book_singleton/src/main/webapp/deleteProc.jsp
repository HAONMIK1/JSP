<%@page import="myPkg.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp(no) => deleteProc.jsp<br>
<%-- <jsp:useBean id="bdao" class="myPkg.BookDao"/> --%>
<%
	BookDao bdao = BookDao.getInstance();
	System.out.println("deleteProc.jsp bdao:" + bdao);
%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	int cnt = bdao.deleteData(no);
	
	String msg,url; 
	if(cnt != -1){
		msg = "삭제 성공";
	} else {
		msg = "삭제 실패";
	}
 %>
 
 <script type="text/javascript">
 	alert("<%=msg%>");
 	location.href="list.jsp"
 </script>
 