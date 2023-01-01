<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	$(document).on('click','.btnComplete', function(e){

		let cate = $('select[name=cate]').val();
		
		if(cate == 0) {
			alert('공지사항 유형을 선택해주세요.');
			return false;
		}else{
			return true;
		}
		
	});
</script>
        <section id="admin-cs">
            <div class="notice">
                <section class="modify">
                	<nav>
	                    <h3>공지사항</h3>
	                    <p>
	                        HOME > 고객센터 > <strong>공지사항</strong>
	                    </p>
	                </nav>
                    <article>
                        <form action="/Kmarket/admin/cs/notice/modify.do" method="POST">
                        <input type="hidden" name="uid" value="${sessUser.uid}"/>
                        <input type="hidden" name="no" value="${vo.no}">
                        <input type="hidden" name="cateforp" value="${cate}">
                        <input type="hidden" name="pg" value="${pg}">
                            <table>
                                <tr>
                                    <td>유형</td>
                                    <td>
                                        <select name="cate">
                                            <option value="0">선택</option>
                                            <option value="1" ${vo.cate eq 1 ? 'selected':''}>고객서비스</option>
                                            <option value="2" ${vo.cate eq 2 ? 'selected':''}>안전거래</option>
                                            <option value="3" ${vo.cate eq 3 ? 'selected':''}>위해상품</option>
                                            <option value="4" ${vo.cate eq 4 ? 'selected':''}>이벤트당첨</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제목</td>
                                    <td>
                                        <input type="text" name="title" value="${vo.title}" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>내용</td>
                                    <td>
                                        <textarea name="content" required>${vo.content}</textarea>
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <c:if test="${from eq 'list'}">
                                <a href="/Kmarket/admin/cs/notice/list.do?cate=${cate}&pg=${pg}" class="btn btnCancle">취소하기</a>
                                </c:if>
                                <c:if test="${from eq 'view'}">
                                <a href="/Kmarket/admin/cs/notice/view.do?cate=${cate}&no=${no}&pg=${pg}" class="btn btnCancle">취소하기</a>
                                </c:if>
                                <input type="submit" class="btn btnComplete" value="수정하기">
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