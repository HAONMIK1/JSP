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

insertForm.jsp<br>
<h2>회원가입 insertForm.jsp</h2>
	<form action="insertProc.jsp" method="post">
		아이디 : <input type="text" name="id" value="IU">
				<button type="button" id="id_check">중복체크</button>
				<span id="idmessage" style="display: none;">sdfsdf</span>
		<br><br>  
		비밀번호 :
		<input type="password" name="passwd" value="1234"><br><br>  
		이름
		: <input type="text" name="name" value="아이유"><br><br>  
		생년월일 :
		<select name="year">
				<%for(int i = 2023; i >= 1930; i--){%>
					<option value="<%=i%>"><%=i%></option>
				<%}%>
		</select> 년
		
		<select name="month">
			<%
				for(int i=1;i<=12;i++){
					%>
					<option value="<%=i %>"><%=i %></option>					
				<%}%> 
		</select> 월
		
		<select name="day">
			<%
				for(int i=1;i<=31;i++){
					%>
					<option value="<%=i %>"><%=i %></option>					
				<%}%> 
		</select> 일
		 <br>
		<br> 취미 : 
		<!-- <input type="checkbox" name="hobby" value="달리기">달리기
		<input type="checkbox" name="hobby" value="수영">수영 
		<input type="checkbox" name="hobby" value="게임">게임 
		<input type="checkbox" name="hobby" value="영화">영화 -->
		<% 
			String[] hobby = {"달리기","수영","게임","영화"};
			for(int i=0;i<hobby.length;i++){ %>
				<input type="checkbox" name="hobby" value="<%=hobby[i] %>"><%=hobby[i] %>
			<%}%>
		<br> <br><br> 

		[점수입력]<br> 
		C언어 : 	<input type="text" name="c" size="10">
		JAVA : <input type="text" name="java" size="10">
		JSP : <input type="text" name="jsp" size="10"><br><br> 
		 
		<input type="submit" value="가입하기" id="sub">
	</form>