<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cate_code = request.getParameter("cate_code");
	String cate_name = request.getParameter("cate_name");
	CategoryDAO cdao = CategoryDAO.getInstance();
	int cnt = cdao.insertCategory(cate_code,cate_name);
	
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