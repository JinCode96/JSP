<%@page import="kr.co.College.Bean.studentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.College.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<studentBean> students = new ArrayList<>();

	try{
		
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `Student`");
		
		while(rs.next()){
			studentBean sb = new studentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			students.add(sb);
		}
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			
			$(function(){
				$('.btnRegister').click(function(){
					let stdNo = $(this).val();
					$('section').show();
				});
				
				$('.btnClose').click(function(){
					$('section').hide();
				});
				
				$('input[type=submit]').click(function(){
					
					let stdNo = $('input[name=stdNo]').val();
					let stdName = $('input[name=stdName]').val();
					let stdHp = $('input[name=stdHp]').val();
					let stdYear = $('input[name=stdYear]').val();
					let stdAddress = $('input[name=stdAddress]').val();
					
					let jsonData = {
						"stdNo":stdNo,		
						"stdName":stdName,		
						"stdHp":stdHp,		
						"stdYear":stdYear,		
						"stdAddress":stdAddress		
					};
					
					$.post('./studentProc.jsp', jsonData, function(data){
						
						if(data.result > 0){
							alert('등록완료!');
						}else{
							alert('등록실패!');
						}
					});
					
				});
				
			});
		
		
		</script>
	</head>
	<body>
		<h2>학생관리</h2>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		<h3>학생목록</h3>
		<button class="btnRegister">등록</button>
		<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>학년</th>
			<th>주소</th>
		</tr>
		<% for(studentBean sb : students) { %>
		<tr>
			<td><%= sb.getStdNo() %></td>
			<td><%= sb.getStdName() %></td>
			<td><%= sb.getStdHp() %></td>
			<td><%= sb.getStdYear() %></td>
			<td><%= sb.getStdAddress() %></td>
		</tr>
		<% } %>
		</table><br/>
		
		<section style="display:none;">
			<h3>학생등록</h3><br/>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<select name="stdYear">
							  <option value='1' selected>1학년</option>
							  <option value='2' selected>2학년</option>
							  <option value='3' selected>3학년</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"/></td>
				</tr>
			</table>
		</section>
	</body>
</html>