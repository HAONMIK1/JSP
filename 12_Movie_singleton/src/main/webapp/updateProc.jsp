<%@page import="main.java.myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateProc.jsp
<br>
<% request.setCharacterEncoding("UTF-8"); %>
 
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao" /> --%>
<jsp:useBean id="mb" class="main.java.myPkg.MovieBean" />
<jsp:setProperty property="*" name="mb" />

<%
MovieDao mdao = MovieDao.getInstance();
System.out.println("updateProc.jsp mdao:" + mdao);
      String[] genres = request.getParameterValues("genre");
      String genre = "";
      if (genres == null) {
    		genre = "좋아하는 장르 없음";
    	} else {
		      for(int i=0; i<genres.length; i++){
		         if(i == genres.length-1){
		            genre += genres[i];
		         } else {
		            genre += genres[i] + ", ";
		         }
		      }
    	}
      mb.setGenre(genre);
      
      int cnt = mdao.updateData(mb);  
      String msg, url;
      if(cnt <= 0){
         msg = "수정 실패";
         url = "updateForm.jsp?num="+mb.getNum();
      } else {
         msg = "수정 성공";
         url = "list.jsp";
      }   
   %>

<script type="text/javascript">
   alert("<%= msg %>");
   location.href="<%= url %>";
</script>


