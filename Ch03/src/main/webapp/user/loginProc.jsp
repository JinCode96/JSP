<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(pw.equals("1234")) {
		// 회원 맞음
		
		// 클라이언트 세션 정보 (아이디 값을 세션에다가 기록)
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
		
	}else {
		// 회원 아님
		response.sendRedirect("./6_session.jsp");
		
	}


%>