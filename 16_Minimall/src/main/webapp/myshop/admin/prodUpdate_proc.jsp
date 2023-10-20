<%@page import="java.io.File"%>
<%@page import="my.prod.ProdDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prodUpdate_proc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
String configFolder="";
int maxSize = 1024*1024*5;
String encoding = "UTF-8";
String saveFolder = "img";

configFolder = config.getServletContext().getRealPath("img"); //컨비그당 하나
System.out.println("configFolder: "+configFolder);
MultipartRequest mr =null;
mr= new MultipartRequest(
							request,
							configFolder,//업로할 위치 2번째
							maxSize,//최ㅣ대 크기 3번쨰
							encoding,//사용할 언어 4번쨰
							new DefaultFileRenamePolicy()//중복된게 들어올수 있게 하기 위하여	
						);

	String oldimg =mr.getParameter("repimage");//기존이미지
	String pimage =mr.getFilesystemName("pimage");//새이미지
	String img =null;
	if(oldimg==null){//기존X
		if(pimage != null){//새O
			img = pimage;
		}
	}else if(oldimg != null){//기존O
		if(pimage ==null){//새X
			img = oldimg;
		}else if(pimage!=null){//새O
			img = pimage;
			File delFile= new File(configFolder,oldimg);
			if(delFile.delete()){//삭제 성공하면 트루
					%>
					<script type="text/javascript">
					alert('이미지파일 삭제 성공');
					</script>
					<%
				}
			}
		
	}
	ProdDAO cdao = ProdDAO.getInstance();
	
	
	int cnt = cdao.updateProd(mr, img);
	
	
	if(cnt==1){
		%>
		<script type="text/javascript">
			alert("성공");
			location.href="prod_list.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("실패");.
			history.go(-1);
		</script>
		<%	
		
	}
%>