<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>케이마켓::고객센터</title>
    <link rel="shortcut icon" type="image/x-icon" href="/Kmarket/img/favicon.ico" />
    <link rel="stylesheet" href="/Kmarket/cs/css/style.css">
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
  </head>
  <body>
    <div id="wrapper">
      <header>
        <div class="top">
          <div>
            <p>
            	<c:if test="${sessUser.type eq 2}">
	            	<a href="/Kmarket/admin/index.do">관리자</a>
	            </c:if>
              	<c:choose>
	          		<c:when test="${sessUser eq null}">
			            <a href="/Kmarket/member/login.do">로그인</a>
			            <a href="/Kmarket/member/join.do">회원가입</a>
		            </c:when>
		            <c:otherwise>
		            	<a href="/Kmarket/member/logout.do">로그아웃</a>
		            </c:otherwise>
            	</c:choose>
              <a href="#">마이페이지</a>
              <a href="/Kmarket/product/cart.do"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;장바구니</a>
            </p>
          </div>
        </div>
        <div class="logo">
          <div>

            <a href="/Kmarket/cs/index.do"><img src="/Kmarket/cs/images/logo.png" alt="로고" />고객센터</a>

          </div>
        </div>
      </header>
