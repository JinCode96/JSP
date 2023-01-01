<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	$(document).ready(function(){
		
		// 게시글 삭제
		$(document).on('click', '.remove', function(e){
			
			e.preventDefault();
			
			let isDeleteOk = confirm('정말 삭제하시겠습니까?');
			
			if(isDeleteOk){
				
				let row = $(this).closest('.row');
				let no = document.getElementById('no').value;
							
				$.ajax({
					url:'/Kmarket/admin/cs/notice/delete.do',
					method:'GET',
					data: {"no": no},
					dataType: 'json',
					success: function(data){
						
						if(data.result > 0) {
							alert('공지사항이 삭제되었습니다.');
							row.hide();
							
						}else{
							alert('삭제를 실패하였습니다.\n잠시 후 다시 시도해주세요.')
						}
					}
				});	
			}
		});
		
		
		$(document).on('change', 'select[name=category]', function(e){
			
			let cate = $(this).val();
			
			$.ajax({
				url: '/Kmarket/admin/cs/notice/list.do',                                                                                                                                                                                                                                                                                               
				method: 'POST',
				data: {"cate":cate},
				dataType:'json',
				success: function(data){
					$('.row').remove();
					$('#deleteSelected').remove();
					$('.btnSubmit').remove();
					$('.paging').empty();
					$('input:checkbox[name=all]').prop("checked", false);
					
					for(let vo of data.notices){
						
						let tags = "<tr class='row'>";
							tags += "<td><input type='checkbox' id='no' name='chkbox' value='"+vo.no+"'/></td>";
							tags += "<td>"+(data.pageStartNum -= 1)+"</td>";
							tags += "<td>"+vo.cateName+"</td>";
							tags += "<td><a href='./view.do?cate="+cate+"&no="+vo.no+"&pg=1'>"+vo.title+"</a></td>";
							tags += "<td>"+vo.hit+"</td>";
							tags += "<td>"+vo.rdate+"</td>";
							tags += "<td><a href='#' class='remove'>[삭제]</a>";
							tags += "<a href='/Kmarket/admin/cs/notice/modify.do?cate="+cate+"&no="+vo.no+"&pg="+data.currentPage+"&from=list' class='modify'>[수정]</a></td></tr>";
							
						$('table').append(tags);
						
					}
					
					// 선택삭제 버튼 추가
					let tag1 = "<input type='button' onclick='deleteNotices()' id='deleteSelected' value='선택삭제' data-cate='"+cate+"'/>";
					$('.paging').before(tag1);
					
					// 등록하기 버튼 추가
					let tag2 = "<a href='/Kmarket/admin/cs/notice/write.do?cate="+cate+"' class='btn btnSubmit'>등록하기</a>";
					$('.paging').before(tag2);
					
					// 페이징 관련
					for(var i = data.pageGroupStart; i <= data.pageGroupEnd; i++){
						let tags = "<span class='num'>"
							  + "<a href='/Kmarket/admin/cs/notice/list.do?cate="+data.cate+"&pg="+i+"'>"+i+"</a></span>";
							  
						$('.paging').append(tags);
					}
					
					$('.num').eq(data.currentPage - 1).find('> a').addClass('on');
					
					if(data.pageGroupEnd < data.lastPageNum) {
						$('.paging').append("<span class='next'><a href='/Kmarket/admin/cs/notice/list.do?cate="+data.cate+"&pg="+(data.pageGroupEnd + 1)+"'>다음&nbsp;</a></span>");
					}
				}
			});			
			
		});
		

		// 체크박스
		$(document).on('click', 'input[name=all]', function(e){
			
			let chkList = $('input[name=chkbox]');		
			
			if($(this).is(":checked")){
				chkList.prop("checked", true);
			}else{
				chkList.prop("checked", false);
			}
		});
		
	});
	
	
	// 체크박스 선택후 삭제
	function deleteNotices(){
		
		let cate = $('#deleteSelected').attr('data-cate');
		
		let checkboxArr = [];
		$('input[name=chkbox]:checked').each(function(){
			
			let no = $(this).val();
			
			checkboxArr.push(no);
		
		});
		
		let isDeleteOk = confirm('삭제하시겠습니까?');
		
		console.log(checkboxArr);
		
		if(isDeleteOk){
			
			$.ajax({
				url:'/Kmarket/admin/cs/notice/delete.do',
				method:'POST',
				traditional: true,
				data: {"checkboxArr": checkboxArr},
				dataType: 'json',
				success: function(data){
					
					if(data.result > 0){
						alert('성공적으로 삭제되었습니다.');
						location.href="/Kmarket/admin/cs/notice/list.do?cate="+cate;
					}
				}
			});
			
			
		}
		
		
	}
	
</script>
            <section class="admin-list">
                <nav>
                    <h3>공지사항 목록</h3>
	                    
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <!-- 게시글목록 컨텐츠 시작 -->                                
                <section>
                    <div>
                        <select name="category">
                            <option value="0">유형선택</option>
                            <option value="1">고객서비스</option>
                            <option value="2">안전거래</option>
                            <option value="3">위해상품</option>                                    
                            <option value="4">이벤트당첨</option>                                    
                        </select>
                    </div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>번호</th>
                            <th>유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                        
                        <!-- 게시글 목록 나열 -->
                        <c:forEach var="notice" items="${notices}">
	                        <tr class="row">
	                            <td><input type="checkbox" id="no" name="chkbox" value="${notice.no}"/></td>
	                            <td>${pageStartNum = pageStartNum-1}</td>
	                            <td>${notice.cateName}</td>
	                            <td><a href="./view.do?cate=${cate}&no=${notice.no}&pg=${currentPage}">${notice.title}</a></td>
	                            <td>${notice.hit}</td>
	                            <td>${notice.rdate}</td>
	                            <td>
	                                <a href="#" class="remove">[삭제]</a>
	                                <a href="/Kmarket/admin/cs/notice/modify.do?cate=${cate}&no=${notice.no}&pg=${currentPage}&from=list" class="modify">[수정]</a>
	                            </td>
	                        </tr>
	                   </c:forEach>
                    </table>
                    
              
                    <input type="button" onclick="deleteNotices()" id="deleteSelected" value="선택삭제" data-cate="${cate}"/>
                    <a href="/Kmarket/admin/cs/notice/write.do?cate=${cate}" class="btn btnSubmit">등록하기</a>
                                  
					<!-- 페이징 -->         
                    <div class="paging">
                    
                    	<c:if test="${pageGroupStart > 1}">
	                        <span class="prev">
	                            <a href="/Kmarket/admin/cs/notice/list.do?cate=${cate}&pg=${pageGroupStart - 1}">&nbsp;이전</a>
	                        </span>
	                    </c:if>
	                    
	                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                        <span class="num">
	                            <a href="/Kmarket/admin/cs/notice/list.do?cate=${cate}&pg=${i}" class="${currentPage == i ? 'on':'off'}">${i}</a>
	                        </span>
	                    </c:forEach>
	                    
	                    <c:if test="${pageGroupEnd < lastPageNum}">
	                        <span class="next">
	                            <a href="/Kmarket/admin/cs/notice/list.do?cate=${cate}&pg=${pageGroupEnd + 1}">다음&nbsp;</a>
	                        </span>
                        </c:if>
                        
                    </div>

                </section>                
               
                <!-- 게시글 컨텐츠 끝 -->
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>