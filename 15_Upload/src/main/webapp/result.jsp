<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

form => result
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String filename = request.getParameter("filename");
	application.getAttribute("");
%>
<!-- <form enctype>으로 보낼떄 request로 받을 수 없다-->
<%
	String configFolder="";
	int maxSize = 1024*1024*5;
	String encoding = "UTF-8";
	String saveFolder = "img";
	
	/* JSP내장객체
		request
		out
		response
		session
		page
		application
		application
		config: JSP 페이지가 서블릿클래스로 변환되거
		서블릿 인스턴스가 생성될떄 참고해야 될
		초기 설정 정보를 저장해 놓은 객체
	
	*/
	configFolder = config.getServletContext().getRealPath("img"); //컨비그당 하나
	//ServletConfig config = new ServletConfig(); 서블렛당 하나
	System.out.println(configFolder);
	//C:\JSP_NAK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Upload\
	//C:\JSP_NAK\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Upload\img
	MultipartRequest mr =null;
	mr= new MultipartRequest(
								request,
								configFolder,//업로할 위치 2번째
								maxSize,//최ㅣ대 크기 3번쨰
								encoding,//사용할 언어 4번쨰
								new DefaultFileRenamePolicy()//중복된게 들어올수 있게 하기 위하여	
							);

%>
<%=mr.getParameter("name")%>

<%
	String fs_filename = mr.getFilesystemName("filename");
	String og_filename = mr.getOriginalFileName("filename");
	
%>
<%=fs_filename%>
<%=og_filename%>

<%
	String requestFoilder = request.getContextPath()+"/"+saveFolder;
	System.out.println("requestFolider:"+requestFoilder);
	String fullPath = requestFoilder+"/"+fs_filename;
	System.out.println("fullPath:"+fullPath);
%>

<img src="<%=fullPath%>" width="300" height="200">















