<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int cnum =Integer.parseInt(request.getParameter("cnum"));
	CategoryDAO cdao = CategoryDAO.getInstance();
	int cnt = cdao.deleteCategory(cnum);
	
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
			location.href="cate_list.jsp"
</script>