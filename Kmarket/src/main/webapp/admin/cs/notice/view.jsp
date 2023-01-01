<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	
	$(document).on('click','.remove', function(e){
		
		let isDeleteOk = confirm('정말 삭제하시겠습니까?');
		
		if(isDeleteOk){
			
			let no = $('input[name=no]').val();
			
			$.ajax({
				url:'/Kmarket/admin/cs/notice/delete.do',
				method:'GET',
				data: {"no": no},
				dataType: 'json',
				success: function(data){
					
					if(data.result > 0) {
					
						location.href="/Kmarket/admin/cs/notice/list.do?cate=0";
						alert('공지사항이 성공적으로 삭제되었습니다.'); // 나중에 수정하기
						
					}else{
						alert('삭제를 실패하였습니다.\n잠시 후 다시 시도해주세요.')
					}
				}
			});	

		}
		
	});

</script>
        <section id="admin-cs">
            <div class="notice">
                <section class="view">
                	<nav>
	                    <h3>공지사항</h3>
	                    <p>
	                        HOME > 고객센터 > <strong>공지사항</strong>
	                    </p>
	                </nav>
                    <article>
                        <input type="hidden" name="no" value="${vo.no}">
                            <table>
                                <tr>
                                    <td>문의유형</td>
                                    <td>${vo.cateName}</td>
                                </tr>
                                <tr>
                                    <td>문의제목</td>
                                    <td>
                                        <input type="text" name="title" value="${vo.title}" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td>
                                        <textarea name="content" readonly>${vo.content}</textarea>
                                    </td>
                                </tr>
                            </table>
                            <div>
                            	<a href="#" class="btn remove">삭제하기</a>
                            	<a href="/Kmarket/admin/cs/notice/modify.do?cate=${cate}&no=${vo.no}&pg=${pg}&from=view" class="btn modify">수정하기</a>
                                <a href="/Kmarket/admin/cs/notice/list.do?cate=${cate}&pg=${pg}" class="btn btnCancle">목록이동</a>
                            </div>
                    </article>
                </section>
            </div>
        </section>
               </div>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>