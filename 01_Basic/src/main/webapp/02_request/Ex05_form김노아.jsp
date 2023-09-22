<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
span{
	float:left;
	display:block;
	width:150px;
	color:red;
}

</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[name='id']").focus();
	})
	
function check(){
	if($("input[name='id']").val()==""){
		alert("아이디 누락");
		return false;
	}
	
	if($("input[name='pw']").val()==""){
		alert("비번 누락");
		return false;
	}
	
	if($("input[name='product']:checked").length==0){
		alert("구매상품 누락");
		return false;
	}
	
	product="";
	$("input[name='product']:checked").each(function() {
		product+=$(this).val();
	})
	
	if($("SELECT[name='time']").val()=="선택"){
		alert("배송시간 선택누락");
		return false;
	}
	
	if($("input[name='approve']").val()==""){
		alert("결제방법 누락");
		return false;
	} 
	
	if($("input[name='agree']:checked").val()!="on"){
		alert("결제 동의 체크하시오");
		return false;
	}
	
}
</script>
<body>
<h2> 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="Ex05_result김노아.jsp">

 <span>아이디 :</span> <input TYPE="text" name="id"><br>
 <span>비번 :</span> <input TYPE="text" name="pw"><br>
  <p> 
  
 
<span>구매상품:</span>
	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구
<p>

<span>배송시간 :</span> 
 	<SELECT NAME="time">
 		<OPTION VALUE="선택">선택</OPTION>
		<OPTION  VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시">11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION>
	</SELECT>
<p>

<span>결제방법:</span>
카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드">
핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰">
<p>
<span>결제 동의합니다. </span>  
<INPUT TYPE="checkbox" NAME="agree" id="agree">
<p>

<INPUT TYPE="submit" value="보내기" onclick="return check()">
</FORM>
</body>
</html>


