<%@page import="java.io.File"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum =Integer.parseInt(request.getParameter("pnum"));
	String pimage =request.getParameter("pimage");
	System.out.print(pnum);//잘 들어왔는지 확인도 해보기
	ProdDAO pdao = ProdDAO.getInstance();
	int cnt = pdao.deleteProd(pnum);
	
	
	String delPath = config.getServletContext().getRealPath("img"); //컨비그당 하나
	System.out.print("delPath"+delPath);
	File dir= new File(delPath);
	File delFile= new File(dir,pimage);
	if(delFile.exists()){//exists 존재하냐 안하냐
		if(delFile.delete()){//삭제 성공하면 트루
			%>
			<script type="text/javascript">
			alert('이미지파일 삭제 성공');
			</script>
			<%
		
		}
	}
	if(cnt==1){
		%>
		<script type="text/javascript">
			alert("성공");
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("실패");.
		</script>
		<%	
		
	}
%>
<script type="text/javascript">
			location.href="prod_list.jsp"
</script>