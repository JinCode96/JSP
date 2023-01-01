<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./_header.jsp"></jsp:include>
<script>

	$(document).ready(function(){

		// 배송 날짜 구하기
		
		let delivery = new Date();
		let arrival = $('.arrival');
		
		let day = delivery.getDay();
				
		if(day == 5){ // 금요일일 때
		
			delivery.setDate(delivery.getDate()+4);
			
		}else if(day == 6 || 0){ // 주말일 때
			
			delivery.setDate(delivery.getDate()+3);
			
		}else { // 평일일 때
			
			delivery.setDate(delivery.getDate()+2);
		}
		
		let d1 = ['일', '월', '화', '수', '목', '금', '토'];
		
		let dateFormat = (delivery.getMonth()+1) + '/' + delivery.getDate() + '('+ d1[delivery.getDay()] +')  도착예정';
		
		arrival.text(dateFormat);
		
		
		// 상품 수량 더하기
		$('.increase').click(function(){
			
			let num = $('input[name=num]').val();
			
			let count = parseInt(num) + 1;
			
			$('input[name=num]').attr('value', count);
			
			// 총 주문금액 
			let disprice = "${product.disprice}";
			let total = disprice * count;
			total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 정규식을 사용하여 세 자릿수마다 , 를 넣기
			
			
			$('.total > span').text(total);
			
		});
		
		// 상품 수량 빼기
		$('.decrease').click(function(){
			
			let num = $('input[name=num]').val();
			
			if(num > 1){
			
				let count = parseInt(num) - 1;
				
				$('input[name=num]').attr('value', count);
				
				// 총 주문금액
				let disprice = "${product.disprice}";
				let total = disprice * count;
				total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
				$('.total > span').text(total);
			}
		
		});
		
		
		// 장바구니
		$('.cart').click(function(){
				
			let uid = "${sessUser.uid}";
			let prodNo = "${product.prodNo}";
			let count = $('input[name=num]').val();
			let price = "${product.price}";
			let discount = "${product.discount}";
			let point = "${product.point}";
			let delivery = "${product.delivery}";
			
			let jsonData = {
					
				"uid":uid,
				"prodNo":prodNo,
				"count":count,
				"price":price,
				"discount": discount,
				"point": point,
				"delivery":delivery
			}
			
			if(uid == "") {
				alert('로그인 후 물건을 장바구니에 담아주세요.');
				return;
			}
			
			$.ajax({
				url: '/Kmarket/product/addcart.do',
				method: 'POST',
				data: jsonData,
				dataType: 'json',
				success:function(data){
					
					if(data.result > 0) {
						
						let goCart = confirm('물건이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?'); 
						
						if(goCart){
							location.href = "/Kmarket/product/cart.do";
						}
						
					}else {
						
						alert('장바구니에 물건이 담기지 않았습니다.\n잠시 후 다시 시도해주세요. ');
					}
				}
			});
					
		});
		
		// 주문하기
		$('.order').click(function(){
			
			let uid = "${sessUser.uid}";
			let prodNo = "${product.prodNo}";
			let count = $('input[name=num]').val();
			
			let jsonData = {					
				"prodNo":prodNo,
				"count":count
			}
			
			if(uid == "") {
				alert('로그인 후 주문이 가능합니다.');
				return;
			}
			
			$.ajax({
				url: '/Kmarket/product/view.do',
				method: 'POST',
				data: jsonData,
				dataType:'json',
				success: function(data){
				
					if(data.result > 0) {
						location.href = "/Kmarket/product/order.do"
					}else{
						alert('주문하기를 실패하였습니다.\n잠시 후 다시 시도해주세요. ');
					}
				}
				
			});
					
		});

	});
</script>
            <!-- 상품 상세페이지 시작 -->
            <section class="view">

                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>상품보기</h1>
                    <p>
                        HOME > <span>${c1Name}</span> > <strong>${c2Name}</strong>
                    </p>
                </nav>

                <!-- 상품 전체 정보 내용 -->                
                <article class="info">
                    <div class="image">
                        <img src="<c:url value="${product.thumb3}"></c:url>" alt="상품이미지"/>
                    </div>
                    <div class="summary">
                        <nav>
                            <h1>${product.company}</h1>
                            <h2>상품번호&nbsp;&nbsp;<span>${product.prodNo}</span></h2>
                        </nav>                        
                        <nav>
                            <h3>${product.prodName}</h3>
                            <p>${product.descript}</p>
                            <h5 class="rating star4" style="background-position: 0px -${product.score}px"><a href="#">상품평보기</a></h5>
                        </nav>
                        <nav>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${product.price}" pattern="#,###"/></del>
                                <span>${product.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></ins>
                            </div>
                        </nav>
                        <nav>
                        	<c:if test="${product.delivery eq 0}"><span class="delivery">무료배송</span></c:if>
                        	<c:if test="${product.delivery ne 0}"><span style="font-size:16px">배송비 <fmt:formatNumber value="${product.delivery}" pattern="#,###"/>원</span></c:if>
                            <span class="arrival">모레(금) 7/8 도착예정</span>
                            <span class="desc">본 상품은 국내배송만 가능합니다.</span>
                        </nav>
                        <nav>
                            <span class="card cardfree"><i>아이콘</i>무이자할부</span>&nbsp;&nbsp;
                            <span class="card cardadd"><i>아이콘</i>카드추가혜택</span>
                        </nav>
                        <nav>
                            <span class="origin">원산지-상세설명 참조</span>
                        </nav>
                        <img src="../img/vip_plcc_banner.png" alt="100원만 결제해도 1만원 적립!" class="banner" />
                        
                        <div class="count">
                            <button class="decrease">-</button>
                            <input type="text" name="num" value="1" readonly/>
                            <button class="increase">+</button>
                        </div>
                        
                        <div class="total">
                            <span><fmt:formatNumber value="${product.disprice}" pattern="#,###"/></span>
                            <em>총 상품금액</em>
                        </div>

                        <div class="button">
                            <input type="button" class="cart"  value="장바구니"/>
                            <input type="button" class="order" value="구매하기"/>
                        </div>
                    </div>
                </article>

                <!-- 상품 정보 내용 -->
                <article class="detail">
                    <nav>
                        <h1>상품정보</h1>
                    </nav>
                    <!-- 상품상세페이지 이미지 -->
                    <img src='<c:url value="${product.detail}"></c:url>' alt="상세페이지1">
                </article>

                <!-- 상품 정보 제공 고시 내용 -->
                <article class="notice">
                    <nav>
                        <h1>상품 정보 제공 고시</h1>
                        <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
                    </nav>
                    <table border="0">
                        <tr>
                            <td>상품번호</td>
                            <td>${product.prodNo}</td>
                        </tr>
                        <tr>
                            <td>상품상태</td>
                            <td>${product.status}</td>
                        </tr>
                        <tr>
                            <td>부가세 면세여부</td>
                            <td>${product.duty}</td>
                        </tr>
                        <tr>
                            <td>영수증발행</td>
                            <td>${product.receipt}</td>
                        </tr>
                        <tr>
                            <td>사업자구분</td>
                            <td>${product.bizType}</td>
                        </tr>
                        <tr>
                            <td>원산지</td>
                            <td>${product.origin}</td>
                        </tr>
                    </table>
                    <table border="0">
                        <tr>
                            <td>제품소재</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>치수</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조자/수입국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>취급시 주의사항</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조연월</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>품질보증기준</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>A/S 책임자와 전화번호</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>주문후 예상 배송기간</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                        <td colspan="2">구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우</td>
                        </tr>
                    </table>
                    <p class="notice">
                        소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고
                        동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의
                        환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조
                        제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여
                        산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의
                        환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
                    </p>
                </article>
                
                <!-- 상품 리뷰 내용 -->
                <article class="review">
                    <nav>
                        <h1>상품리뷰</h1>
                    </nav>
                    <ul>
                        <li>
                            <div>
                                <h5 class="rating star4">상품평</h5>
                                <span>seo******	2018-07-10</span>
                            </div>
                            <h3>상품명1/BLUE/L</h3>
                            <p>
                                가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                                아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                                제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                            </p>
                        </li>
                        <li>
                            <div>
                                <h5 class="rating star4">상품평</h5>
                                <span>seo******	2018-07-10</span>
                            </div>
                            <h3>상품명1/BLUE/L</h3>
                            <p>
                                가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                                아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                                제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                            </p>
                        </li>
                        <li>
                            <div>
                                <h5 class="rating star4">상품평</h5>
                                <span>seo******	2018-07-10</span>
                            </div>
                            <h3>상품명1/BLUE/L</h3>
                            <p>
                                가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                                아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                                제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                            </p>
                        </li>
                        <li>
                            <div>
                                <h5 class="rating star4">상품평</h5>
                                <span>seo******	2018-07-10</span>
                            </div>
                            <h3>상품명1/BLUE/L</h3>
                            <p>
                                가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                                아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                                제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                            </p>
                        </li>
                        <li>
                            <div>
                                <h5 class="rating star4">상품평</h5>
                                <span>seo******	2018-07-10</span>
                            </div>
                            <h3>상품명1/BLUE/L</h3>
                            <p>
                                가격대비 정말 괜찮은 옷이라 생각되네요 핏은 음...제가 입기엔 어깨선이 맞고 루즈핏이라 하기도 좀 힘드네요.
                                아주 약간 루즈한정도...?그래도 이만한 옷은 없다고 봅니다 깨끗하고 포장도 괜찮고 다음에도 여기서 판매하는
                                제품들을 구매하고 싶네요 정말 만족하고 후기 남깁니다 많이 파시길 바래요 ~ ~ ~
                            </p>
                        </li>
                    </ul>
                    <div class="paging">
                        <span class="prev">
                            <a href="#"><&nbsp;이전</a>
                        </span>
                        <span class="num">
                            <a href="#" class="on">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                        </span>
                        <span class="next">
                            <a href="#">다음&nbsp;></a>
                        </span>
                    </div>

                </article>
                
            </section>
            <!-- 상품 상세페이지 끝 -->
        </main>
<jsp:include page="./_footer.jsp"></jsp:include>