<%@page import="my.shop.mall.orderBean"%>
<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top.jsp" %>
<jsp:useBean id="odao" class="my.shop.mall.orderDao" scope="session"/>
<%
	Vector<orderBean> lists = null;
	String id = request.getParameter("id");
	int total = 0;
	if(id!=null){
		lists =odao.getorderList( id);
	}
%>
	<td colspan="6" align="center">
		shopping_list.jsp
		<form action="">
			<table border="1">
			<tr>
			<td colspan="5">
			 조회할 회원 아이디 입력: <input type="text" name="id" value="hong"> <input type="button" value="조회">
			</td>
			 </tr>
				<tr>
				<td>고객명</td>
				<td>아이디</td>
				<td>상품명</td>
				<td>수량</td>
				<td>금액</td>
				</tr>
		<% 
		if(lists != null){
		for(orderBean odto : lists){
			String mname = odto.getMname();
			String mid = odto.getMid();
			String pname = odto.getPname();
			int qty = odto.getQty(); 
			int amount = odto.getAmount();
			total += amount;
		
		%>
			<tr>
						<td align="center"><%=mname%></td>
						<td align="center"><%=mid%></td>
						<td align="center"><%=pname%></td>
						<td align="center"><%=qty%></td>
						<td align="center"><%=amount%></td>
					</tr>
		<% }
		}%>
			</table>
		</form>
	</td>
<%@include file="bottom.jsp" %>