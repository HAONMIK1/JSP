<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function checkDel(pnum, pimage) {
	var answer = confirm("정말 삭제하시겠습니다까?");
	alert(answer);
	if(answer){
		location.href="proddelete.jsp?pnum="+pnum+"&pimage="+pimage;
	}
}
</script>
<%
	request.setCharacterEncoding("UTF-8");
    ProdDAO pdao = ProdDAO.getInstance();
   	ArrayList<ProdDTO> lists= pdao.selectProd();
 %>
	
<%@ include file="top.jsp" %>

<td colspan="6" align="center">
		<table border="1" align="center" width="1000" class="outline">
			<tr>
				<th bgcolor="yellow" >번호</th>
				<th bgcolor="yellow" >상품 코드</th>
				<th bgcolor="yellow" >상품명</th>
				<th bgcolor="yellow" > 이미지</th>
				<th bgcolor="yellow" > 가격</th>
				<th bgcolor="yellow" > 제조사</th>
				<th bgcolor="yellow" > 수량</th>
				<th bgcolor="yellow" >수정 | 삭제</th>
			</tr>
			
			<% 
			if(lists.size()==0){
				%>
				<tr><td colspan="8" align="center">등록된 상품이 없습니다</td> </tr>
				<%
			}else{
			for(int i=0; i<lists.size();i++) {
				ProdDTO pb = lists.get(i);
			%>
			<tr>
			<td><%=pb.getPnum() %></td>
			<td><%=pb.getPcategory_fk() %></td>
			<td><%=pb.getPname() %></td>
			<td> <img src="<%=request.getContextPath() %>/img/<%=pb.getPimage()%>" width="50"> </td>
			<td><%=pb.getPrice() %></td>
			<td><%=pb.getPcompany() %></td>
			<td><%=pb.getPsepc() %></td>
			<td>
			 <a href="produpdate.jsp?pnum=<%=pb.getPnum()%>">수정</a> |
			 <a href="javascript:checkDel('<%=pb.getPnum() %>','<%=pb.getPimage()%>')" >삭제</a> </td>
			</tr>
			
			<%}} %>
	</table>
	</td>

	</td>
<%@include file="bottom.jsp" %>