<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_표현언어 내장객체</title>
		<!-- 
			날짜 : 2022/11/08
			이름 : 김진우
			내용 : JSP 표현언어 내장객체 실습하기
			
		
		 -->
	</head>
	<body>
		<h3>2.표현언어 내장객체</h3>
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		%>
		
		<p> <!-- Scope -->
			name : ${pageScope.name } <br>
			name : ${requestScope.name } <br> <!-- 제일 많이 씀 -->
			name : ${sessionScope.name } <br> <!-- 제일 많이 씀 -->
			name : ${applicationScope.name } <br>
		</p>
		
	</body>
</html>