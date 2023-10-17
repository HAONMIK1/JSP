<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
myshop/member/register.jsp
<%=request.getContextPath()%>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);
	var isBlank = false;
	var use;
	var isCheck = false;
	
	$('#idcheck').click(function(){ // 중복체크 클릭
		isCheck = true;
		
		if($('input[name="id"]').val()==""){
			alert("아이디를 입력하세요");
			isBlank = true;
			return;	
		}
		
		isBlank = false;
		
		
		$.ajax({
				url : "id_check_proc.jsp",
				data : ({
						userid : $('input[name="id"]').val()
				}), // userid = kim
				success : function(data){
					//alert("data:"+data);
					if($.trim(data)=='YES'){
						$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
						$('#idmessage').show();
						use = "possible";
					}else{
						$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
						$('#idmessage').show();
						use = "impossible";
					}
				}	
		}); // ajax 
	}); // id_check click
	
	
	$("input[name=id]").keydown(function() {
		//alert("키보드 누름");
		isCheck = false;
		use="";
		$('#idmessage').css('display','none');
	}); // keydown
	
	$('#sub').click(function(){ // submit
		//alert('submit클릭');
		if(use == "impossible"){
			alert("이미 사용중인 아이디입니다.");
			return false;
		}else if(isCheck == false){
			alert("중복 체크를 하세요.");
			return false;
		}
		else if(isBlank == true){
			alert("아이디를 입력하세요");
			return false;
		}
	 }); // sub click
	 
}); // ready   
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css"
	type="text/css">
<style type="text/css">
td:first-child {
	background-color: blue;
	margin: auto;
	text-align: center;
}
</style>
<form method="post" action="registerPro.jsp">
	<table border="1" align="center">
		<tr>
			<td colspan="2">◈기본정보◈</td>
		</tr>
		<tr>
			<td>회원 아이디</td>
			<td><input type="text" name="id"> <input type="button"
				value="중복체크" id="idcheck"> <span id="idmessage"
				style="display: none;">sdfsdf</span></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"> 영문 소문자/숫자 조합
				3~8자<a></a></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="passwordcheck"></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">◈개인신상정보◈</td>
		</tr>
		<tr>
			<td>한글 이름</td>
			<td><input type="text" name="name"> 성과 이름을 붙여주세요 (예)김민희
			</td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td><input type="text" name="ssn1" size="4"> - <input
				type="text" name="sssn2" size="4"></td>
		</tr>
		<tr>
			<td>휴대전화번호</td>
			<td><select name="hp1">
					<option value="010">010</option>
					<option value="012">012</option>
					<option value="011">011</option>
			</select> - <input type="text" name="hp2" size="4"> - <input
				type="text" name="hp3" size="4"> 예) 011-7608-9756</td>
		</tr>
		<tr>
			<td>가입 일자</td>
			<td><input type="text" name="joindate"> 예)1996/06/24</td>
		</tr>
		<tr>

			<td colspan="2" align="center">
			<input type="submit" value="가입하기" id="sub" onclick="return writesave()"> 
			<input type="button" value="취소" onclick="">
			</td>
		</tr>
	</table>

</form>