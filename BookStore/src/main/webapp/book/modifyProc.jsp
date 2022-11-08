<%@page import="db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String bookId  = request.getParameter("bookId");
	String bookName = request.getParameter("bookName");
	String publisher   = request.getParameter("publisher");
	String price  = request.getParameter("price");
	
	
	try{
		
		// 2단계
		Connection conn = DBCP.getConnection();
		String sql = "UPDATE `Book` SET `bookName`=?, `publisher`=?, `price`=? ";
           	   sql += "WHERE `bookId`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookName);
		psmt.setString(2, publisher);
		psmt.setString(3, price);
		psmt.setString(4, bookId);
		// 4단계
		psmt.executeUpdate();
		
		// 5단계
		// 6단계
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
           
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>