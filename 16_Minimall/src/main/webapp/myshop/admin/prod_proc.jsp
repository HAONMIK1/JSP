<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pb" class="my.prod.ProdDTO"/>
<jsp:setProperty property="*" name="pb"/>
<%
String configFolder="";
int maxSize = 1024*1024*5;
String encoding = "UTF-8";
String saveFolder = "img";

configFolder = config.getServletContext().getRealPath("img"); //컨비그당 하나
System.out.println(configFolder);
MultipartRequest mr =null;
mr= new MultipartRequest(
							request,
							configFolder,//업로할 위치 2번째
							maxSize,//최ㅣ대 크기 3번쨰
							encoding,//사용할 언어 4번쨰
							new DefaultFileRenamePolicy()//중복된게 들어올수 있게 하기 위하여	
						);
pb.setPimage(mr.getParameter("name"));
	ProdDAO cdao = ProdDAO.getInstance();

	int cnt = cdao.insertProd(pb);
	
	if(cnt==1){
		%>
		<script type="text/javascript">
			alert("성공");
			location.href="cate_list.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("실패");.
			history.go(-1);
		</script>
		<%	
		
	}
%>