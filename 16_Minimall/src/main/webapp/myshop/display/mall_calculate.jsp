<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 	mall_order => mall_calculate.jsp -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="odao" class="my.shop.mall.orderDao" scope="session"/>
<%
	String msg ;
	Vector<ProdDTO> cv = mallCart.getAllProd();
	int memno = (Integer)session.getAttribute("memno");
	int cnt = odao.insertOrder(memno,cv);
	if(cnt != 0){
		msg = "주문 완료했습니다.";
		mallCart.removeAllProducts(); 
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			var resp = confirm("계속하시겠습니까?");
			if(resp){ // 
				location.href="<%=request.getContextPath()%>/myshop/display/mall.jsp";
			}else{ // 
				location.href="<%=request.getContextPath()%>/logout.jsp";
			}
		</script>
<%		
	}else{
		msg = "주문 실패했습니다.";
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			location.href="<%=request.getContextPath()%>/myshop/display/mall.jsp";
		</script>
<%		
	}
	
%>