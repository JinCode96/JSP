<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../_header.jsp"></jsp:include>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="list">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="${cate1 eq '1'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=1">회원</a></li>
                            <li class="${cate1 eq '2'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=2">쿠폰/이벤트</a></li>
                            <li class="${cate1 eq '3'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=3">주문/결제</a></li>
                            <li class="${cate1 eq '4'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=4">배송</a></li>
                            <li class="${cate1 eq '5'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=5">취소/반품/교환</a></li>
                            <li class="${cate1 eq '6'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=6">여행/숙박/항공</a></li>
                            <li class="${cate1 eq '7'?'on':'off'}"><a href="/Kmarket/cs/qna/list.do?cate1=7">안전거래</a></li>
                        </ul>
                    </aside>
                    <article>
                        <nav>
                            <h1>${c1name}</h1>
                            <h2>${c1name} 문의 내용입니다.</h2>
                        </nav>
                        <table style="table-layout: fixed">
                        	<c:forEach var="article" items="${articles}">
                            <tr>
                                <td><a href="/Kmarket/cs/qna/view.do?&cate1=${cate1}&no=${article.no}">[${article.c2Name}] ${article.title}</a></td>
                                <c:choose>
                                	<c:when test="${article.comment eq 0}">
                                		<td width="130px" style="color:#A0A0A0; font-size:16px">검토중</td>
                                	</c:when>
                                	<c:otherwise>
                                		<td width="130px" style="color:#0080FF; font-size:16px">답변완료</td>
                                	</c:otherwise>
                                </c:choose>
                                <td width="110px">${(article.uid).substring(0,3)}**</td>
                                <td width="110px">
                                	<fmt:parseDate value="${article.rdate}" var="rdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${rdate}" pattern="yy.MM.dd"/> 
                                </td>
                            </tr>
                            </c:forEach>
                            <c:if test="${total eq 0}">
                            <tr>
                                <td colspan="4" align="center" style="font-size:16px">등록된 문의글이 없습니다.</td>
                            </tr>
                            </c:if>
                        </table>

                        <div class="page">
                        	<c:if test="${pageGroupStart > 1}">
                            <a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${pageGroupStart-1}" class="prev">이전</a>
                           	</c:if>
                           	<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                           	<a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${i}" class="num ${currentPage == i ? 'on':'off'}">${i}</a>
                           	</c:forEach>
                           	<c:if test="${pageGroupEnd < lastPageNum}">
                            <a href="/Kmarket/cs/qna/list.do?cate1=${cate1}&pg=${pageGroupEnd+1}" class="next">다음</a>
                            </c:if>
                        </div>
                        
                        <a href="/Kmarket/cs/qna/write.do?cate1=${cate1}" class="btnWrite">문의하기</a>
                   
                    </article>
                </section>
            </div>
        </section>

       <jsp:include page="../_footer.jsp"></jsp:include>