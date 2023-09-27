<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>메인페이지</h1>
<form method="post" action="control.jsp">
<table border="1" width="300" height="200">
	<tr>
		<th colspan="2">제품을 선택해주세요</th>
	</tr>
	<tr>
		<th>제품</th>
		<td>
			<input type="radio" name="device" value=tv>텔레비젼<br>
			<input type="radio" name="device" value="dc">디지털카메라<br>
			<input type="radio" name="device" value="mp">MP3플레이어 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
			<input type="reset" value="취소">
		</td>
	</tr>

</table>
</form>