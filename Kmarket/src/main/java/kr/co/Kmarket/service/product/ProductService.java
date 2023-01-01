package kr.co.Kmarket.service.product;

import java.util.HashMap;
import java.util.List;

import kr.co.Kmarket.dao.product.ProductDao;
import kr.co.Kmarket.vo.ProductCartVo;
import kr.co.Kmarket.vo.ProductOrderVo;
import kr.co.Kmarket.vo.ProductVo;

public enum ProductService {

	INSTANCE;

	private ProductDao dao;

	private ProductService() {
		
		dao = new ProductDao();
	
	}
	
	
	public int selectCountTotal(int cate1, int cate2) {
		return dao.selectCountTotal(cate1, cate2);
	}
	
	public ProductVo selectProduct(int prodNo) {
		return dao.selectProduct(prodNo);
	}
	
	public List<ProductVo> selectProducts(int cate1, int cate2, String sort, int start) {
		return dao.selectProducts(cate1, cate2, sort, start);
	}
	
	public List<ProductVo> selectOrder(int prodNo, int count) {
		return dao.selectOrder(prodNo, count);
	}
	
	
	public String[] getCateName(int cate1, int cate2) {
		return dao.getCateName(cate1, cate2);
	}
	
	public void updateProductHit(int prodNo) {
		dao.updateProductHit(prodNo);
	}
	
	public int insertCart(ProductCartVo cart) {
		return dao.insertCart(cart);
	}
	
	
	/* 서비스 로직 */
	public int getCurrentPage(String pg) {
		
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;

	}
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = (total / 10);
		}else {
			lastPageNum = (total / 10) + 1;
		}
		
		return lastPageNum;
	}
	
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		
		int pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (pageGroupCurrent -1) * 10 + 1;
		int pageGroupEnd = pageGroupCurrent * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] pageGroup = {pageGroupStart, pageGroupEnd};
		
		return pageGroup;
		
	}
	
	public int getStartNum(int currentPage) {
		
		return (currentPage -1) * 10;
	}

	
	// 현길

	
	public List<ProductVo> cart(String uid) {
		return dao.cart(uid);
	}


	public List<ProductVo> cartNo(HashMap<Integer, Integer> map) {
		return dao.cartNo(map);
	}	
	
	// 진우
	public String insertOrderProduct(ProductOrderVo vo) {
		return dao.insertOrderProduct(vo);
	}
	
	public int selectComplete(String ordNo) {
		return dao.selectComplete(ordNo);
	}


	public int deleteCartProductlist(HashMap<Integer, Integer> map) {
		int result = dao.deleteCartProductlist(map);
		return result;
	}
	
}
