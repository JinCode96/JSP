<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./_header.jsp"></jsp:include>
<script>
</script>

      <main>
        <!-- 카테고리/베스트 상품 영역 -->
        <aside>
          <!-- 카테고리 -->
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

          <!-- 베스트상품 배너 -->
          <article class="best">
            <h1><i class="fas fa-crown"></i>베스트상품</h1>
            <ol>
             
              <c:forEach var="product" items="${best}">
              <li>
           <a href="/Kmarket/product/view.do?cate1=${product.prodCate1}&cate2=${product.prodCate2}&prodNo=${product.prodNo}">
                  <div class="thumb">
                  <c:set var="i" value="${i+1}"/>
                    <i>${i}</i>
                    <img src="<c:url value="${product.thumb1}" />" alt="item1" />
                  </div>
                  <article>
                    <h2>${product.prodName}</h2>
                    <div class="org_price">
                      <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                      <span>${product.discount}%</span>
                    </div>
                    <div class="dis_price">
                      <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                    </div>
                  </article>
                </a>
              </li>
              </c:forEach>
          
                </a>
              </li>
            </ol>
          </article>
        </aside>
        <section>
          <!-- 슬라이더 영역 -->
          <section class="slider">
           <ul>
              <li>
                <a href="#"><img src="./img/item1.jpg" alt="item1" /></a>
              </li>
              <li>
                <a href="#" ><img src="./img/item2.jpg" alt="item2"/></a>
              </li>
              <li>
                <a href="#" ><img src="./img/item3.jpg" alt="item3" /></a>
              </li>
              <li>
                <a href="#"><img src="./img/item4.jpg" alt="item4" /></a>
              </li>
              <li>
                <a href="#"><img src="./img/item5.jpg" alt="item5" /></a>
              </li>
            </ul>
          </section>
          <!-- 히트상품 영역 -->
          <section class="hit">
            <h3><span>히트상품</span></h3>
             <c:forEach var="product" items="${hitproducts}">
            <article>
              <a href="/Kmarket/product/view.do?cate1=${product.prodCate1}&cate2=${product.prodCate2}&prodNo=${product.prodNo}">
                <div class="thumb">
                  <img src="<c:url value='${product.thumb2}'/>"  alt="t1" />
                </div>
	                        
                <h2>${product.prodName}</h2>
                <p>${product.descript}</p>
                <div class="org_price">
                  <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                  <span>${product.discount}%</span>
                </div>
                <div class="dis_price">
                  <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                  <c:if test="${ product.delivery eq 0}">
                  <span class="free">${product.delivery}</span>
                  </c:if>
                  <c:if test="${product.delivery ne 0}">
                  	<span>배송비 <fmt:formatNumber value="${product.delivery}" pattern="#,###"/>원</span>
                  </c:if>
                </div>
              </a>
            </article>
                </c:forEach>
          </section>
          <!-- 추천상품 영역 -->
          <section class="recommend">
            <h3><span>추천상품</span></h3>
          <c:forEach var="product" items="${scoreproducts}">
            <article>
              <a href="/Kmarket/product/view.do?cate1=${product.prodCate1}&cate2=${product.prodCate2}&prodNo=${product.prodNo}">
                <div class="thumb">
                  <img src="<c:url value='${product.thumb2}'/>"  alt="t1" />
                </div>
	                        
                <h2>${product.prodName}</h2>
                <p>${product.descript}</p>
                <div class="org_price">
                  <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                  <span>${product.discount}%</span>
                </div>
                <div class="dis_price">
                  <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                 <c:if test="${ product.delivery eq 0}">
                  <span class="free">${product.delivery}</span>
                  </c:if>
                  <c:if test="${product.delivery ne 0}">
                  	<span>배송비 <fmt:formatNumber value="${product.delivery}" pattern="#,###"/></span>
                  </c:if>
                </div>
              </a>
            </article>
                </c:forEach>
          </section>
          <!-- 최신상품 영역 -->
          <section class="new">
            <h3><span>최신상품</span></h3>
           <c:forEach var="product" items="${newproducts}">
            <article>
              <a href="/Kmarket/product/view.do?cate1=${product.prodCate1}&cate2=${product.prodCate2}&prodNo=${product.prodNo}">
                <div class="thumb">
                  <img src="<c:url value='${product.thumb2}'/>"  alt="t1" />
                </div>
	                        
                <h2>${product.prodName}</h2>
                <p>${product.descript}</p>
                <div class="org_price">
                  <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                  <span>${product.discount}%</span>
                </div>
                <div class="dis_price">
                  <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                 <c:if test="${ product.delivery eq 0}">
                  <span class="free">${product.delivery}</span>
                  </c:if>
                  <c:if test="${product.delivery ne 0}">
                  	<span>배송비 <fmt:formatNumber value="${product.delivery}" pattern="#,###"/></span>
                  </c:if>
                </div>
              </a>
            </article>
                </c:forEach>
          </section>
          <!-- 할인상품 영역 -->
          <section class="discount">
            <h3><span>할인상품</span></h3>
                   <c:forEach var="product" items="${disproducts}">
            <article>
              <a href="/Kmarket/product/view.do?cate1=${product.prodCate1}&cate2=${product.prodCate2}&prodNo=${product.prodNo}">
                <div class="thumb">
                  <img src="<c:url value='${product.thumb2}'/>"  alt="t1" />
                </div>
	                        
                <h2>${product.prodName}</h2>
                <p>${product.descript}</p>
                <div class="org_price">
                  <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                  <span>${product.discount}%</span>
                </div>
                <div class="dis_price">
                  <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                 <c:if test="${ product.delivery eq 0}">
                  <span class="free">${product.delivery}</span>
                  </c:if>
                  <c:if test="${product.delivery ne 0}">
                  	<span>배송비 <fmt:formatNumber value="${product.delivery}" pattern="#,###"/></span>
                  </c:if>
                </div>
              </a>
            </article>
                </c:forEach>
           
          </section>
        </section>
      </main>
<jsp:include page="./_footer.jsp"></jsp:include>