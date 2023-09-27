<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    main<br>
    시작페이지 <br>
<jsp:forward page="templateTest.jsp">
	<jsp:param value="content.jsp" name="contentPage" />
</jsp:forward>
거져가는 페이지

