<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" >
$(document).ready(function(){

$("input[type=button]").click(function() {
	id = $("input[name=name]").val();
	alert(id);
});

});
</script>
<form method="post" action="findidPro.jsp">
	<table border="1" align="center">
			<tr>
				<th bgcolor="yellow" >이름</th>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<th bgcolor="yellow">주민등록번호</th>
				<td><input type="text" name="ssn1" size="4">-<input type="text" name="ssn2" size="4"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="아이디 찾기" >
				</td>
				
			</tr>
	</table>
</form>