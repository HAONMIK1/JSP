<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	bb.setIp(request.getRemoteAddr());
	bb.setReg_date(new Timestamp(System.currentTimeMillis())); 
	
	
	BoardDao bd = BoardDao.getInstance();
	
	int cnt = bd.replyArticle(bb);  // 10가지
	
	if (cnt == 1) {
	    //성공한 경우
	    response.sendRedirect("list.jsp?pageNum=" + pageNum);
	} else {
    //실패한 경우
%>
    <script type="text/javascript">
        alert("실패");
        history.go(-1);
    </script>
<%
}
%>