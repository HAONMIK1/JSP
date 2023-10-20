<%@page import="my.prod.ProdDTO"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />   
 <%
 	request.setCharacterEncoding("UTF-8");
 	System.out.print(mallCart);
 	int pnum =Integer.parseInt(request.getParameter("pnum"));
 	int ovalue =Integer.parseInt(request.getParameter("ovalue"));
 %>
<%@include file="malltop.jsp" %>
	<td colspan="6" align="center">
	<%
	ProdDAO pdao = ProdDAO.getInstance();
	ArrayList<ProdDTO> listss=pdao.selectProdNum(pnum);
	ProdDTO pb =listss.get(0);
	if(pb.getPqty()<ovalue){
		%>
		<script type="text/javascript">
		alert("주문 수량 초과");
		location.href="mall.jsp";
		</script>
		<%
	}
	
	mallCart.addProduct(pnum,ovalue);
	response.sendRedirect("mall_cartlist.jsp");
	%>
	</td>
<%@include file="mallbottom.jsp" %>