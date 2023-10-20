<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" type="text/css">
<h1 align="center">
	쇼핑몰(관리자용)
</h1>
<p align="center">
 <a href="main.jsp">쇼핑몰 홈</a>|
 <a href="<%=request.getContextPath() %>/main.jsp">메인홈</a>|
 <a href="">로그아웃</a>
</p>
<table border="1" align="center" >
<tr>
	<td> <a href="<%=request.getContextPath() %>/myshop/admin/cate_input.jsp">카테고리 등록</a> </td>
	<td> <a href="<%=request.getContextPath() %>/myshop/admin/cate_list.jsp">카테고리 목록</a> </td>
	<td> <a href="<%=request.getContextPath() %>/myshop/admin/prod_input.jsp">상품 등록</a> </td>
	<td> <a href="<%=request.getContextPath() %>/myshop/admin/prod_list.jsp">상품 목록</a> </td>
	<td> <a href="<%=request.getContextPath() %>/myshop/admin/shopping_list.jsp">쇼핑내역</a> </td>
	<td> <a href="<%=request.getContextPath() %>/myshop/display/mall.jsp">사용자 홈</a> </td>
</tr>
<tr height="300">
