<%@page import="my.shop.mall.CartBean"%>
<%@page import="my.shop.CategoryDTO"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" /> 
<%
	request.setCharacterEncoding("UTF-8");
	int pnum =Integer.parseInt(request.getParameter("pnum"));
	
	mallCart.delEdit(pnum);
	

%>
<script type="text/javascript">
			location.href="mall_cartlist.jsp"
</script>