<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
	body {
	text-align:  center;
}
</style>
list.jsp
<br>

<%
	BoardDao bdao = BoardDao.getInstance();
	System.out.println("list.jsp bdao:" + bdao);
	
	int pageSize = 7; // 
	SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum"); // pageNum=2
			
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum); // 
	int startRow = (currentPage-1) * pageSize + 1; // 
	int endRow = currentPage * pageSize;
	
	
	// 1:1,10s
	// 2:11,20
	// 3:21,30
	
	int count = bdao.getArticleCount(); 
	System.out.println("count:" + count);
	int number =count - (currentPage-1) * pageSize;
	ArrayList<BoardBean> articleLists = bdao.getArticles(startRow,endRow);
	
%>
<h1 align="center">
	글목록 (전체 글:
	<%=count %>)
</h1>
<body bgcolor="<%=bodyback_c %>">

	<table width="700" align="center">
		<tr>
			<td align="center"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<%
			if(count==0){
		%>
	<table width= "700">
	<tr>
		<td align="center" bgcolor="<%=value_c%>">게시판에 저장된 글이 없습니다.</td>
	</tr>
	</table>
	<%}else{ %>
	<table width="700" align="center">
		<tr bgcolor="<%=value_c%>">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
			<td>IP</td>
		</tr>
		<%}
			for(int i=0;i<articleLists.size();i++){
				BoardBean bb = articleLists.get(i);
				%>
		<tr>        
			<td><%=bb.getNum() %></td>
			<td>
			<%
						int wid =0;
						if(bb.getRe_level()>0){
							wid = bb.getRe_level()*20;
						%> <img alt="" src="images/level.gif" width="<%=wid%>"> <img
				alt="" src="images/re.gif"> <%
						}else{
							
						}
						%>
						
						<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
						<%=bb.getSubject() %>
						</a>
						
						<%if(bb.getReadcount()>=10){
							%>
							<img alt="" src="images/hot.gif">
							<%
						} 
						%>
						</td>
			<td><%=bb.getWriter() %></td>
			<td><%=sdf.format(bb.getReg_date()) %></td>
			<td><%=bb.getReadcount() %></td>
			<td><%=bb.getIp() %></td>
		</tr>
		<%
			}
			%>
	</table>
	<%
			if(count>0){
				int pageCount =count/pageSize+(count%pageSize==0 ? 0:1); 
				int pageBlock = 3 ;
				int startPage=((currentPage-1)/pageBlock*pageBlock)+1;
				int endPage = startPage + pageBlock -1;
				if(endPage>pageCount){
					endPage = pageCount;
				}
				
				if(startPage>3){
					%>
					<a href="list.jsp?pageNum=<%=startPage-3 %>">[이전]</a>
					<%
				}
				
				for(int i= startPage ; i<=endPage; i++){
					%>
					<a href="list.jsp?pageNum=<%=i %>" >[<%=i %>]</a>
					<%
				}
				if(endPage < pageCount){
					%>
					<a href="list.jsp?pageNum=<%=startPage+3 %>">[다음]</a>
					<%
				}
			}
		%>
	
</body>

