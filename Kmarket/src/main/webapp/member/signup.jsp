<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"></jsp:include>
<script>
	$(function(){
		$('.agree').click(function(){
			
			let isCheck1 = $('input[name=agree1]').is(':checked');
			let isCheck2 = $('input[name=agree2]').is(':checked');
			let isCheck3 = $('input[name=agree3]').is(':checked');
			
			if(isCheck1 && isCheck2 && isCheck3) {

				if(${type=='normal'}){
					location.href = "/Kmarket/member/register.do";
				}else if(${type=='seller'}){
					location.href = "/Kmarket/member/registerSeller.do";
				}
				return true;				
			}else{
				alert('필수 이용약관의 동의를 하셔야합니다.');
				return false;
			}
		});
	});
</script>
        <main id="member">
            <div class="signup">
                <nav>
                    <h1>약관동의</h1>
                </nav>
                <section>
                    <h3><span class="essential">(필수)</span>케이마켓 이용약관</h3>
                    <c:if test="${type=='normal'}">
                    <textarea class="terms" readonly>${vo.terms}</textarea>
                    </c:if>
                    <c:if test="${type=='seller'}">
                    <textarea class="terms" readonly>${vo.tax}</textarea>
                    </c:if>
                    <label><input type="checkbox" name="agree1">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>전자금융거래 이용약관</h3>
                    <textarea class="financial" readonly>${vo.finance}</textarea>
                    <label><input type="checkbox" name="agree2">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>개인정보 수집동의</h3>
                    <textarea class="privacy" readonly>${vo.privacy}</textarea>
                    <label><input type="checkbox" name="agree3">동의합니다.</label>
                </section>
				
				<c:if test="${type=='normal'}">
                <section>
                    <h3><span class="optional">(선택)</span>위치정보 이용약관</h3>
                    <textarea class="location" readonly>${vo.location}</textarea>
                    <label><input type="checkbox" name="agree4">동의합니다.</label>
                </section>
				</c:if>
                <div>
                    <input type="button" class="agree" value="동의하기">
                </div>
            </div>
        </main>
<jsp:include page="./_footer.jsp"></jsp:include>