<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDTO"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
function check() {
/*JQUERY 코드 
if($("input[name=cate_code]").val()==""){
		alert("코드 입력하시오");
		$("input[name=cate_code]").focus();
		return false;
	}
	if($("input[name=cate_name]").val()==""){
		alert("이름 입력하시오");
		$("input[name=cate_name]").focus();
		return false;
	} 
	
	 js 코드 방법 */
	if(f.pname.value==""){
		alert("상품명 입력하시오");
		f.cate_code.focuse();
		return false;
	}
	if(f.pcategory_fk.value==""){
		alert("상품코드 입력하시오");
		f.cate_name.focuse();
		return false;
	}
	if(f.cate_code.value==""){
		alert("코드 입력하시오");
		f.cate_code.focuse();
		return false;
	}
	if(f.cate_name.value==""){
		alert("이름 입력하시오");
		f.cate_name.focuse();
		return false;
	}
	if(f.cate_code.value==""){
		alert("코드 입력하시오");
		f.cate_code.focuse();
		return false;
	}
	if(f.cate_name.value==""){
		alert("이름 입력하시오");
		f.cate_name.focuse();
		return false;
	}
	if(f.cate_code.value==""){
		alert("코드 입력하시오");
		f.cate_code.focuse();
		return false;
	}
	if(f.cate_name.value==""){
		alert("이름 입력하시오");
		f.cate_name.focuse();
		return false;
	}
	
}	
</script>  
<%@include file="top.jsp" %>
	<td colspan="6" align="center">
		<form method="post" action="prod_proc.jsp" name="f" enctype="multipart/form-data">
				상품 등록
	<table border="1" align="center" width="600" class=outline >
			<tr>
				<th bgcolor="yellow" >카테고리</th>
				<td>
				<select name="pcategory_fk">
				<%
					CategoryDAO cdao=CategoryDAO.getInstance();
					ArrayList<CategoryDTO> lists =cdao.selectCategory();
					if(lists.size()==0){
						%>
						<option value=" "> 카테고리 없음</option>
						<%
					}else{
						for(int i=0;i<lists.size();i++){
						CategoryDTO cb= lists.get(i);
					
				%>
					<option value="<%=cb.getCname() %>" ><%=cb.getCname() %>[<%=cb.getCode() %>]</option>
					<%} }%>
				</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품명</th>
				<td> <input type="text" name="pname"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품코드</th>
				<td> <input type="text" name="pcode"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >제조회사</th>
				<td> <input type="text" name="pcompany"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품이미지</th>
				<td> <input type="file" name="pimage" value="파일선택"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품수량</th>
				<td> <input type="text" name="pqty" maxlength="8"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품가격</th>
				<td> <input type="text" name="price" maxlength="8"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품스펙</th>
				<td>
				<select name="pspec">
					<option value="NORMAL">::NORMAL::</option>
					<option value="Hit">Hit</option>
					<option value="NFW">NFW</option>
					<option value="Best">Best</option>
				</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="yellow" >상품소개</th>
				<td>
				<textarea rows="10" cols="30" name="pcontents"></textarea>
				</td>
			</tr>
				<tr>
				<th bgcolor="yellow" >상품포인트</th>
				<td> <input type="text" name="point" style="resize: none;"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="상품등록" onclick="return check()" >
					<input type="reset" value="취소" >
				</td>
				
			</tr>
	</table>
</form>
	</td>
<%@include file="bottom.jsp" %>