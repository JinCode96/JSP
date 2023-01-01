<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"></jsp:include>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="view">
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
                            <h2 class="title">[${article.c2Name}] ${article.title}</h2>
                            <p>
                                <span>${(article.uid).substring(0,3)}**</span>
                                <span>${(article.rdate).substring(0, 10)}</span>
                            </p>
                        </nav>

                        <div class="content">
                            <p>
                                ${article.content}
                            </p>
                           	<br/><br/><br/>
                           	<p>
                                [답변] ${article.c2Name}
                               	<br/>
                               	<!-- 답변 넣기 -->
                               	안녕하세요 회원님, 불편을 드려서 죄송합니다.
                               	<br/>
                               	<br/>
                            </p>
                            <p>
                                ※ 피싱 관련 피해신고
                                ▶ 경찰청 사이버수사국 (국번없이)182 :
                                http://cyberbureau.police.go.kr<br/>
                                ▶ KISA 인터넷침해대응센터 (국번없이)118 :
                                http://www.krcert.or.kr<br/>
                                감사합니다.<br/>
                            </p>
                        </div>
                        <a href="/Kmarket/cs/qna/list.do?cate1=${cate1}" class="btnList">목록보기</a>
                    </article>
                </section>
            </div>
        </section>

       <jsp:include page="../_footer.jsp"></jsp:include>