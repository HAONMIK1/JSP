<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");
	int pnum =Integer.parseInt(request.getParameter("pnum"));
	int oqty =Integer.parseInt(request.getParameter("oqty"));
%>
<%@include file="malltop.jsp"%>

<td colspan="6" align="center">
		<table border="1" width="300">
			<tr>
				<th colspan="3">결제 내역서 보기</th>
			</tr>
			<tr>
				<td>상품명</td>
				<td>수량</td>
				<td align="right">금액</td>
			</tr>
			<%
			if(pnum!=0 && oqty!=0 ){
			mallCart.addProduct(pnum, oqty);
			}
			Vector<ProdDTO> clists = mallCart.getAllProd();
			int price = 0;
			if (clists.size() == 0) {
			%>
			<tr>
				<td colspan="3" align="center">선택한 상품이 없습니다</td>
			</tr>

			<%
			} else {
			for (int i = 0; i < clists.size(); i++) {
				ProdDTO pb = clists.get(i);
				price += pb.getPrice();
			%>
			<tr>
				<td><%=pb.getPname()%></td>
				<td><%=pb.getPqty()%>개</td>
				<td align="right"><%=pb.getPrice()%>원</td>
			</tr>
			<%
			}
			}
			%>
			<tr>
				<th colspan="3">결제하실 총액은 <%=price%> 원
				</th>
			</tr>
		</table>
		<input type="button" value="결제하기" onclick="location.href='mall_calculate.jsp'">
	
</td>
<%@include file="mallbottom.jsp"%>