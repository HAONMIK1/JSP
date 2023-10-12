<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
%>
 
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao" /> --%>
<jsp:useBean id="mb" class="myPkg.MovieBean" />
<jsp:setProperty property="*" name="mb" />

<%
MovieDao mdao = MovieDao.getInstance();
System.out.println("insertProc.jsp mdao:" + mdao);
String[] genreList = request.getParameterValues("genre");
String genre = "";

if (genreList == null) {
	genre = "좋아하는 장르 없음";
} else {
	
	for (int i = 0;i<genreList.length; i++){
		if (i != genreList.length -1) {
			genre += genreList[i] + ",";
		} else {
			genre += genreList[i];
		}
	}
	
}

mb.setGenre(genre);

int cnt = mdao.insertData(mb); 

if (cnt != 0) {
	%>
		<script>
			alert('삽입성공');
		</script>
	<%
	response.sendRedirect("list.jsp");
} else {
	%>
	<script>
		alert('삽입실패');
	</script>
<%
response.sendRedirect("insertForm.jsp");
}

%>