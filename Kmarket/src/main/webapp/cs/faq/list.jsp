<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>\
<script>

	$(function(){
        $('.more').click(function(e){
          e.preventDefault();
          
          let item = $(this).parent().find('> li:nth-child(n+4)');
          let isVisible = item.is(':visible');

          console.log('isVisible : ' + isVisible);

          if(isVisible && item.css('display') == 'none'){
        	  item.slideDown(300);
        	  $(this).find('> a').text('간단히보기');
        	  
          }else if(isVisible && item.css('display') == 'list-item'){
        	  item.slideUp(300);
        	  $(this).find('> a').text('더보기');
              
          }
          
        });
      });

</script>
    <section id="cs">
        <div class="faq">
        <nav>
            <div>
            <p>홈<span>></span>자주묻는 질문</p>
            </div>
        </nav>
        <section class="list">
            <aside>
            <h2>자주묻는 질문</h2>
            <ul>
                <li class="${cate1 eq '1'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=1">회원</a></li>
                <li class="${cate1 eq '2'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=2">쿠폰/이벤트</a></li>
                <li class="${cate1 eq '3'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=3">주문/결제</a></li>
                <li class="${cate1 eq '4'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=4">배송</a></li>
                <li class="${cate1 eq '5'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=5">취소/반품/교환</a></li>
                <li class="${cate1 eq '6'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=6">여행/숙박/항공</a></li>
                <li class="${cate1 eq '7'?'on':'off'}"><a href="/Kmarket/cs/faq/list.do?cate1=7">안전거래</a></li>
            </ul>
            </aside>
            <article>  
            
			 <c:if test="${cate1 eq 1}">
					<nav>
		                <h1>회원</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=1&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	            
	           <c:if test="${cate1 eq 2}">
					<nav>
		                <h1>쿠폰/이벤트</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=2&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	           
	           <c:if test="${cate1 eq 3}">
					<nav>
		                <h1>주문/결제</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=3&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	           
	           <c:if test="${cate1 eq 4}">
					<nav>
		                <h1>배송</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=4&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	           
	           <c:if test="${cate1 eq 5}">
					<nav>
		                <h1>취소/반품/교환</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=5&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	           
	           <c:if test="${cate1 eq 6}">
					<nav>
		                <h1>여행/숙박/항공</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=6&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
	           
	           <c:if test="${cate1 eq 7}">
					<nav>
		                <h1>안전거래</h1>
		                <h2>가장 자주 묻는 질문입니다.</h2>
		            </nav>      
				 	
		            <c:forEach var="cate" items="${cateNames}">
						<div>
			                <h3>${cate.c2Name}</h3>
			                <ul>
			                	
				                <c:forEach var="article" items="${articles}">
					                <c:if test="${cate.cate2 eq article.cate2}">
						                <li><a href="/Kmarket/cs/faq/view.do?cate1=7&faqNo=${article.faqNo}"><span>Q.</span>${article.title}</a></li>
						            </c:if>
				                </c:forEach>
				                
				                <li class="more"><a href="#">더보기</a></li>
			                </ul>
			            </div>
		            </c:forEach>
	           </c:if>
			
            </article>
        </section>
        </div>
    </section>

    <jsp:include page="../_footer.jsp"></jsp:include>