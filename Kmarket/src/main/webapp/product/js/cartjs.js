/**
 * 
 */

$(document).submit(function(e) {

	var priceEl = document.getElementById('price');
	var price = priceEl.value
	var discountEl = document.getElementById('discount');
	var discount = discountEl.value
	var pointEl = document.getElementById('point');
	var point = pointEl.value
	var deliveryEl = document.getElementById('delivery');
	var delivery = deliveryEl.value
	var dispriceEl = document.getElementById('disprice');
	var disprice = dispriceEl.value

	var prodNoEl = document.getElementById('prodNo');
	var prodNo = prodNoEl.value
	var countEl = document.getElementById('count');
	var count = countEl.value
	var pricelist = [price];


	//let isDeleteOk = confirm("주문페이지로 가겠습니까?");

	let jsonData = { prodNo, count, price, discount, point, delivery, disprice };
	console.log("jsonData" + jsonData);
	$.ajax({
		url: '/Kmarket/product/order.do',
		method: 'get',
		data: jsonData,
		dataType: 'json',
		success: function(data) {
			let isDeleteOk = confirm("주문페이지로 가겠습니까?");

		}


	});


});