package kr.co.Kmarket.service.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.dao.main.MainDao;
import kr.co.Kmarket.vo.ProductVo;

public enum MainService {

	INSTANCE;

	private MainDao dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private MainService() {
		dao = new MainDao();
	}

	public List<ProductVo> mainDiscountProduct() {
		return dao.mainDiscountProduct();
	}

	public List<ProductVo> mainHitProduct() {
		return dao.mainHitProduct();
	}

	public List<ProductVo> mainScoreProduct() {
		return dao.mainScoreProduct();
	}

	public List<ProductVo> mainNewProduct() {
		return dao.mainNewProduct();
	}

	public ProductVo best1() {
		return dao.best1();
	}

	public List<ProductVo> mainBestProduct() {
		return dao.mainBestProduct();
	}

}
