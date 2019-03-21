<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<script>
	//해당 파일 로딩 시 아래 요청명으로 바로 이동
	location.href="./MainCtrl.do";
</script>
<%if(session.getAttribute("TYPE")!=null){
	System.out.print(session.getAttribute("TYPE"));%>
	
	<%if(!session.getAttribute("TYPE").toString().equals("페이지관리자")){  %>
		<script type="text/javascript">
		
		window.history.forward();
		
		function noBack() {
		
			window.history.forward();
		
		}
		
		</script>
	<%} %>
<%} %>
</head>
<body>

</body>
</html>   