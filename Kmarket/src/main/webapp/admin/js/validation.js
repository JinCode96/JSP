/**
 * 
 */

/* 
$(function(){
	// 카테고리1값 변경시
	$('select[name=prodCate1]').change(()=>{
		const cate1 = $('select[name=prodCate1]').val();
		
		$.get('/Kmarket/admin/product/getCate2.do?cate1='+cate1,(data)=>{
			// 카테고리2값 넣기전 비우기
			$('select[name=prodCate2]').empty();
			$('select[name=prodCate2]').append("<option value='cate0'>2차 분류 선택</option>");
			for(let c of data) {
				// 카테고리2값 입력
				$('select[name=prodCate2]').append("<option value='"+c.cate2+"'>"+c.c2Name+"</option>");
			}
		});
	});
	
		});	
	*/	
	


 
 
 $(document).submit(function(e) {
		var prodNameEl = document.getElementById('prodName');
		var prodName = prodNameEl.value
		var descriptEl = document.getElementById('descript');
		var descript = descriptEl.value
		
		var companyEl = document.getElementById('company');
		var company = descriptEl.value
		var priceEl = document.getElementById('price');
		var price = priceEl.value
		
		var discountEl = document.getElementById('discount');
		var discountt = descriptEl.value
		var pointEl = document.getElementById('point');
		var point = pointEl.value
		
		var stockEl = document.getElementById('stock');
		var stock = stockEl.value
		var deliveryEl = document.getElementById('delivery');
		var delivery = deliveryEl.value
		
		var thumb1El = document.getElementById('thumb1');
		var thumb1 = thumb1El.value
		var thumb2El = document.getElementById('thumb2');
		var thumb2 = thumb2El.value
		
		var thumb3El = document.getElementById('thumb3');
		var thumb3 = thumb3El.value
		var detailEl = document.getElementById('detail');
		var detail = detailEl.value
		
		var statusEl = document.getElementById('status');
		var status = statusEl.value
		var dutyEl = document.getElementById('duty');
		var duty = dutyEl.value
		
		var receiptEl = document.getElementById('receipt');
		var receipt = receiptEl.value
		var bizTypeEl = document.getElementById('bizType');
		var bizType = bizTypeEl.value
		var originEl = document.getElementById('origin');
		var origin = originEl.value
		
	    if ( prodName == null || prodName == '' ) {
	    	alert("상품명을 입력해주세요.");
	    	prodNameEl.focus();
	        return false;
	    }
	    if ( descript == null || descript == '' ) {
	    	alert("기본설명을 입력해주세요.");
	    	descriptEl.focus();
	        return false;
	    }
	     if ( company == null || company == '' ) {
	    	alert("회사명을 입력해주세요.");
	    	companyEl.focus();
	        return false;
	    }
	     if ( price == null || price == '' ) {
	    	alert("판매가격을 입력해주세요.");
	    	priceEl.focus();
	        return false;
	    }
	     if ( discountt == null || discountt == '' ) {
	    	alert(" 힐인율을 입력해주세요.");
	    	discountEl.focus();
	        return false;
	    }
	     if ( point == null || point == '' ) {
	    	alert("포인트를 입력해주세요.");
	    	pointEl.focus();
	        return false;
	    }
	     if ( stock == null || stock == '' ) {
	    	alert("재고수량을 입력해주세요.");
	    	stockEl.focus();
	        return false;
	    }
	     if ( delivery == null || delivery == '' ) {
	    	alert("배송비를 입력해주세요.");
	    	deliveryEl.focus();
	        return false;
	    }
	     if ( thumb1 == null || thumb1 == '' ) {
	    	alert("사진을 입력해주세요.");
	    	thumb1El.focus();
	        return false;
	    }
	     if ( thumb2 == null || thumb2 == '' ) {
	    	alert("사진을 입력해주세요.");
	    	thumb2El.focus();
	        return false;
	    }
	     if ( thumb3 == null || thumb3 == '' ) {
	    	alert("사진을 입력해주세요.");
	    	thumb3El.focus();
	        return false;
	    }
	     if ( detail == null || detail == '' ) {
	    	alert("상세정보사진을 입력해주세요.");
	    	detailEl.focus();
	        return false;
	    }
	     if ( status == null || status == '' ) {
	    	alert("상품상태를 입력해주세요.");
	    	statusEl.focus();
	        return false;
	    }
	     if ( duty == null || duty == '' ) {
	    	alert("부가세 여부를 입력해주세요.");
	    	dutyEl.focus();
	        return false;
	    }
	     if ( receipt == null || receipt == '' ) {
	    	alert("영수증발행을 입력해주세요.");
	    	receiptEl.focus();
	        return false;
	    }
	     if ( bizType == null || bizType == '' ) {
	    	alert("사업자구분을 입력해주세요.");
	    	bizTypeEl.focus();
	        return false;
	    }
	     
	     if ( origin == null || origin == '' ) {
	    	alert("원산지를 입력해주세요.");
	    	originEl.focus();
	        return false;
	    }
	})
