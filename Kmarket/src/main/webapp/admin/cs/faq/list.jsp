<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$('select[name=cate1]').change(function(){
		
		
		let cate1 = $(this).val();
		//alert(cate1);
		/*var prodCate2El = document.getElementById('prodCate2');
		var prodName = prodNameEl.value
		removeAllchild('select[name=prodCate2]');
		*/
		$.ajax({
	        url : '/Kmarket/admin/cs/faq/Cate2.do',
	        method: 'get',
	        data: { "cate1" : cate1 } ,
	        dataType : 'json',
	        success : function ( data ){
	        	$('select[name=cate2]').empty();
				$('select[name=cate2]').append("<option value='cate0'>2차 선택</option>");
	           var html = "";
	           $.each(data, function(index, item) {
		             html  = "<option value='"+item.cate2+"'>"+item.c2Name+"</option>";
		             $('select[name=cate2]').append(html);
	           });
	        }
	      });//$.ajax end
	});
});
	
</script>

<section id="admin-product-list">
                <nav>
                    <h3>자주하는 질문 목록</h3>
	                    
                    <p>
                        HOME > 고객센터 > <strong>자주하는 질문</strong>
                    </p>
                </nav>
                <!-- 상품목록 컨텐츠 시작 -->                                
                <section>
                    <div>
                    	 <form>
	                        <select name="cate1">
	                         <option value="cate0">1차 선택</option>
	                            <c:forEach var="c" items="${ vos }">
                                    	<option value="${ c.cate1 }">${ c.c1Name }</option>
                                    </c:forEach>                                
	                        </select>
	                        
	                        <select name="cate2">
	                            <option value="cate0">2차 선택</option>
	                        </select>
	                        
	                      </form>
                    </div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>번호</th>
                            <th>1차유형</th>
                            <th>2차유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>상태</th>
                        </tr>
                        
                        <!-- 상품 목록 나열 -->
						
	                        <tr>
	                            <td><input type="checkbox" name="상품코드"/></td>

	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            
	                        </tr>
                      
                    </table>
                    
                    <!-- 선택한 상품 삭제 -->
                    <input type="button" value="선택삭제" />
                                  
					<!-- 페이징 -->         
                    <div class="paging">
                    
                    	<c:if test="${pageGroupStart > 1}">
	                        <span class="prev">
	                            <a href="/Kmarket/admin/product/list.do?pg=${pageGroupStart - 1}">&nbsp;이전</a>
	                        </span>
	                    </c:if>
	                    
	                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                        <span class="num">
	                            <a href="/Kmarket/admin/product/list.do?pg=${i}" class="${currentPage == i ? 'on':'off'}">${i}</a>
	                        </span>
	                    </c:forEach>
	                    
	                    <c:if test="${pageGroupEnd < lastPageNum}">
	                        <span class="next">
	                            <a href="/Kmarket/admin/product/list.do?pg=${pageGroupEnd + 1}">다음&nbsp;</a>
	                        </span>
                        </c:if>
                        
                    </div>

                </section>                

                
                <p class="ico info">
                    <strong>Tip!</strong>
                    전자상거래 등에서의 상품 등의 정보제공에 관한 고시에 따라 총 35개 상품군에 대해 상품 특성 등을 양식에 따라 입력할 수 있습니다.
                </p>

                

                <!-- 상품목록 컨텐츠 끝 -->
            </section>
        </main>



<jsp:include page="../_footer.jsp"></jsp:include>