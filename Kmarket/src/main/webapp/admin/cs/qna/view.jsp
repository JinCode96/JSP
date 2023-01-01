<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	
	$(document).on('click','.remove', function(e){
		
		let isDeleteOk = confirm('정말 삭제하시겠습니까?');
		
		if(isDeleteOk){
			
			let no = $('input[name=no]').val();
			
			$.ajax({
				url:'/Kmarket/admin/cs/qna/delete.do',
				method:'GET',
				data: {"no": no},
				dataType: 'json',
				success: function(data){
					
					if(data.result > 0) {
					
						location.href="/Kmarket/admin/cs/qna/list.do?cate1=0&cate2=0";
						alert('문의글이 성공적으로 삭제되었습니다.'); 
						
					}else{
						alert('삭제를 실패하였습니다.\n잠시 후 다시 시도해주세요.')
					}
				}
			});	
			
		}
		
	});

</script>
        <section id="admin-cs">
            <div class="qna">
                <section class="view">
                	<nav>
	                    <h3>문의하기 보기</h3>
	                    <p>
	                        HOME > 고객센터 > <strong>문의하기</strong>
	                    </p>
	                </nav>
                    <article>
                        <input type="hidden" name="no" value="${map.qna.no}">
                            <table>
                                <tr>
                                    <td>문의유형</td>
                                    <td>${map.qna.c1Name}-${map.qna.c2Name}</td>
                                </tr>
                                <tr>
                                    <td>문의제목</td>
                                    <td>
                                        <input type="text" name="title" value="${map.qna.title}" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td>
                                        <textarea name="content" readonly>${map.qna.content}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답변</td>
                                    <td>
                                    	<c:if test="${map.qna.comment eq 0}">
                                    		<textarea name="content" readonly>등록된 답변이 없습니다.</textarea>
                                    	</c:if>
                                    	<c:if test="${map.qna.comment ne 0}">
                                    		<textarea name="content" readonly>${map.reply.content}</textarea>
                                    	</c:if>
                                    </td>
                                </tr>
                            </table>
                            <div>
                            	<a href="#" class="btn remove">삭제하기</a>
                            	<a href="/Kmarket/admin/cs/qna/reply.do?cate1=${cate1}&cate2=${cate2}&no=${map.qna.no}&pg=${pg}" class="btn reply">답변하기</a>
                                <a href="/Kmarket/admin/cs/qna/list.do?cate1=${cate1}&cate2=${cate2}&pg=${pg}" class="btn btnCancle">목록이동</a>
                            </div>
                    </article>
                </section>
            </div>
        </section>
               </div>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>