<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="/Kmarket/img/favicon.ico" />
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
            <a href="/Kmarket/"><img src="/Kmarket/img/header_logo.png" alt="로고" /></a>
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
              <li><a href="/Kmarket/cs/faq/list.do?cate1=1">자주묻는질문</a></li>
              <li><a href="/Kmarket/cs/qna/list.do?cate1=1">문의하기</a></li>
              <li><a href="/Kmarket/cs/index.do">고객센터</a></li>
            </ul>
          </div>
        </div>
      </header>
      
      <main id="product">            
            <aside>
				<ul class="category">
		        	<li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
		            <li>
		              <a href="#"><i class="fas fa-shopping-bag"></i>브랜드 패션<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=10&sort=sold">브랜드 여성의류</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=11&sort=sold">브랜드 남성의류</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=12&sort=sold">브랜드 진/캐쥬얼</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=13&sort=sold">브랜드 신발/가방</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=14&sort=sold">브랜드 쥬얼리/시계</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=10&cate2=15&sort=sold">브랜드 아웃도어</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-tshirt"></i>패션의류·잡화·뷰티<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=10&sort=sold">여성의류</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=11&sort=sold">남성의류</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=12&sort=sold">언더웨어</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=13&sort=sold">신발</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=14&sort=sold">가방/잡화</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=15&sort=sold">쥬얼리/시계</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=16&sort=sold">화장품/향수</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=11&cate2=17&sort=sold">바디/헤어</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-baby-carriage"></i>유아동<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=12&cate2=10&sort=sold">출산/육아</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=12&cate2=11&sort=sold">장난감/완구</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=12&cate2=12&sort=sold">유아동 의류</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=12&cate2=13&sort=sold">유아동 신발/잡화</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-utensils"></i>식품·생필품<i class="fas fa-angle-right" ></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=10&sort=sold">신선식품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=11&sort=sold">가공식품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=12&sort=sold">건강식품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=13&sort=sold">커피/음료</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=14&sort=sold">생필품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=13&cate2=15&sort=sold">바디/헤어</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-home"></i>홈데코·문구·취미·반려<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=10&sort=sold">가구/DIY</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=11&sort=sold">침구/커튼</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=12&sort=sold">조명/인테리어</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=13&sort=sold">생활용품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=14&sort=sold">주방용품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=15&sort=sold">문구/사무용품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=16&sort=sold">사무기기</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=17&sort=sold">악기/취미</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=14&cate2=18&sort=sold">반려동물용품</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-tv"></i>컴퓨터·디지털·가전<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=10&sort=sold">노트북/PC</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=11&sort=sold">모니터/프린터</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=12&sort=sold">PC주변기기</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=13&sort=sold">모바일/태블릿</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=14&sort=sold">카메라</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=15&sort=sold">게임</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=16&sort=sold">영상가전</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=17&sort=sold">주방가전</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=18&sort=sold">계절가전</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=19&sort=sold">생활/미용가전</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=20&sort=sold">음향가전</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=15&cate2=21&sort=sold">건강가전</a></li>
		              </ol>                                          
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-running"></i>스포츠·건강·렌탈<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=10&sort=sold">스포츠의류/운동화</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=11&sort=sold">휘트니스/수영</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=12&sort=sold">구기/라켓</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=13&sort=sold">골프</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=14&sort=sold">자전거/보드/기타레저</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=15&sort=sold">캠핑/낚시</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=16&sort=sold">등산/아웃도어</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=17&sort=sold">건강/의료용품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=18&sort=sold">건강식품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=16&cate2=19&sort=sold">렌탈서비스</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-car"></i>자동차·공구<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=17&cate2=10&sort=sold">자동차용품</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=17&cate2=11&sort=sold">공구/안전/산업용품</a></li>
		              </ol>
		            </li>
		            <li>
		              <a href="#"><i class="fas fa-book"></i>여행·도서·티켓·e쿠폰<i class="fas fa-angle-right"></i></a>
		              <ol>
		                <li><a href="/Kmarket/product/list.do?cate1=18&cate2=10&sort=sold">여행/항공권</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=18&cate2=11&sort=sold">도서/음반/e교육</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=18&cate2=12&sort=sold">공연티켓</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=18&cate2=13&sort=sold">e쿠폰</a></li>
		                <li><a href="/Kmarket/product/list.do?cate1=18&cate2=14&sort=sold">상품권</a></li>
		              </ol>
		            </li>
		          </ul>
            </aside>
      