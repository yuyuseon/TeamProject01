<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>�п����� ���� index����</li>
		<li>���� ����:KOSMO</li>
		<li>
			<%
				DTO dto =new DTO("ȫ�浿");
				out.println(dto.getName());
			%>
		</li>
	</ul>
</body>
</html>