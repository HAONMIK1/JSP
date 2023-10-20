<%@page import="my.prod.ProdDTO"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	int pnum =Integer.parseInt(request.getParameter("pnum"));
	ProdDAO pdao = ProdDAO.getInstance();
	ArrayList<ProdDTO> plists =pdao.selectProdNum(pnum);
	ProdDTO pb =plists.get(0);
%>
<script type="text/javascript">
	function goCart(pnum) {
		ovalue=f.oqty.value;
		if(ovalue<1||ovalue==""){
			alert("주문수량 누락 또는 1이상 입력하세요");
			return false;
		}
		location.href="mall_cartAdd.jsp?pnum="+pnum+"&ovalue="+ovalue;
	}
</script>
<%@include file="malltop.jsp"%>
<td>
<form action="" name="f">
<table align="center" border="1">
		<tr > <td colspan="2" align="center">  [<%=pb.getPname() %>]상품정보</td> </tr>
<tr>
<td> <img src="<%=request.getContextPath() %>/img/<%=pb.getPimage()%>" width="200"> </td>
<td >
상품 번호 :<%=pb.getPnum() %><br>
상품 이름 :<%=pb.getPname() %><br>
상품 가격 :<%=pb.getPrice() %><br>
상품 포인트 :<%=pb.getPoint() %><br>
상품 개수 : <input type="text" name="oqty" value="<%=pb.getPqty() %>"> <br> 
<table border="1">
<tr><td>
<a onclick="goCart('<%=pb.getPnum() %>')"> <img  src="<%=request.getContextPath() %>/img/cartbtn.gif"> </a>
</td><td>
<a href=""> <img  src="<%=request.getContextPath() %>/img/orderbtn.gif"> </a>
</td></tr>
</table>
</td>
</tr>
<tr height="100">
<td colspan="2" align="center" >
상품 상세 설명 <br>
<%=pb.getPcontents() %>
</td>
</tr>
</table>
</form>
</td>
<%@include file="mallbottom.jsp"%>