<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery.js"></script>    
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);
	var isBlank = false;
	var use;
	var isCheck = false;
	
	$('#id_check').click(function(){ // 중복체크 클릭
		//alert(2);
		//alert($('input[name="id"]').val());
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
					if(jQuery.trim(data)=='YES'){
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
<h1>영화 선호도 조사</h1>
<form  action="insertProc.jsp" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"> 
			<input type="button" value="중복선택" id="id_check">
			<span id="idmessage" style="display: none;"></span>
			</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>좋아하는 장르</td>
		<td><input type="checkbox" name="genre">공포 
			<input type="checkbox" name="genre">다큐 
			<input type="checkbox" name="genre">액션 
			<input type="checkbox" name="genre">애니메이션
		</td>
	</tr>
	<tr>
		<td>즐겨보는 시간대</td>
		<td><select name="time">
				<option value="08-10">08-10</option>
				<option value="10-12">10-12</option>
				<option value="12-14">12-14</option>
				<option value="14-16">14-16</option>
				<option value="16-18">16-18</option>
				<option value="18-20">18-20</option>
		</select></td>
	<tr>
		<td>동반 관객수</td>
		<td>
		<input type="radio" name="partner" value="1">1 
		<input type="radio" name="partner" value="2">2 
		<input type="radio"name="partner" value="3">3 
		<input type="radio" name="partner" value="4">4
		<input type="radio" name="partner" value="5">5
		</td>
	</tr>
	<tr>
		<td>영화관 개선사항</td>
		<td><input type="text" name="memo"></td>
	</tr>
	<tr align="center">
	<td colspan="2">
		<input type="submit" value="가입하기" id="sub">
	</td>
	</tr>
</table>
</form> 
