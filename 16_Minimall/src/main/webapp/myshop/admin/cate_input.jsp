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
		<form method="post" action="cate_proc.jsp" name="f">
	카테고리 등록
	<table border="1" align="center" width="350">
			<tr>
				<th bgcolor="yellow" >카테고리 코드</th>
				<td> <input type="text" name="cate_code"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow" >카테고리 이름</th>
				<td> <input type="text" name="cate_name"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="등록" onclick="return check()" >
					<input type="reset" value="취소" >
				</td>
				
			</tr>
	</table>
</form>
	</td>
<%@include file="bottom.jsp" %>