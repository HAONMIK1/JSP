<%@page import="my.prod.ProdDTO"%>
<%@page import="my.shop.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

</script>  
<%
request.setCharacterEncoding("UTF-8");
int pnum =Integer.parseInt(request.getParameter("pnum"));
ProdDAO pdao = ProdDAO.getInstance();
ArrayList<ProdDTO> lists = pdao.selectProdNum(pnum);
ProdDTO pb =lists.get(0);
%>
<%@include file="top.jsp" %>
	<td colspan="6" align="center">
		<form method="post" action="prodUpdate_proc.jsp" name="f" enctype="multipart/form-data">
				 상품 수정
	<table border="1" align="center" width="600" class=outline >
			<tr>
				<th bgcolor="yellow" >카테고리</th>
				<td>
				<input type="text" name="pcategory_fk" value="<%=pb.getPcategory_fk()%>" disabled>
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품명</th>
				<td> <input type="text" name="pname" value="<%=pb.getPname()%>"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품번호</th>
				<td> <input type="text" name="pcode" value="<%=pb.getPnum()%>" disabled> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >제조회사</th>
				<td> <input type="text" name="pcompany" value="<%=pb.getPcompany()%>"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품이미지</th>
				<td>
				<img  src="<%=request.getContextPath() %>/img/<%=pb.getPimage()%>"> <input type="file" name="pimage" value="파일선택" > 
				<br>
				<input type="text"  name="repimage" value="<%=pb.getPimage()%>">
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품수량</th>
				<td> <input type="text" name="pqty" maxlength="8" value="<%=pb.getPqty()%>"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품가격</th>
				<td> <input type="text" name="price" maxlength="8" value="<%=pb.getPrice()%>"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품스펙</th>
				<td>
				<select name="pspec">
				<% 
				String[] value={"NORMAL","Hit","NFW","Best"}; 
					for(int i=0;i<value.length;i++){
				%>
					<option value="<%=value[i]%>" <%if(pb.getPsepc().equals(value[i])) {%> selected<%} %> ><%=value[i]%></option>
				<%} %>
				</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품소개</th>
				<td>
				<textarea rows="10" cols="30" name="pcontents" ><%=pb.getPcontents()%></textarea>
				</td>
			</tr>
				<tr>
				<th bgcolor="yellow" >상품포인트</th>
				<td> <input type="text" name="point" style="resize: none;" value="<%=pb.getPoint()%>"> </td>
			<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="상품 수정" >
					<input type="reset" value="취소" >
				</td>
				
			</tr>
	</table>
</form>
	</td>
<%@include file="bottom.jsp" %>