<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myPkg.MovieDao"/>
<jsp:useBean id="mb" class="myPkg.MovieBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	
	String[] genre1 = request.getParameterValues("genre");
	String genre="";
	if(genre1 == null){ // 
		genre = "선택항목 없음";
	}else{
		for(int i=0; i<genre1.length; i++){
			if (i != genre1.length-1){
				genre += genre1[i] + ","; // 달리기,수영,영화 
			}else{
				genre += genre1[i];
			}
		}
	}
	mb.setGenre(genre);
	
	int cnt = dao.insert(mb);
	if(cnt==1){
		%>
		<script type="text/javascript">
		alert("가입 성공")
		</script>
		<jsp:forward page="list.jsp"/>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("가입 실패")
		</script>
		<jsp:forward page="insertForm.jsp"/>
		<%
	}
%>