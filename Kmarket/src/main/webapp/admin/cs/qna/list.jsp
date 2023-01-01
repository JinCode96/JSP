<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>

	$(document).on('change', 'select[name=category1]', function(e){
		
		let cate1 = $(this).val();
		let cate2 = 0;
		
		// 목록 가져오기
		$.ajax({
			
			url: '/Kmarket/admin/cs/qna/list.do',                                                                                                                                                                                                                                                                                               
			method: 'POST',
			data: {"cate1":cate1, "cate2":cate2},
			dataType:'json',
			success: function(data){
			
				// 2차 카테고리 가져오기
				$('select[name=category2]').empty();
				$('select[name=category2]').append("<option value='0'>유형선택</option> ");
				
				let tag = "";
				
				for(let cate of data.cates){
					
					tag = "<option value='"+cate.cate2+"'>"+cate.c2Name+"</option> ";
					$('select[name=category2]').append(tag);
				}
				
				// 목록 가져오기
				$('.row').remove();
				$('#deleteSelected').remove();
				$('.btnSubmit').remove();
				$('.paging').empty();
				$('input:checkbox[name=all]').prop("checked", false);
				
				for(let vo of data.qnas){
					
					let tags = "<tr class='row'>";
						tags += "<td><input type='checkbox' id='no' name='chkbox' value='"+vo.no+"'/></td>";
						tags += "<td>"+(data.pageStartNum -= 1)+"</td>";
						tags += "<td>"+vo.c1Name+"</td>";
						tags += "<td>"+vo.c2Name+"</td>";
						tags += "<td><a href='./view.do?cate1="+cate1+"&cate2=0&no="+vo.no+"&pg=1'>"+vo.title+"</a></td>";
						tags += "<td>"+(vo.uid).substring(0,3)+"**</td>";
						tags += "<td>"+vo.rdate+"</td>";
						
						if(vo.comment == 0){
							tags += "<td>검토중</td></tr>";
						}else{
							tags += "<td style='color:#0080FF;'>답변완료</td></tr>";
						}
						
					$('table').append(tags);
				
				}
				
				// 선택삭제 버튼 추가
				let tag1 = "<input type='button' onclick='deleteQnas()' id='deleteSelected' value='선택삭제' data-cate1='"+cate1+"' data-cate2='"+cate2+"'/>";
				$('.paging').before(tag1);
				
				
				// 페이징 관련
				for(var i = data.pageGroupStart; i <= data.pageGroupEnd; i++){
					let tags = "<span class='num'>"
						  + "<a href='/Kmarket/admin/cs/qna/list.do?cate1="+data.cate1+"&cate2="+data.cate2+"&pg="+i+"'>"+i+"</a></span>";
						  
					$('.paging').append(tags);
				}
				
				$('.num').eq(data.currentPage - 1).find('> a').addClass('on');
				
				if(data.pageGroupEnd < data.lastPageNum) {
					$('.paging').append("<span class='next'><a href='/Kmarket/admin/cs/qna/list.do?cate1="+data.cate1+"&cate2="+data.cate2+"&pg="+(data.pageGroupEnd + 1)+"'>다음&nbsp;</a></span>");
				}
				
			}

		});
		
	});
	
	$(document).on('change', 'select[name=category2]', function(e){
		
		let cate1 = $('select[name=category1]').val();
		let cate2 = $(this).val();
		
		// 목록 가져오기
		$.ajax({
			
			url: '/Kmarket/admin/cs/qna/list.do',                                                                                                                                                                                                                                                                                               
			method: 'POST',
			data: {"cate1":cate1, "cate2":cate2},
			dataType:'json',
			success: function(data){

				$('.row').remove();
				$('#deleteSelected').remove();
				$('.btnSubmit').remove();
				$('.paging').empty();
				$('input:checkbox[name=all]').prop("checked", false);
				
				for(let vo of data.qnas){
					
					let tags = "<tr class='row'>";
						tags += "<td><input type='checkbox' id='no' name='chkbox' value='"+vo.no+"'/></td>";
						tags += "<td>"+(data.pageStartNum -= 1)+"</td>";
						tags += "<td>"+vo.c1Name+"</td>";
						tags += "<td>"+vo.c2Name+"</td>";
						tags += "<td><a href='./view.do?cate1="+cate1+"&cate2="+cate2+"&no="+vo.no+"&pg=1'>"+vo.title+"</a></td>";
						tags += "<td>"+(vo.uid).substring(0,3)+"**</td>";
						tags += "<td>"+vo.rdate+"</td>";
						if(vo.comment == 0){
							tags += "<td>검토중</td></tr>";
						}else{
							tags += "<td style='color:#0080FF;'>답변완료</td></tr>";
						}
						
						
					$('table').append(tags);
				
				}
				
				// 선택삭제 버튼 추가
				let tag1 = "<input type='button' onclick='deleteQnas()' id='deleteSelected' value='선택삭제' data-cate1='"+cate1+"' data-cate2='"+cate2+"'/>";
				$('.paging').before(tag1);
				
				
				// 페이징 관련
				for(var i = data.pageGroupStart; i <= data.pageGroupEnd; i++){
					let tags = "<span class='num'>"
						  + "<a href='/Kmarket/admin/cs/qna/list.do?cate1="+data.cate1+"&cate2="+data.cate2+"&pg="+i+"'>"+i+"</a></span>";
						  
					$('.paging').append(tags);
				}
				
				$('.num').eq(data.currentPage - 1).find('> a').addClass('on');
				
				if(data.pageGroupEnd < data.lastPageNum) {
					$('.paging').append("<span class='next'><a href='/Kmarket/admin/cs/qna/list.do?cate1="+data.cate1+"&cate2="+data.cate2+"&pg="+(data.pageGroupEnd + 1)+"'>다음&nbsp;</a></span>");
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
	
	// 체크박스 선택후 삭제
	function deleteQnas(){
		
		let cate1 = $('#deleteSelected').attr('data-cate1');
		let cate2 = $('#deleteSelected').attr('data-cate2');
		
		let checkboxArr = [];
		$('input[name=chkbox]:checked').each(function(){
			
			let no = $(this).val();
			
			checkboxArr.push(no);
		
		});
		
		let isDeleteOk = confirm('삭제하시겠습니까?');
		
		console.log(checkboxArr);
		
		if(isDeleteOk){
			
			$.ajax({
				url:'/Kmarket/admin/cs/qna/delete.do',
				method:'POST',
				traditional: true,
				data: {"checkboxArr": checkboxArr},
				dataType: 'json',
				success: function(data){
					
					if(data.result > 0){
						alert('성공적으로 삭제되었습니다.');
						location.href="/Kmarket/admin/cs/qna/list.do?cate1="+cate1+"&cate2="+cate2;
					}
				}
			});
		}
	}

</script>
            <section class="admin-list" id="admin-qna-list">
                <nav>
                    <h3>문의하기 목록</h3>
	                    
                    <p>
                        HOME > 고객센터 > <strong>문의하기</strong>
                    </p>
                </nav>
                <!-- 게시글목록 컨텐츠 시작 -->                                
                <section>
                    <div>
                        <select name="category1">
                            <option value="0">유형선택</option>
                            <option value="1">회원</option>
                            <option value="2">쿠폰/이벤트</option>
                            <option value="3">주문/결제</option>                                    
                            <option value="4">배송</option>                                    
                            <option value="5">취소/반품/교환</option>                                    
                            <option value="6">여행/숙박/항공</option>                                    
	                        <option value="7">안전거래</option>                                    
                        </select>
                        <select name="category2">
                        <option value="0">유형선택</option>                                  
                        </select>
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
                        
                        <!-- 게시글 목록 나열 -->
                        <c:forEach var="qna" items="${qnas}">
	                        <tr class="row">
	                            <td><input type="checkbox" id="no" name="chkbox" value="${qna.no}"/></td>
	                            <td>${pageStartNum = pageStartNum-1}</td>
	                            <td>${qna.c1Name}</td>
	                            <td>${qna.c2Name}</td>
	                            <td><a href="./view.do?cate1=${cate1}&cate2=${cate2}&no=${qna.no}&pg=${currentPage}">${qna.title}</a></td>
	                            <td>${(qna.uid).substring(0,3)}**</td>
	                            <td>${qna.rdate}</td>
	                            <c:if test="${qna.comment eq 0}">
	                            	<td>검토중</td>
								</c:if>
								<c:if test="${qna.comment ne 0}">
									<td style="color:#0080FF;">답변완료</td>
								</c:if>
								
	                        </tr>
	                   </c:forEach>
                    </table>
                    
              
                    <input type="button" onclick="deleteQnas()" id="deleteSelected" value="선택삭제" data-cate1="${cate1}" data-cate2="${cate2}"/>
                    
                                  
					<!-- 페이징 -->         
                    <div class="paging">
                    
                    	<c:if test="${pageGroupStart > 1}">
	                        <span class="prev">
	                            <a href="/Kmarket/admin/cs/qna/list.do?cate1=${cate1}&cate2=${cate2}&pg=${pageGroupStart - 1}">&nbsp;이전</a>
	                        </span>
	                    </c:if>
	                    
	                    <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                        <span class="num">
	                            <a href="/Kmarket/admin/cs/qna/list.do?cate1=${cate1}&cate2=${cate2}&pg=${i}" class="${currentPage == i ? 'on':'off'}">${i}</a>
	                        </span>
	                    </c:forEach>
	                    
	                    <c:if test="${pageGroupEnd < lastPageNum}">
	                        <span class="next">
	                            <a href="/Kmarket/admin/cs/qna/list.do?cate1=${cate1}&cate2=${cate2}&pg=${pageGroupEnd + 1}">다음&nbsp;</a>
	                        </span>
                        </c:if>
                        
                    </div>

                </section>                
               
                <!-- 게시글 컨텐츠 끝 -->
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>