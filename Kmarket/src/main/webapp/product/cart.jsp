<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"></jsp:include>
<!-- 
<script scr="/Kmarket/product/js/cartjs.js"></script>
 -->
<script>

$(function(){
	
	
	$('input[type=submit]').click(function(e){
		e.preventDefault();
	    var obj_length = document.getElementsByName("chkProdNo").length;
		//alert("하이1");
		//let trs = $('input[name=chkProdNo]').is(':checked'); //.parents('tr');
		//alert("하이2");
		console.log(obj_length);
		let carts = new Array();
		for (var i=0; i<obj_length; i++) {
            if (document.getElementsByName("chkProdNo")[i].checked == true) {
                //alert(document.getElementsByName("chkProdNo")[i].value);
    			var cartNo = document.getElementsByName("chkProdNo")[i].value
            	carts.push(cartNo);
            }
		}
		console.log(carts);
		
		
				
			//console.log(carts);
		console.log("카트 리스트");
		//carts.forEach(element => { document.write(element + '<br>');
			
		//alert("하이5");
		
		$.ajax({
			url: '/Kmarket/product/cart.do',
			method: 'POST',
			traditional: true,
			data: {"carts" : carts},
			dateType: 'json',
			success: function(data){
				
				if(data.result > 0) {
					alert('주문하기로 이동합니다.');
					location.href = "/Kmarket/product/order.do";
				
				}else {
					alert('주문하기를 실패하였습니다. ');
				}
			}
			
		});
		
	});
});
$(document).on('click', '.listremove', function(e){
	e.preventDefault();
    var obj_length = document.getElementsByName("chkProdNo").length;
	let isDeleteOk = confirm("정말 상품들을 삭제하시겠습니까?");
	
	if (isDeleteOk){
	//alert("하이2");
	console.log(obj_length);
	let cartlist = new Array();
	   for (var i=0; i<obj_length; i++) {
            if (document.getElementsByName("chkProdNo")[i].checked == true) {
                //alert(document.getElementsByName("chkProdNo")[i].value);
    		var cartNo = document.getElementsByName("chkProdNo")[i].value
    		cartlist.push(cartNo);
            }
	   }
		console.log(cartlist);
			
		//console.log(carts);
		console.log("카트 리스트");
		
	//alert("하이5");
	
	$.ajax({
		url: '/Kmarket/product/delete.do',
		method: 'POST',
		traditional: true,
		data: {"cartlist" : cartlist},
		dataType: 'json',
		success: function(data){
			console.log(data.result);
			if(data.result == 1){
				//alert(data.result);
				alert('상품들이 삭제되었습니다.');
				location.href="/Kmarket/product/cart.do";
			}else if(data.result == null ){
				//alert(data.result);
				//alert('result값이 없습니다.');
				location.href="/Kmarket/product/cart.do";
			}
		}
		
	});
	}
});
//체크박스
$(document).on('click', 'input[name=all]', function(e){
	
	let chkList = $('input[name=chkProdNo]');		
	
	if($(this).is(":checked")){
		chkList.prop("checked", true);
	}else{
		chkList.prop("checked", false);
	}
});


</script>

            <!-- 장바구니 페이지 시작 -->
            <section class="cart">
            
            <!-- 제목, 페이지 네비게이션 -->
            <nav>
                <h1>장바구니</h1>
                <p>
                    HOME > <span>패션·의류·뷰티</span> > <strong>장바구니</strong>
                </p>
            </nav>
                            
            <form action="#" >
                <!-- 장바구니 목록 -->
                <table>
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="all"></th>
                        <th width="400px">상품명</th>
                        <th>총수량</th>
                        <th>판매가</th>
                        <th>할인</th>
                        <th>포인트</th>
                        <th>배송비</th>
                        <th>소계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="empty">
                        <td colspan="7">장바구니에 상품이 없습니다.</td>
                    </tr>
                    <c:set var = "price" value = "0" />
                    <c:set var = "discount" value = "0" />
                    <c:set var = "point" value = "0" />
                    <c:set var = "delivery" value = "0" />
                    <c:set var = "disprice" value = "0" />
                    <c:set var="total" value="0" />
                    <c:set var="count" value="0" />
                    
                    <c:forEach var="cart" items="${cart}">
                 
                    <tr >
                        <td><input type="checkbox" name="chkProdNo" value="${cart.cartNo}"></td>
                        <td>
                        <input type="hidden" class="prodCate1" value="${cart.prodCate1}" name="prodCate1"/>
                        <input type="hidden" class="prodCate2" value="${cart.prodCate2}" name="prodCate2"/>
                        <input type="hidden" class="thumb1" value="${cart.thumb1}" name="thumb1"/>
                        <input type="hidden" class="thumb2" value="${cart.thumb2}" name="thumb2"/>
                        <input type="hidden" class="thumb3" value="${cart.thumb3}" name="thumb3"/>
                            <article>
                                <a href="/Kmarket/product/view.do?cate1=${cart.prodCate1}&cate2=${cart.prodCate2}&prodNo=${cart.prodNo}">
                              <img src="<c:url value='${cart.thumb1}'/>" alt="item1" width="80px" height="80px"></a>
                              <input type="hidden" name="detail" class="detail" value="${cart.detail}" />
                                <div>
                                    <h2><a href="#"><input type="hidden" name="prodName" class="prodName" value="${cart.prodName}" />
                                    		${cart.prodName}</a></h2>
                                    <p> <input type="hidden" name="descript" class="descript" value="${cart.descript}" />
                                    ${cart.descript}</p>
                                </div>
                            </article>
                        </td>
                        <td><input type="hidden" class="count" value="${cart.count}" name="prodcount"/>${cart.count}</td>
                        <td><input type="hidden" name="price" class="price" value="${cart.price}" />${cart.price}</td>
                       <td> <input type="hidden" name="discount" class="discount" value="${cart.discount}" />${cart.discount}</td>
                        <td><input type="hidden" name="point" class="point" value="${cart.point}" />${cart.point}</td>
                        <c:if test="${cart.delivery eq 0}">
                       <td><input type="hidden" name="delivery" class="delivery" value="${cart.delivery}" />무료배송</td>
                        </c:if>
                        <c:if test="${cart.delivery ne 0}">
                     <td><input type="hidden" name="delivery" class="delivery" value="${cart.delivery}" />${cart.delivery}</td>
                        </c:if>
                       <td><input type="hidden" name="total" class="total" value="${cart.total}" />${cart.total}</td>
                    </tr>
                    <c:set var= "price" value="${price + cart.price}"/>
                    <c:set var= "discount" value="${discount + cart.discount}"/>
                    <c:set var= "point" value="${point + cart.point}"/>
                    <c:set var= "delivery" value="${delivery + cart.delivery}"/>
                    <c:set var= "disprice" value="${disprice + cart.disprice}"/>
                    <c:set var= "total" value="${total + cart.total}"/>
                    <c:set var= "count" value="${count + cart.count}"/>
                    </c:forEach>
                 
                  
                </tbody>
                </table>
                 <input type="button" value="선택삭제" class="listremove" name="del" />

                <!-- 장바구니 전체합계 -->
                <div class="total">
                    <h2>전체합계</h2>
                    <table border="0">
                        <tr>
                        <td>상품수</td>
                        <td><c:out value="${count}" /></td>
                        </tr>
                        <tr>
                        <td>상품금액</td>
                        <td><c:out value="${price}"  /></td>
                        </tr>
                        <tr>
                        <td>할인율</td>
                        <td><c:out value="${discount}"/></td>
                        </tr>
                        <tr>
                        <td>배송비</td>
                        <c:if test="${delivery eq 0 }">
                        <td>0</td>
                        </c:if>
                          <c:if test="${delivery ne 0 }">
                        <td>${delivery}</td>
                        </c:if>
                        </tr>              
                        <tr>
                        <td>포인트</td>
                        <td><c:out value="${point}"/></td>
                        </tr>
                        <tr>
                 
                        <td>전체주문금액</td>
                        <td><c:out value="${total}"/></td>
                        </tr>
                    </table>
                    <input type="submit"  value="주문하기">    
                </div>
                </form>
            </section>
            <!-- 장바구니 페이지 끝 -->
        </main>
        <jsp:include page="./_footer.jsp"></jsp:include>