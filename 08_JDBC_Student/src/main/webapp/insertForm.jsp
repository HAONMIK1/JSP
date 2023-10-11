<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		/* alert(1); */
		var use;
		var isBlank;
		var isCheck;
		$('#id_check').click(function(){
			//alert($('input[name="id"]').val());
			if($('input[name="id"]').val()==""){
				alert("아이디를 입력하세요");
				isBlank = true;
				return;
			}
			isBlank = false;
			
			$.ajax({
				url:"id_check_proc.jsp",//요청url
				data: ({
					userid:$('input[name="id"]').val()
				}),
				success : function(data) {
					if($.trim(data)=="YES"){
						$('#idmessage').html("<font color=blue>사용가능");
						$('#idmessage').show();
						use="possible";
					}else{
						$('#idmessage').html("<font color=blue>이미 사용중인 아이디입니다");
						$('#idmessage').show();
						use="impossible";
					}
				},
				error : function(data) {
				}
			});
		});
		
		$('input[name="id"]').keydown(function() {
			alert(1);
			isCheck=false;
			use="";
			$('#idmessage').css('display','none')
		});
		
		$("#sub").click(function() {
			//alert(1);
			if(use=="imposible"){
				alert("이미 사용중인 아이디입니다.")
				return false;
			}else if(isCheck == false){
				alert("중복체크를 하세요");
				return false;
			}
			if(isBlank==true){
				alert("아이디를 입력하세요");
				return false;
			}
		});
	});
</script>
insertForm.jsp
<br>
<h2>회원가입 insertForm.jsp</h2>
<form action="insertProc.jsp" method="post">
	아이디 : <input type="text"  name="id" value="IU"> 
	<input type="button" id="id_check" value="중복체크">
	<span id="idmessage" display = none>123 </span> <br>
	<br> 비밀번호 : <input type="password" name="passwd" value="1234"><br>
	<br> 이름 : <input type="text" name="name" value="아이유"><br>
	<br> 생년월일 : <select name="year">
		<%
		for (int i = 2023; i >= 1930; i--) {
		%>
		<option value="<%=i%>"><%=i%></option>
		<%
		}
		%>
	</select> 년 <select name="month">
		<%
		for (int i = 1; i <= 12; i++) {
		%>
		<option value="<%=i%>"><%=i%></option>
		<%
		}
		%>
	</select> 월 <select name="day">
		<%
		for (int i = 1; i <= 31; i++) {
		%>
		<option value="<%=i%>"><%=i%></option>
		<%
		}
		%>
	</select> 일 <br> <br> 취미 :
	<!-- <input type="checkbox" name="hobby" value="달리기">달리기
		<input type="checkbox" name="hobby" value="수영">수영 
		<input type="checkbox" name="hobby" value="게임">게임 
		<input type="checkbox" name="hobby" value="영화">영화 -->
	<%
	String[] hobby = { "달리기", "수영", "게임", "영화" };
	for (int i = 0; i < hobby.length; i++) {
	%>
	<input type="checkbox" name="hobby" value="<%=hobby[i]%>"><%=hobby[i]%>
	<%
	}
	%>
	<br> <br> <br> [점수입력]<br> C언어 : <input type="text"
		name="c" size="10"> JAVA : <input type="text" name="java"
		size="10"> JSP : <input type="text" name="jsp" size="10"><br>
	<br> <input type="submit" value="가입하기" id="sub">
</form>
