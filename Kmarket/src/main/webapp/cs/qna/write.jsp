<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	// 확인용 콘솔 로그
	$(function(){
		$('input[name=title]').focusout(function({
			let title = $('input[name=title]').val();
			console.log("title: "+title);
		})
	});
</script>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="write">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>

                            <li class="${cate1 eq '1' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=1">회원</a></li>
                            <li class="${cate1 eq '2' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=2">쿠폰/이벤트</a></li>
                            <li class="${cate1 eq '3' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=3">주문/결제</a></li>
                            <li class="${cate1 eq '4' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=4">배송</a></li>
                            <li class="${cate1 eq '5' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=5">취소/반품/교환</a></li>
                            <li class="${cate1 eq '6' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=6">여행/숙박/항공</a></li>
                            <li class="${cate1 eq '7' ? 'on':'off'}"><a href="/Kmarket/cs/qna/write.do?cate1=7">안전거래</a></li>

                        </ul>
                    </aside>
                    <article>
                        <form action="/Kmarket/cs/qna/write.do" method="post">
                        <input type="hidden" name="uid" value="${sessUser.uid}"/>
                        <input type="hidden" name="cate1" value="${cate1}"/>
                            <table>
                                <tr>
                                    <td>문의유형</td>
                                    <td>
	                                    <c:if test="${cate1 eq 1}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">가입</option>
	                                            <option value="2">탈퇴</option>
	                                            <option value="3">회원정보</option>
	                                            <option value="4">로그인</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 2}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">쿠폰/할인혜택</option>
	                                            <option value="2">포인트</option>
	                                            <option value="3">제휴</option>
	                                            <option value="4">이벤트</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 3}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">상품</option>
	                                            <option value="2">결제</option>
	                                            <option value="3">구매내역</option>
	                                            <option value="4">영수증/증빙</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 4}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">배송상태/기간</option>
	                                            <option value="2">배송정보확인/변경</option>
	                                            <option value="3">해외배송</option>
	                                            <option value="4">당일배송</option>
	                                            <option value="5">해외직구</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 5}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">반품신청/철회</option>
	                                            <option value="2">반품정보확인/변경</option>
	                                            <option value="3">교환 AS신청/철회</option>
	                                            <option value="4">교환정보확인/변경</option>
	                                            <option value="5">취소신청/철회</option>
	                                            <option value="6">취소확인/환불정보</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 6}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">여행/숙박</option>
	                                            <option value="2">항공</option>
	                                        </select>
	                                    </c:if>
	                                    <c:if test="${cate1 eq 7}">
	                                        <select name="cate2">
	                                            <option value="0">선택</option>
	                                            <option value="1">서비스 이용규칙 위반</option>
	                                            <option value="2">지식재산권침해</option>
	                                            <option value="3">법령 및 정책위반 상품</option>
	                                            <option value="4">게시물 정책위반</option>
	                                            <option value="5">직거래/외부거래유도</option>
	                                            <option value="6">표시광고</option>
	                                            <option value="7">청소년 위해상품/이미지</option>
	                                        </select>
	                                    </c:if>

                                    </td>
                                </tr>
                                <tr>
                                    <td>문의제목</td>
                                    <td>
                                        <input type="text" name="title" placeholder="제목을 입력하세요." required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td>
                                        <textarea name="content" placeholder="내용을 입력하세요." required></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <a href="/Kmarket/cs/qna/list.do?cate1=${cate1}" class="btnList">취소하기</a>
                                <input type="submit" class="btnSubmit" value="등록하기">
                            </div>
                        </form>
                    </article>
                </section>
            </div>
        </section>
<jsp:include page="../_footer.jsp"></jsp:include>