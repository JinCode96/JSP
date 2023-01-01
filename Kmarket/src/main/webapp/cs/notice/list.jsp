<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../_header.jsp"></jsp:include>
            <section id="cs">
                <div class="notice">
                    <nav>
                        <div>
                            <p>홈<span>></span>공지사항</p>
                        </div>
                    </nav>
                    <section class="list">
                        <aside>
                            <h2>공지사항</h2>
                            <ul>
                                <li class="${cate eq '1'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=1">고객서비스</a></li>
                                <li class="${cate eq '2'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=2">안전거래</a></li>
                                <li class="${cate eq '3'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=3">위해상품</a></li>
                                <li class="${cate eq '4'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=4">이벤트당첨</a></li>
                            </ul>
                        </aside>
                        <article>
                            <nav>
                                <h1>${cateName}</h1>
                                <h2>공지사항 <${cateName}> 내용입니다.</h2>
                            </nav>

                            <table>
                            <c:forEach var="article" items="${articles}">
                                <tr>
                                    <td><a href="/Kmarket/cs/notice/view.do?cate=${cate}&no=${article.no}">[${article.cateName}] ${article.title}</a></td>
                                    <td>${(article.rdate).substring(0,10)}</td>
                                </tr>
                            </c:forEach>
                            </table>

                            <div class="page">
                                <c:if test="${pageGroupStart > 1}">
		                            <a href="/Kmarket/cs/notice/list.do?cate=${cate}&pg=${pageGroupStart-1}" class="prev">이전</a>
		                           	</c:if>
		                           	<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                           	<a href="/Kmarket/cs/notice/list.do?cate=${cate}&pg=${i}" class="num ${currentPage == i ? 'on':'off'}">${i}</a>
		                           	</c:forEach>
		                           	<c:if test="${pageGroupEnd < lastPageNum}">
		                            <a href="/Kmarket/cs/notice/list.do?cate=${cate}&pg=${pageGroupEnd+1}" class="next">다음</a>
                            	</c:if>
                            </div>
                        </article>
                    </section>
                </div>
            </section>

            <jsp:include page="../_footer.jsp"></jsp:include>