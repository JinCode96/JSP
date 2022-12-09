<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String add = request.getParameter("add");
	String[] hobbies = request.getParameterValues("hobby"); // 하나 이상의 데이터 수신 Values, String[]
	
%>
<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>registerProc</title>
	</head>
	<body>
		<h3>회원가입 처리</h3>
		<p>
			아이디 : <%= "uid" %> <br/>
			비밀번호 : <%= "pw" %> <br/> 
			이름 : <%= "name" %> <br/>
			생년월일 : <%= "birth" %> <br/>
			성별 : 
			<%
				if(gender.equals("1")) {
					out.println("남자");
				}else {
					out.println("여자");
				}	
			%> 
			<br/>
			주소 : <%= "add" %> <br/>
			취미 :
			<%  
				for(String hobby : hobbies) {
					out.println(hobby + " ");
				}
			%> <br/> <!-- join으로 나타냄 -->
		</p>
		<a href="./1_request.jsp">뒤로가기</a>
	</body>
</jsp>