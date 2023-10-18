<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="./js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
		var isBlank = false;
		var use;
		var isCheck = false;
		
		$('#dup_check').click(function(){
			//alert(2);
			isCheck = true;
			if($('input[name="id"]').val() == ""){
				alert("아이디를 입력하세요.");
				isBlank = true;
				return;
			}
			
			isBlank = false;
			
			$.ajax({
				url : "id_check_proc.jsp", // 요청url
				data : ({
					userid : $('input[name="id"]').val()
				}),
				success : function(data){
					alert(data);
					if(jQuery.trim(data)=='YES'){
						$('#message').html("<font color=blue>사용 가능합니다.</font>");
						use = "possible";
						$('#message').show();
					}else{
						$('#message').html("<font color=red>이미 사용중인 아이디입니다.</font>")
						use = "impossible";
						$('#message').show();
					}
				}//success
			});//ajax
			
		});//중복체크 click
		
		$("input[name='id']").keydown(function(){

			isCheck = false;
			use="";
			$('#message').css('display','none');
		}); // keydown
		
		
		$("#sub").click(function(){
			if(use == "impossible"){
				alert("이미 사용중인 아이디입니다.");
				return false;
			}
			else if(isCheck == false){
				alert("중복 체크 먼저 하세요");
				return false;
			}
			else if($('input[name="id"]').val() == ""){
				alert("아이디를 입력하세요.");
				return false;
			}
		});// sub click
		
	});//ready
</script>
insertForm.jsp<br>
 <h2>영화 선호도 조사</h2>
    <form action="insertProc.jsp" method="post">
    	<table border="1">
    		<tr>
    			<th>아이디</th>
    			<td>
    			<input type="text" name="id" value="IU">
    			<input type="button" id="dup_check" value="중복체크">
    			<span id="message"></span>
    			</td>
    		</tr>
    		<tr>
    			<th>이름</th>
    			<td><input type="text" name="name" value="아이유"></td>
    		</tr>
    		<tr>
    			<th>나이</th>
    			<td><input type="text" name="age" value="23"></td>
    		</tr>
    		<tr>
    			<th>좋아하는 장르</th>
    			<!-- <td>
	    			<input type="checkbox" name="genre" value="공포">공포
	    			<input type="checkbox" name="genre" value="다큐">다큐
	    			<input type="checkbox" name="genre" value="액션">액션
	    			<input type="checkbox" name="genre" value="애니메이션">애니메이션
    			</td> -->
    			
    			<td>
					<%
						String[] genre = {"공포","다큐","액션","애니메이션"};
					
						for(int i=0;i<genre.length;i++){
					%>
							<input type="checkbox" name="genre" value=<%= genre[i] %>><%= genre[i] %>
					<%
						}
					%>
			</td>
			
    		</tr>
<tr>
    			<th>즐겨보는 시간대</th>
    			<td>
    				<select name="time">
    					<!-- <option value="08~10">08~10</option>
    					<option value="10~12">10~12</option>
    					<option value="12~14">12~14</option>
    					<option value="14~16">14~16</option>
    					<option value="16~18">16~18</option>
    					<option value="18~20">18~20</option> -->
    					
    					<% 
						String[] times = {"08","10","12","14","16","18","20"};
						for(int i=0; i<times.length-1; ++i){
							String str = times[i]+"~"+times[i+1];
						%>
							<option value="<%=str%>"><%=str%></option>
						<%
						}
						%>
					
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>동반 관객수</th>
    			<td>
    				<!-- <input type="radio" name="partner" value="1">1&nbsp;
    				<input type="radio" name="partner" value="2">2&nbsp;
    				<input type="radio" name="partner" value="3">3&nbsp;
    				<input type="radio" name="partner" value="4">4&nbsp;
    				<input type="radio" name="partner" value="5">5&nbsp; -->
    				<%
						for(int i=1;i<=5;i++){ %>
							<input type="radio" name="partner" value="<%=i%>"><%=i%>
						<%}%>
    			</td>
    		</tr>
    		<tr>
    			<th>영화관 개선사항</th>
    			<td><textarea name="memo" rows="5" cols="40"></textarea></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" id="sub" value="가입하기">
    			</td>
    		</tr>
    	</table>
    </form>