<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>response</title>
	</head>
	<body>
		<h3>response 처리 페이지</h3>
	</body>
</jsp>
<%
	// 해당 페이지를 다운로드
	response.setHeader("Content-Type", "application/octet-stream");
%>