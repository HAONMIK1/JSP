<%@page import="myPkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
list.jsp 
updateProc.jsp
=>updateForm.jsp<br>
<jsp:useBean id="dao" class="myPkg.MovieDao"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println(num);

	MovieBean mb=dao.getMovieByNum(num);  
%>
 
   <h2>영화 선호도 조사 수정하기</h2>
    <form name="myform" action="updateProc.jsp" method="post">
    <input type="hidden" name="num" value="<%= num %>">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td>
                    <%=mb.getId() %>
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" value="<%=mb.getName()%>"></td>
            </tr>
            <tr>
                <td>나이</td>
                <td><input type="text" name="age" value="<%=mb.getAge()%>"></td>
                
                </tr>
            <tr>
                <td>취미</td>
                <td>
                    <%
	                    String[] genre = { "공포", "다큐", "액션", "애니메이션" };
	                    for (int i = 0; i < genre.length; i++) {
                    %>
	                  <input type="checkbox" name="genre" value="<%=genre[i] %>"
					<% if(mb.getGenre().contains(genre[i])) { %>checked<% } %>><%=genre[i] %>

                    <%
                   	 }
                    %>
                </td>
            </tr>
            <tr>
                <td>즐겨보는 영화시간</td>
                <td>
                   <select name="time" id="time">
					<% String[] time = {"08~10", "10~12", "12~14", "14~16", "16~18", "18~20"};
	    				for(int i = 0; i<time.length; i++){ %>
	    					<option value = "<%= time[i] %>" <% if(mb.getTime().equals(time[i])){ %> selected <% } %>><%= time[i] %>
	    				<% } %>
					</select>

                </td>
            </tr>
            <tr>
                <td>동반 관객수</td>
                <td>
                   <%
					for(int i=1;i<=5;i++){ %>
						<input type="radio" name="partner" value="<%=i%>" <%if(mb.getPartner()==i){%> checked <%}%>><%=i%>
					<%}%>
                </td>
            </tr>
            <tr>
                <td>영화관 개선사항</td>
                <td>
                	<textarea rows="5" cols="40" name = "memo"><%=mb.getMemo()%></textarea>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="수정하기" id="sub">
                <input type="reset"	value="취소"></td>
            </tr>
        </table>
    </form>
                
                