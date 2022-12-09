<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>redirect2</title>
	</head>
	<body>
		<h3>redirect2 페이지</h3>
	</body>
</jsp>
<%
	response.sendRedirect("https://naver.com");
%>