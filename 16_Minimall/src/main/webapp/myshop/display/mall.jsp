<%@page import="my.prod.ProdDAO"%>
<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
display/mall.jsp
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	ProdDAO pdao = ProdDAO.getInstance();
%>
<jsp:include page="malltop.jsp" />
<td colspan="6" align="center">
	<%
		String[] spec = {"Hit","New","Best","NORMAL"};
		for(int i=0;i<spec.length;i++){
			ArrayList<ProdDTO>lists = pdao.selectspec(spec[i]);
		%>
	<table width="650" align="center" border="1">
		<tr align="center">
			<td><%=spec[i] %></td>

		</tr>
	</table>

	<table width="650" align="center">
		<tr align="center">
			<td>
				<%if(lists.size()==0){%>
				<table width="650" align="center" border="1">
					<td align="center"><%=spec[i] %>상품 없습니다</td>
				</table> <%
				}else{
%>				<table width="650" align="center" border="1">
					<tr>
						<td align="center">
							<table border="1">
								<tr>
						<%int count = 0;
						for(int j =0 ;j<lists.size();j++){
							count++;
				ProdDTO pb = lists.get(j);
			%>
									<td border="1">
									<a href="mall_prodview.jsp?pnum=<%=pb.getPnum()%>"><img src="../../img/<%=pb.getPimage()%>" width="50"></a><br>
									<%=pb.getPname() %><br> <%=pb.getPrice() %>원<br> [<%=pb.getPoint() %>]points
									</td>
			<%
						if(count % 3 == 0){
							out.println("</tr><tr>");
						}
					} // for
					%>
								</tr>
							</table>
			
						</td>
					</tr>
				</table><%} %>

			</td>
		</tr>
	</table> 
	<%
				}
		%>


</td>
<%@include file="mallbottom.jsp"%>