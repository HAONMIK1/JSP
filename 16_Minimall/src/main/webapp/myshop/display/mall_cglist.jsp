<%@page import="java.util.ArrayList"%>
<%@page import="my.prod.ProdDAO"%>
<%@page import="my.prod.ProdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String cname = request.getParameter("cname");
	ProdDAO pdao = ProdDAO.getInstance();
	ArrayList<ProdDTO>lists = pdao.selectCategory(cname);
%>
<jsp:include page="malltop.jsp" />

<td colspan="6" align="center">
<h3>Welcome My MINIMALL</h3>
<hr color = green width="80%" >
	<font color="red" size="3"><strong><%=cname %></strong></font>
<hr color = green width="80%">
	<table>
		<tr>
		<%if(lists.size()==0){%>
					<td align="center">상품 없습니다</td>
				 <%
				}else{
		int count =0;
			for(int i=0 ; i<lists.size();i++){
				count++;
				ProdDTO pb =lists.get(i);
		%>
		<td bored ="1">
		<a href="mall_prodview.jsp?pnum=<%=pb.getPnum()%>"> <img src="<%=request.getContextPath() %>/img/<%=pb.getPimage()%>" width="100"></a><br>
		<%=pb.getPname() %><br>
		<%=pb.getPrice() %><br>
		<%=pb.getPoint() %>
		</td>
		<%if(count%3==0){
		out.println("</tr><tr>");
		}
		}
			
				} %>
		</tr>
	</table>
</td>
<%@include file="mallbottom.jsp"%>