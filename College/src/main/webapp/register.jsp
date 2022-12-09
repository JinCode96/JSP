<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.College.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.College.Bean.registerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/jsp;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<registerBean> registers = new ArrayList<>();	

try{
	Connection conn = DBCP.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select c.`stdNo`, c.`stdName`, a.`lecName`, a.`lecNo`, b.`regMidScore`, b.`regFinalScore`, b.`regTotalScore`, b.`regGrade` from `Lecture` as a join `Register` as b on a.lecNo = b.regLecNo join `Student` as c on b.regStdNo = c.stdNo");
	
	while(rs.next()) {
		registerBean rb = new registerBean();
		rb.setStdNo(rs.getString(1));
		rb.setStdName(rs.getString(2));
		rb.setLecName(rs.getString(3));
		rb.setLecNo(rs.getInt(4));
		rb.setRegMidScore(rs.getInt(5));
		rb.setRegFinalScore(rs.getInt(6));
		rb.setRegTotalScore(rs.getInt(7));
		rb.setRegGrade(rs.getString(8));
		
		registers.add(rb);
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}

%>

<!DOCTYPE jsp>
<jsp>
	<head>
		<meta charset="UTF-8">
		<title>수강관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function() {
				$('.btnSearch').click(function(){
					let stdNo = $(this).val();
					$('section').show();
				});
				
				$('.btnClose').click(function(){
					$('section').hide();
				});
				
				$('input[type=submit]').click(function(){
					
					let stdNo = $('input[name=stdNo]').val();
					let stdName = $('input[name=stdName]').val();
					let lecName = $('input[name=lecName]').val();
					
					let jsonData = {
							"stdNo":stdNo,
							"stdName":stdName,
							"lecName":lecName,
						};
					
					$.post('./registerProc.jsp', jsonData, function(data){
						
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
		<h2>수강관리</h2>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		<h3>수강현황</h3>
		<input type="text"/>
		<button class="btnSearch">검색</button>
		<button class="btnApply">수강신청</button>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
			<% for(registerBean rb : registers) { %>
			<tr>
				<td><%= rb.getStdNo() %></td>
				<td><%= rb.getStdName() %></td>
				<td><%= rb.getLecName() %></td>
				<td><%= rb.getLecNo() %></td>
				<td><%= rb.getRegMidScore() %></td>
				<td><%= rb.getRegFinalScore() %></td>
				<td><%= rb.getRegTotalScore() %></td>
				<td><%= rb.getRegGrade() %></td>
			</tr>
			<% } %>
		</table>
		<section style="display:none;">
			<h3>수강신청</h3>
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
					<td>신청강좌</td>
					<td>
						<select name="lecName">
							  <option value='' selected>강좌선택</option>
							  <option value='1' selected>운영체제론</option>
							  <option value='2' selected>무역영문</option>
							  <option value='3' selected>세법개론</option>
							  <option value='4' selected>빅데이터 개론</option>
							  <option value='5' selected>컴퓨팅사고와 코딩</option>
							  <option value='6' selected>사회복지 마케팅</option>
							  <option value='7' selected>컴퓨터 구조론</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"/></td>
				</tr>
			</table>
		</section>
	</body>
</jsp>