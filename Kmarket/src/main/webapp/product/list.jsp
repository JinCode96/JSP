<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./_header.jsp"></jsp:include>
            
            <section class="list">              
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>상품목록</h1>
                    <p>HOME > <span>${c1Name}</span> > <strong>${c2Name}</strong></p>
                </nav>

                <!-- 정렬 메뉴 -->
                <ul class="sort">
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=sold" class="${sort eq 'sold'?'on':'off'}">판매많은순</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=lowprice" class="${sort eq 'lowprice'?'on':'off'}">낮은가격순</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=highprice" class="${sort eq 'highprice'?'on':'off'}">높은가격순</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=score" class="${sort eq 'score'?'on':'off'}">평점높은순</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=review" class="${sort eq 'review'?'on':'off'}">후기많은순</a></li>
                    <li><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=rdate" class="${sort eq 'rdate'?'on':'off'}">최근등록순</a></li>
                </ul>

                <!-- 상품목록 -->              
                <table border="0">     
                    <c:forEach var="product" items="${products}">
                    <tr>
                    <td><a href="/Kmarket/product/view.do?cate1=${cate1}&cate2=${cate2}&prodNo=${product.prodNo}" class="thumb"><img src="<c:url value='${product.thumb1}'/>" alt="상품이미지"/></a></td>
                    <td>
                        <h3 class="name"><a href="/Kmarket/product/view.do?cate1=${cate1}&cate2=${cate2}&prodNo=${product.prodNo}" class="name">${product.prodName}</a></h3>
                        <a href="/Kmarket/product/view.do?cate1=${cate1}&cate2=${cate2}&prodNo=${product.prodNo}" class="desc">${product.descript}</a>
                    </td>
                    <td>
                        <ul>
                        <li><ins class="dis-price"><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins></li>
                        <li>
                            <del class="org-price"><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                            <span class="discount">${product.discount}%</span>
                        </li>
                        <c:if test="${product.delivery eq 0}"><li><span class="free-delivery">무료배송</span></li></c:if>
                        <c:if test="${product.delivery ne 0}"><li>배송비&nbsp;<fmt:formatNumber value="${product.delivery}" pattern="#,###"/>원</span></li></c:if>
                        </ul>
                    </td>
                    <td>
                        <h4 class="seller"><i class="fas fa-home"></i>&nbsp;${product.company}</h4>
                        <h5 class="badge power">판매자등급</h5>
                        <h6 class="rating star1" style="width:${product.score}px">상품평</h6>
                    </td>
                    </tr>
					</c:forEach>
                </table>            

                <!-- 상품목록 페이지번호 -->
                <div class="paging">
                	<c:if test="${pageGroupStart > 1}">
                    <span class="prev"><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=${sort}&pg=${pageGroupStart-1}"><&nbsp;이전</a></span>
                    </c:if>
                    <span class="num">
                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=${sort}&pg=${i}" class="${currentPage == i ? 'on':'off'}">${i}</a>
					</c:forEach>
                    </span>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    <span class="next"><a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=${sort}&pg=${pageGroupEnd+1}">다음&nbsp;></a></span>
                    </c:if>
                </div>

                </section>
            </main>
<jsp:include page="./_footer.jsp"></jsp:include>