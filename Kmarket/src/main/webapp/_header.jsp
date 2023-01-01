<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="/Kmarket/css/common.css"/>
    <link rel="stylesheet" href="/Kmarket/product/css/product.css"/>
    <script>
      $(document).ready(function () {
        $(".slider > ul").bxSlider({
          easing: "linear",
        });
      });

      $(function () {
        var best = $("aside > .best");

        $(window).scroll(function () {
          var t = $(this).scrollTop();

          if (t > 620) {
            best.css({
              position: "fixed",
              top: "0",
            });
          } else {
            best.css({ position: "static" });
          }
        });
      });
    </script>
  </head>
  <body>
    <div id="wrapper">
      <header>
        <div class="top">
          <div>
          		<c:if test="${ sessUser.type eq 2}">
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
          </div>
        </div>
        <div class="logo">
          <div>
            <a href="/Kmarket/"><img src="./img/header_logo.png" alt="로고" /></a>
            <form action="#">
              <input type="text" name="search" />
              <button><i class="fa fa-search"></i></button>
            </form>
          </div>
        </div>
        <div class="menu">
          <div>
            <ul>
              <li><a href="#">히트상품</a></li>
              <li><a href="#">추천상품</a></li>
              <li><a href="#">최신상품</a></li>
              <li><a href="#">인기상품</a></li>
              <li><a href="#">할인상품</a></li>
            </ul>
            <ul>
              <li><a href="/Kmarket/cs/notice/list.do?cate=1">공지사항</a></li>
              <li><a href="/Kmarket/cs/faq/list.do?cate1=1" > 자주묻는질문</a></li>
              <li><a href="/Kmarket/cs/qna/list.do?cate1=1">문의하기</a></li>
              <li><a href="/Kmarket/cs/index.do">고객센터</a></li>
            </ul>
          </div>
        </div>
      </header>