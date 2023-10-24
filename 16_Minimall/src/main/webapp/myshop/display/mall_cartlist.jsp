<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.mall.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" /> 
<%@include file="malltop.jsp" %>
	<td colspan="6" align="center">
		<table border="1" width="450">
			<tr>
				<td colspan="6" align="center" > 장바구니 보기</td>
			</tr>
			<tr>
			<td>번호</td>
			<td>상품명</td>
			<td>수량</td>
			<td>단가</td>
			<td>금액</td>
			<td>삭제</td>
			</tr>
			<% 
			Vector<ProdDTO> clists =mallCart.getAllProd();
			int point =0;
			int price =0;
			if(clists.size()==0){
				%>
				<tr><td colspan="6" align="center">
				선택한 상품이 없습니다
				</td> </tr>
				
				<%
			}else{
			for(int i=0;i<clists.size();i++){
			ProdDTO pb =clists.get(i);
				point += pb.getPoint();
				price += pb.getPrice();
			%>
			<tr>
			<td><%=pb.getPnum() %></td>
			<td><%=pb.getPname() %><br>
			<img src="<%=request.getContextPath()%>/img/<%=pb.getPimage()%>" width="40">
			</td>
			<td>
			<form action="mall_cartEdit.jsp" method="post" name="f">
			<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
			<input type="text" name="oqty" value="<%=pb.getPqty() %>" size="2"> 
			<input type="submit" value="수정">
			</form>
			
			</td>
			<td><%=pb.getPrice() %></td>
			<td><%=pb.getPrice() %></td>
			<td><a href="mall_cartDel.jsp?pnum=<%=pb.getPnum()%>">삭제</a></td>
			
			</tr>
			<%} }%>
			<tr>
				<td colspan="4">
				장바구니 총액 : <%=price %> 원<br>
				총 적립 포인트 : <%=point %>포인트
				</td>
				<td colspan="2">
				<a href="mall_order.jsp?pnum=00&oqty=00"> [주문하기]</a>
				<a href="mall.jsp"> [계속 쇼핑]</a>
				</td>
			</tr>
		</table>
	</td>
<%@include file="mallbottom.jsp" %>