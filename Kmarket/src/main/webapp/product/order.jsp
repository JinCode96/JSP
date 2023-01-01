<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./_header.jsp"></jsp:include>

<script>

	$(function(){	
		
		// product_order 데이터 보내기
		$('input[name=btnPayment]').click(function(e){
			e.preventDefault();
			// 데이터 가져오기
			let ordUid = $('input[name=ordUid]').val();
			let ordCount = $('input[name=ordCount]').val();
			let ordPrice = $('input[name=ordPrice]').val();
			let ordDiscount = $('input[name=ordDiscount]').val();
			let ordDelivery = $('input[name=ordDelivery]').val();
			let savePoint = $('input[name=savePoint]').val();
			let usedPoint = $('input[name=usedPoint1]').val();
			let ordTotPrice = $('input[name=ordTotPrice]').val();
			let recipName = $('input[name=recipName]').val();
			let recipHp = $('input[name=recipHp]').val();
			let recipZip = $('input[name=recipZip]').val();
			let recipAddr1 = $('input[name=recipAddr1]').val();
			let recipAddr2 = $('input[name=recipAddr2]').val();
			let ordPayment = $('input[name=ordPayment]:checked').val();
			
			// JSON 데이터 생성
			let jsonData = {
							"ordUid" : ordUid,
							"ordCount" : ordCount,
							"ordPrice" : ordPrice,
							"ordDiscount" : ordDiscount,
							"ordDelivery" : ordDelivery,
							"savePoint" : savePoint,
							"usedPoint" : usedPoint,
							"ordTotPrice" : ordTotPrice,
							"recipName" : recipName,
							"recipHp" : recipHp,
							"recipZip" : recipZip,
							"recipAddr1" : recipAddr1,
							"recipAddr2" : recipAddr2,
							"ordPayment" : ordPayment
			}
			
			console.log('jsonData : ' + jsonData);
			
			// 서버 전송
			$.ajax({
				url : '/Kmarket/product/order.do',
				method : 'POST',
				data : jsonData,
				dataType : 'json',
				success:function(data){
					
					if (data.ordNo > 0) {
						alert('결제가 완료되었습니다.');
						location.href = "/Kmarket/product/complete.do?ordNo="+data.ordNo;
					}else {
						alert('주문이 실패하였습니다/n잠시후 다시 시도하십시오.');
						return;
					}
				}
			});	
		}); // btnPayment 종료
		
		// 포인트 사용
		$('input[name=btnUsedPoint]').click(function(e){
			e.preventDefault();
			const usedPoint1 = document.getElementById('usedPoint').value;
			const total = $('input[name=ordTotPrice]').val();
			let ordTotPrice = total - usedPoint1;
			
			if(usedPoint1==0) {
				const usedPoint2 = 0;
				$('input[name=usedPoint1]').attr('value', usedPoint2);
			}else {
				$('input[name=usedPoint1]').attr('value', usedPoint1);
				$('.ordTotPrice').text(ordTotPrice.toLocaleString());
			}
			
			$('input[name=usedPoint]').attr('readonly', true);
			
		});
		
	});
	
	window.onload = function(){
		   const usedPoint2 = 0;
			$('input[name=usedPoint1]').attr('value', usedPoint2);
	}
	
</script>
        
            <!-- 주문 페이지 시작-->
            <section class="order">
            
            <!-- 제목, 페이지 네비게이션 -->
            <nav>
                <h1>주문결제</h1>
                <p>
                    HOME > 장바구니 > <strong>주문결제</strong>
                </p>
            </nav>
            

            <form action="#">
                <!-- 주문 상품 목록 -->        
               
                <table>
                    <thead>
                    <tr>
                        <th>상품명</th>
                        <th>총수량</th>
                        <th>판매가</th>
                        <th>할인</th>
                        <th>포인트</th>
                        <th>배송비</th>
                        <th>총합</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="empty">
                        <td colspan="7">장바구니에 상품이 없습니다.</td>
                    </tr>
                    
					<c:set var = "totCount" 			value = "0" />
					<c:set var = "totPrice" 			value = "0" />
		            <c:set var = "totSavePoint" 		value = "0" />	
		            <c:set var = "totDiscountedPrice" 	value = "0" />
		            <c:set var = "totDelivery" 			value = "0" />
		            <c:set var = "totOrderPrice" 		value = "0" />
		            
					<!-- 상품 출력 -->
					<c:forEach var="order" items="${sessOrder}">
					
					<input type="hidden" name="ordUid" value="${sessUser.uid}"/>   
					<input type="hidden" name="savePoint" value="${order.point}">

					<c:set var="discountedPrice" value="${order.count * (order.price * (order.discount / 100))}"/>
					<c:set var="subTotalPrice" value="${order.price * order.count + order.delivery - discountedPrice}"/>
					
	                    <tr>
	                        <td>
	                        <article>
	                            <a href="/Kmarket/product/view.do?cate1=${order.prodCate1}&cate2=${order.prodCate2}&prodNo=${order.prodNo}">
	                            	<img src="<c:url value='${order.thumb1}'/>" width="80px" height="80px" alt="">
	                            </a>
	                            <div>
	                                <h2><a href="/Kmarket/product/view.do?cate1=${order.prodCate1}&cate2=${order.prodCate2}&prodNo=${order.prodNo}">${order.prodName}</a></h2>
	                                <p>${order.descript}</p>
	                            </div>
	                        </article>
	                        </td>
	                        <td>${order.count}</td>
	                        <td><fmt:formatNumber value="${order.price}" pattern="#,###"/></td>
	                        <td>
	                        	${order.discount}% 
	                        </td>
	                        <td>${order.point}</td>
	                        <td>
		                        <c:choose>
			                        <c:when test="${order.delivery eq 0}">
				                        무료배송
				                    </c:when>
				                    <c:otherwise>
				                        ${order.delivery}
				                    </c:otherwise>
			                    </c:choose>
		                    </td>
	                        <td><fmt:formatNumber value="${subTotalPrice}" pattern="#,###"/></td>
	                    </tr>
	                    <c:set var= "totCount" 				value="${totCount + order.count}"/>
	                    <c:set var= "totPrice" 				value="${totPrice + order.price}"/>
	                    <c:set var= "totDiscountedPrice" 	value="${totDiscountedPrice + discountedPrice}"/>
	                    <c:set var= "totSavePoint" 			value="${totSavepoint + order.point}"/>
	                    <c:set var= "totDelivery" 			value="${totDelivery + order.delivery}"/>
	                    <c:set var= "totOrderPrice" 		value="${totOrderPrice + subTotalPrice}"/>
	                    
                    </c:forEach>

                    </tbody>
                </table>                 
                
                <!-- 최종 결제 정보 -->
                <div class="final">
                    <h2>최종결제 정보</h2>
                    <table border="0">
                    <tr>
                        <td>총</td>
                        <td><c:out value="${totCount}"/></td>
                    </tr>
                    <tr>
                        <td>상품금액</td>
                        <td><fmt:formatNumber value="${totPrice}" pattern="#,###"/></td>
                    </tr>
                    <tr>
                        <td>할인</td>
                        <td>
                        	<c:choose>
		                        <c:when test="${totDiscountedPrice eq 0}">
			                        0
			                    </c:when>
			                    <c:otherwise>
			                       <fmt:formatNumber value="${totDiscountedPrice}" pattern="-#,###"/>
			                    </c:otherwise>
	                    </c:choose>
                       </td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td><fmt:formatNumber value="${totDelivery}" pattern="#,###"/></td>
                    </tr>
                    <tr>
                        <td>포인트 할인</td>
                        <td>
                        	<input type="text" name="usedPoint1" value="" readonly
                        	style="border:none; font-size:14px; color:#555; float:right; text-align:right"/>
                        </td>
                    </tr>
                    <tr>
                    	<c:set var="ordTotPrice" value="${totOrderPrice}"/>
                        <td>전체주문금액</td>
                        <td class="ordTotPrice"><fmt:formatNumber value="${ordTotPrice}" pattern="#,###"/></td>
                    </tr>
                    </table>
                    <input type="button" name="btnPayment" value="결제하기">          
                    
                   	<input type="hidden" name="ordCount" value="${totCount}">
                   	<input type="hidden" name="ordPrice" value="${totPrice}">
                   	<input type="hidden" name="ordDiscount" value="<fmt:formatNumber value="${totDiscountedPrice}" pattern="#"/>">
                   	<input type="hidden" name="ordDelivery" value="${totDelivery}">
                   	<input type="hidden" name="ordTotPrice" value="<fmt:formatNumber value="${ordTotPrice}" pattern="#"/>">
                        
                </div>
                
                <!-- 배송정보 -->
                <article class="delivery">
                    <h1>배송정보</h1>                          
                    <table>
                    <tr>
                        <td>수령자</td>
                        <td><input type="text" name="recipName" value="${sessUser.name}"/></td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="recipHp" value="${sessUser.hp}" />
                            <span>- 포함 입력</span>
                        </td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" name="recipZip" value="${sessUser.zip}"/>
                            <input type="button" class="btnCommon zip" onclick="zipcode()" value="검색"/>
                        </td>
                    </tr>
                    <tr>
                        <td>기본주소</td>
                        <td>
                            <input type="text" name="recipAddr1" value="${sessUser.addr1}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>상세주소</td>
                        <td>
                            <input type="text" name="recipAddr2" value="${sessUser.addr2}"/>
                        </td>
                    </tr>
                    </table>
                </article>

                <!-- 할인정보 -->
                
                <article class="discount">
                    <h1>할인정보</h1>
					
                    <div>
                        <p>현재 포인트 : <span><fmt:formatNumber value="${sessUser.point}" pattern="#,###"/></span>점</p>
                        <label>
                       
                        <c:set var = "min" value = "0"/>
                        <c:set var = "max" value = "${total}"/>
                        
                        	<c:choose>
		                        <c:when test="${sessUser.point ge 5000}">
			                        <input type="text" name="usedPoint" id="usedPoint" value="0" min="${min}" max="${max}" />점
			                    </c:when>
			                    <c:otherwise>
			                        <input type="text" name="usedPoint" value="0" readonly/>점
			                    </c:otherwise>
		                    </c:choose>
		                    <input type="button" name="btnUsedPoint" value="적용"/>
		                
                        </label>
                        <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                    </div>
                    
                </article>

                <!-- 결제방법 -->
                <article class="ordPayment">
                    <h1>결제방법</h1>
                    <div>
                        <span>신용카드</span>
                        <p>
                            <label><input type="radio" name="ordPayment" value="1" checked/>신용카드 결제</label>
                            <label><input type="radio" name="ordPayment" value="2"/>체크카드 결제</label>                                
                        </p>
                    </div>
                    <div>
                        <span>계좌이체</span>
                        <p>
                            <label><input type="radio" name="ordPayment" value="3"/>실시간 계좌이체</label>
                            <label><input type="radio" name="ordPayment" value="4"/>무통장 입금</label>                                
                        </p>
                    </div>
                    <div>
                        <span>기타</span>
                        <p>
                            <label><input type="radio" name="ordPayment" value="5"/>휴대폰결제</label>
                            <label>
                                <input type="radio" name="ordPayment" value="6"/>카카오페이
                                <img src="../img/ico_kakaopay.gif" alt="카카오페이"/>
                            </label>                                
                        </p>
                    </div>
                </article>

                <!-- 경고 -->
                <article class="alert">
                    <ul>
                        <li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</span></li>
                        <li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.</span></li>
                        <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.</span></li>
                    </ul>
                </article>
            
                </form>
            
            </section>
            <!-- 주문 페이지 끝-->
        </main>
<jsp:include page="./_footer.jsp"></jsp:include>