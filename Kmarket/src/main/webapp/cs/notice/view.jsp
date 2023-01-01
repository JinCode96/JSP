<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"></jsp:include>
            <section id="cs">
                <div class="notice">
                    <nav>
                        <div>
                            <p>홈<span>></span>공지사항</p>
                        </div>
                    </nav>
                    <section class="view">
                        <aside>
                            <h2>공지사항</h2>
                            <ul>
                                <li class="${cate eq '1'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=1">고객서바스</a></li>
                                <li class="${cate eq '2'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=2">안전거래</a></li>
                                <li class="${cate eq '3'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=3">위해상품</a></li>
                                <li class="${cate eq '4'?'on':'off'}"><a href="/Kmarket/cs/notice/list.do?cate=4">이벤트당첨</a></li>
                            </ul>
                        </aside>
                        <article>
                            <nav>
                                <h2 class="title">[${article.cateName}] ${article.title}</h2>
                                <span class="data">${(article.rdate).substring(0, 10)}</span>
                            </nav>
                            <div class="content">
                                <p>
									${article.content}
                                </p>
                                <br/><br/><br/>
                                <p>
                                    ※ 피싱 관련 피해신고<br /><br />
                                    ▶ 경찰청 사이버수사국(국번없이)182 :
                                    http://cyberbureau.poloce.go.kr<br />
                                    ▶ KISA 인터넷침해대응센터(국번없이)118 :
                                    http://www.krcert.or.kr<br />
                                    감사합니다.<br />
                                </p>
                            </div>
                            <a href="/Kmarket/cs/notice/list.do?cate=1" class="btnList">목록보기</a>
                        </article>
                    </section>
                </div>
            </section>

            <jsp:include page="../_footer.jsp"></jsp:include>