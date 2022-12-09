<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.vo.UserVO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBHelper"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserVO vo = UserDAO.getInstance().selectUser(uid, pass);
	
	if(vo != null) {
		// 회원이 맞을 경우
		
		// 세션처리
		session.setAttribute("sessUser", vo);
		response.sendRedirect("/Jboard1.1/list.jsp");
	}else {
		// 회원이 아닐경우
		response.sendRedirect("/Jboard1.1/user/login.jsp?success=100");
		
	}
%>