<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>forward1</title>
	</head>
	<body>
		<%
			pageContext.forward("./target.jsp");
		%>
	</body>
</jsp>