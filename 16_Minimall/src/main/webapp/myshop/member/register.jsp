<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
myshop/member/register.jsp
<%=request.getContextPath()%>
<script type="text/javascript" src="../../js/jquery.js"></script>
<!-- <script type="text/javascript" src="script.js"></script>-->
<script type="text/javascript">
$(document).ready(function(){
	var isCheck = false;
	var use;
	var pwuse;

	$(function(){
		$("input[name=id]").keydown(function(){
			$("#idmessage").css('display','none');
			isCheck = false;
			use = "";
		});
	});

	function writeSave(){ // submit(가입하기)
		//alert(1);
		if($("input[name=id]").val()==""){
			alert("아이디를 입력하세요");
			$("input[name=id]").focus();
			isBlank = true;
			return false;
		}else if(use == "impossible"){
			alert("이미 사용중인 아이디입니다.");
			return false;
		}else if(isCheck == false){
			alert("중복체크 먼저 하세요");
			return false;
		}

		if($('input[name="password"]').val()==""){
			alert("비밀번호를 입력하세요");
			$("input[name=password]").focus();
			return false;
		}
		if($('input[name="repassword"]').val()==""){
			alert("비밀번호 확인을 입력하세요");
			$("input[name=repassword]").focus();
			return false;
		}
		//if($('input[name="password"]').val() != $('input[name="repassword"]').val()){
		if(pwuse == "nosame"){
			alert("비밀번호 일치하지 않습니다.");
			return false;
		}
	}//writeSave

	function duplicate(){ // 중복체크
		//alert('duplicate');
		isCheck = true;
		
		if($("input[name=id]").val()==""){
			alert("아이디를 입력하세요");
			$("input[name=id]").focus();
			isBlank = true;
			return;
		}
		
		$.ajax({
				url : "id_check_proc.jsp",
				data : ({
					userid : $("input[name=id]").val() // userid=kim
				}),
				success : function(data){
					if($.trim(data) == "YES"){
						$("#idmessage").html("<font color=blue>사용 가능한 아이디입니다.</font>")
						$("#idmessage").show();
						use = "possible";
					}else{
						$("#idmessage").html("<font color=red>중복된 아이디입니다.</font>")
						$("#idmessage").show();
						use = "impossible";
					}
				} // success
			}); // ajax
				
	}//duplicate

	function repassword_keyup(){
		//alert(1);
		if($('input[name="password"]').val() == $('input[name="repassword"]').val() ){
			$('#pwmessage').html("<font color=blue>비번일치</font");
			pwuse = "same";
		}else{
			$('#pwmessage').html("<font color=red>비번 불일치</font");
			pwuse = "nosame";
		}
	}//repassword_keyup


	function pwcheck(){
		//alert(2);
		pvalue = $('input[name="password"]').val();
		regexp = /^[a-z0-9]{3,8}$/;
		var regexp = / /; // 영문 소문자/숫자 조합 3~8
		if(pvalue.search(regexp)==1){
			alert('길이는 3~8사이입니다.');
			return false;
		}
		var chk_eng = pvalue.search(/[a-z]/i)// /다음에 i쓰면 대소문자 무시한다
		var chk_num = pvalue.search(/[a-z]/i)//
		alert(chk_eng+","+chk_num); 
		if(chk_eng<0 || chk_num<0){
			alert('영문 소문자/숫자 조합이 아닙니다.');
			return false;
		}
	}

	 
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
			<td><input type="text" name="id"> 
			<input type="button" value="중복체크" onClick="return duplicate()"> 
				<span id="idmessage"></span></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"> 영문 소문자/숫자 조합
				3~8자<a></a></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
			<input type="password" name="repassword" onKeyUp="repassword_keyup()">
			<span id="pwmessage"></span>
			</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td>
			<input type="email" name="email">
			</td>
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