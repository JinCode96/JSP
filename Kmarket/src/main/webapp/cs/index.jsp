<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./_header.jsp"></jsp:include>
      <section id="cs">
        <div class="main">
          <h1 class="title"><strong>케이마켓</strong>이 도와드릴게요!</h1>              
          <section class="notice">
            <h1>공지사항<a href="/Kmarket/cs/notice/list.do?cate=1">전체보기</a></h1>
            <ul>
              <c:forEach var="notice" items="${notices}">
              <li>

                <a href="/Kmarket/cs/notice/view.do?cate=${notice.cate}&no=${notice.no}" class="title">${notice.title}</a>

                <span class="date">
				  <fmt:parseDate value="${notice.rdate}" var="rdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                  <fmt:formatDate value="${rdate}" pattern="yy.MM.dd"/> 
				</span>
              </li>
              </c:forEach>
            </ul>
          </section>
        
          <section class="faq">
            <h1>자주 묻는 질문<a href="/Kmarket/cs/faq/list.do?cate1=1">전체보기</a>
            </h1>
            <ol>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=1"><span>회원</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=2"><span>쿠폰/이벤트</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=3"><span>주문/결제</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=4"><span>배송</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=5"><span>취소/반품/교환</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=6"><span>여행/숙박/항공</span></a>
              </li>
              <li>
                <a href="/Kmarket/cs/faq/list.do?cate1=7"><span>안전거래</span></a>
              </li>
            </ol>
          </section>
        
          <section class="qna">
            <h1>
              문의하기
              <a href="/Kmarket/cs/qna/list.do?cate1=1">전체보기</a>
            </h1>
            <ul>
              <c:forEach var="qna" items="${qnas}">
              <li>

                <a href="/Kmarket/cs/qna/view.do?cate1=${qna.cate1}&no=${qna.no}" class="title">[${qna.c1Name}] ${qna.title}</a>

                <p>
                  <span class="uid">${(qna.uid).substring(0,3)}**</span>
                  <span class="date">
                  	<fmt:parseDate value="${qna.rdate}" var="rdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                  	<fmt:formatDate value="${rdate}" pattern="yy.MM.dd"/> 
                  </span>
                </p>
              </li>
              </c:forEach>
            </ul>
            <a href="/Kmarket/cs/qna/write.do?cate1=1" class="ask">문의글 작성 ></a>
          </section>

          <section class="tel">
            <h1>
              1:1 상담이 필요하신가요?
            </h1>

            <article>
              <div>
                <h3>고객센터 이용안내</h3>
                <p>
                  <span>일반회원/비회원</span><br>
                  <strong>1566-0001</strong><span>(평일 09:00 ~ 18:00)</span>
                </p>
                <p>
                  <span>스마일클럽 전용</span><br>
                  <strong>1566-0002</strong><span>(365일 09:00 ~ 18:00)</span>
                </p>
              </div>
            </article>
            <article>
              <div>
                <h3>판매상담 이용안내</h3>
                <p>
                  <span>판매고객</span><br>
                  <strong>1566-5700</strong><span>(평일 09:00 ~ 18:00)</span>
                </p>
                <p>
                  <a href="#">판매자 가입 및 서류 접수 안내 〉</a>
                </p>                
              </div>
            </article>

          </section>
      </section>
<jsp:include page="./_footer.jsp"></jsp:include>