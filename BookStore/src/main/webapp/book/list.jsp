<%@page import="db.DBCP"%>
<%@page import="bean.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<BookBean> books = null;
	
	try {
		
		// 1단계
		Connection conn = DBCP.getConnection();
		// 3단계
		Statement stmt = conn.createStatement();
		// 4단계
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Book`");
		// 5단계
		books = new ArrayList<>();
		
		while(rs.next()){
			BookBean bb = new BookBean();
			bb.setBookId(rs.getString(1));
			bb.setBookName(rs.getString(2));
			bb.setPublisher(rs.getString(3));
			bb.setPrice(rs.getString(4));
			
			books.add(bb);			
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();		
		
	}catch(Exception e) {
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::list</title>
	</head>
	<body>
		<h3>도서목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">도서등록</a>
		
		<table border="1">
			<tr>
				<th>도서번호</th>
				<th>도서명</th>	
				<th>출판사</th>	
				<th>가격</th>	
				<th>관리</th>			
			</tr>
			<% for(BookBean bb : books){ %>
			<tr>
				<td><%= bb.getBookId() %></td>
				<td><%= bb.getBookName() %></td>
				<td><%= bb.getPublisher() %></td>
				<td><%= bb.getPrice() %></td>
				<td>
					<a href="./modify.jsp?bookId=<%= bb.getBookId() %>">수정</a>
					<a href="./delete.jsp?bookId=<%= bb.getBookId() %>">삭제</a>
				</td>				
			</tr>
			<% } %>
		
		</table>
	</body>
</html>