<%@page import="main.java.myPkg.MovieDao"%>
<%@page import="main.java.myPkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style> 
		table{
			margin: auto;
			text-align: center;
			width: 80%;
		}
		th{
			background: yellow;
		}
	</style>
<script type="text/javascript">
	function allCheck(obj){
		var rows = document.getElementsByName("rowcheck");
		var checked = obj.checked;
		
		if(checked){
			for(i=0; i<rows.length; i++){
				rows[i].checked = true;
			}
		} else {
			for(i=0; i<rows.length; i++){
				rows[i].checked = false;
			}
		}
	}//allCheck
	
	function selectDelete(){
		var checkedObj = document.getElementsByName("rowcheck");
		var flag = false;
		
		for(var i=0; i<checkedObj.length; i++){
			if(checkedObj[i].checked){
				flag = true;
			}
		}
		
		if(flag == false){
			alert("한개 이상 체크하세요");
			return;
		} else {
			document.forms[0].submit();
		}
	}//selectDelete
</script>	    
list.jsp<br>
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
<%
MovieDao mdao = MovieDao.getInstance();   
System.out.println("list.jsp mdao:" + mdao);
%>	
<form name = "myForm" action = "deleteAll.jsp">
	<input type = "button" value = "삭제" onClick = "selectDelete()">
	<input type = "button" value = "추가" onClick = "location.href='insertForm.jsp'"> <br><br>
  <table border = "1">
  	<tr>
  		<th><input type = "checkbox" name = "allcheck" onclick = "allCheck(this)"></th>
  		<th>번호</th>
  		<th>아이디</th>
  		<th>이름</th> 
  		<th>나이</th>
  		<th>좋아하는 장르</th>
  		<th>즐겨보는 시간대</th>
  		<th>동반관객수</th>
  		<th>개선사항</th>
  		<th>수정</th>
  		<th>삭제</th>
  	</tr>
  	
  	<% ArrayList<MovieBean> lists = mdao.getAllMovies(); 
  	for(int i=0; i<lists.size(); i++){ 
  	MovieBean mb = lists.get(i); %>
	<tr>
   		<td><input type = "checkbox" name = "rowcheck" value = "<%=mb.getNum()%>"></td>
   		<td><%= mb.getNum() %></td>
   		<td><%= mb.getId() %></td>
   		<td><%= mb.getName() %></td>
   		<td><%= mb.getAge() %></td>
   		<td><%= mb.getGenre() %></td>
   		<td><%= mb.getTime() %></td>
   		<td><%= mb.getPartner() %></td>
   		<td><%= mb.getMemo() %></td>
   		<td><a href = "updateForm.jsp?num=<%=mb.getNum()%>">수정</a></td>
   		<td><a href = "deleteProc.jsp?num=<%=mb.getNum()%>">삭제</a></td>
   	</tr>
  	<% } %>
  </table>
</form>