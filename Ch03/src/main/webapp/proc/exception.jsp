<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int num1 = 1;
			int num2 = 0;
			
			int result = num1 / num2; // 에러 발생
		%>
		
		결과 : <%= result %>
	</body>
</jsp>