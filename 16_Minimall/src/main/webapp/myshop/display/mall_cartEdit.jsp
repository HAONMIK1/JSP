<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartlist(pnum,pqty)=>mall_cartlist.jsp -->
  <jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" /> <!-- 계속 사용 -->
<%
	request.setCharacterEncoding("UTF-8");
	String pnum = request.getParameter("pnum");
String oqpty = request.getParameter("oqpty");


	ProdDAO pdao = ProdDAO.getInstance();
	ArrayList<ProdDTO> listss=pdao.selectProdNum(Integer.parseInt(pnum));
	ProdDTO pb =listss.get(0);
	if(pb.getPqty()<Integer.parseInt(oqpty)){
		%>
		<script type="text/javascript">
		alert("주문 수량 초과");
		location.href="mall.jsp";
		</script>
		<%
		return;
	}
	
	mallCart.setEdit(Integer.parseInt(pnum), Integer.parseInt(oqpty));
	response.sendRedirect("mall_cartlist.jsp");
	%>