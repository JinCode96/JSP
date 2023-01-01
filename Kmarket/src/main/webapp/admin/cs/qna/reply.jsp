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
                <section class="reply">
                	<nav>
	                    <h3>문의하기 답변</h3>
	                    <p>
	                        HOME > 고객센터 > <strong>문의하기</strong>
	                    </p>
	                </nav>
                    <article>
                    	<form action="/Kmarket/admin/cs/qna/reply.do" method="post">
                    		<input type="hidden" name="uid" value="${sessUser.uid}">
                    		<input type="hidden" name="no" value="${map.qna.no}">
                    		<input type="hidden" name="pg" value="${pg}">
                    		<input type="hidden" name="cate1forp" value="${cate1}">
                    		<input type="hidden" name="cate2forp" value="${cate2}">
                    		<input type="hidden" name="cate1" value="${map.qna.cate1}">
                    		<input type="hidden" name="cate2" value="${map.qna.cate2}">
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
                                        <textarea name="qnacontent" readonly>${map.qna.content}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>답변</td>
                                    <td>
                                   		<textarea name="content" id="reply"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div>
                            	<a href="#" class="btn remove">삭제하기</a>
                            	<input type="submit" class="btn btnComplete" value="답변등록">
                                <a href="/Kmarket/admin/cs/qna/list.do?cate1=${cate1}&cate2=${cate2}&pg=${pg}" class="btn btnCancle">목록이동</a>
                            </div>
                    	</form>
                    </article>
                </section>
            </div>
        </section>
               </div>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>