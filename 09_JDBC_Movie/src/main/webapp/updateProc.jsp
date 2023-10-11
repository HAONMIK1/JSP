<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mb" class="myPkg.MovieBean"/>
<jsp:setProperty property="*" name="mb"/>
<%	
	String[] genre1 = request.getParameterValues("genre");
	String genre="";
	for(int i=0; i<genre1.length;i++)
		genre += genre1[i];
	mb.setGenre(genre);
	
	request.setCharacterEncoding("UTF-8");
	MovieDao mdao= new MovieDao();
	int cnt=  mdao.update(mb);
	String url="";
	String href="";
	if(cnt==0){
		url ="수정 실패";
		href="updateForm.jsp?num="+mb.getNum()+"";
	}else{
		url ="수정 성공";
		href="list.jsp";
	}
%>
<script type="text/javascript">
alert("<%=url%>");
location.href= "<%=href%>";
</script>