package kr.co.Kmarket.dao.main;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.ProductVo;

public class MainDao extends DBHelper {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	public List<ProductVo> mainDiscountProduct() {
		List<ProductVo> disproducts = new ArrayList<>();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_DISCOUNT_PRODUCTS);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);

			rs = psmt.executeQuery();

			while (rs.next()) {

				ProductVo vo = new ProductVo();
				String prodCate1 = rs.getString("prodCate1");
				String prodCate2 = rs.getString("prodCate2");
				String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

				vo.setProdNo(rs.getInt("prodNo"));
				vo.setProdCate1(prodCate1);
				vo.setProdCate2(prodCate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getInt("price"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				int price = vo.getPrice();
				int discount = vo.getDiscount();
				int a = 100 - discount;
				double z = (double) a / 100;
				double f = Math.round(price * z); // 소수점 반올림
				int disprice = (int) f; // 타입변환
				vo.setDisprice(disprice);
				disproducts.add(vo);

			}
			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return disproducts;
	}

	public List<ProductVo> mainHitProduct() {
		List<ProductVo> hitproducts = new ArrayList<>();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_HIT_PRODUCTS);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);

			rs = psmt.executeQuery();

			while (rs.next()) {

				ProductVo vo = new ProductVo();
				String prodCate1 = rs.getString("prodCate1");
				String prodCate2 = rs.getString("prodCate2");
				String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

				vo.setProdNo(rs.getInt("prodNo"));
				vo.setProdCate1(prodCate1);
				vo.setProdCate2(prodCate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getInt("price"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				int price = vo.getPrice();
				int discount = vo.getDiscount();
				int a = 100 - discount;
				double z = (double) a / 100;
				double f = Math.round(price * z); // 소수점 반올림
				int disprice = (int) f; // 타입변환
				vo.setDisprice(disprice);
				hitproducts.add(vo);

			}
			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return hitproducts;
	}

	public List<ProductVo> mainScoreProduct() {
		List<ProductVo> scoreproducts = new ArrayList<>();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_SCORE_PRODUCTS);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);

			rs = psmt.executeQuery();

			while (rs.next()) {

				ProductVo vo = new ProductVo();
				String prodCate1 = rs.getString("prodCate1");
				String prodCate2 = rs.getString("prodCate2");
				String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

				vo.setProdNo(rs.getInt("prodNo"));
				vo.setProdCate1(prodCate1);
				vo.setProdCate2(prodCate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getInt("price"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				int price = vo.getPrice();
				int discount = vo.getDiscount();
				int a = 100 - discount;
				double z = (double) a / 100;
				double f = Math.round(price * z); // 소수점 반올림
				int disprice = (int) f; // 타입변환
				vo.setDisprice(disprice);
				scoreproducts.add(vo);

			}
			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return scoreproducts;
	}

	public List<ProductVo> mainNewProduct() {
		List<ProductVo> newproducts = new ArrayList<>();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_NEW_PRODUCTS);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);

			rs = psmt.executeQuery();

			while (rs.next()) {

				ProductVo vo = new ProductVo();
				String prodCate1 = rs.getString("prodCate1");
				String prodCate2 = rs.getString("prodCate2");
				String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

				vo.setProdNo(rs.getInt("prodNo"));
				vo.setProdCate1(prodCate1);
				vo.setProdCate2(prodCate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getInt("price"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				 vo.setThumb2(path + rs.getString("thumb2"));
				 vo.setThumb3(path + rs.getString("thumb3"));
				 vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				int price = vo.getPrice();
				int discount = vo.getDiscount();
				int a = 100 - discount;
				double z = (double) a / 100;
				double f = Math.round(price * z); // 소수점 반올림
				int disprice = (int) f; // 타입변환
				vo.setDisprice(disprice);
				newproducts.add(vo);

			}
			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return newproducts;
	}

	public ProductVo best1() {
		ProductVo best1 = new ProductVo();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_BEST1_PRODUCT);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);
			rs = psmt.executeQuery();

			ProductVo vo = new ProductVo();
			String prodCate1 = rs.getString("prodCate1");
			String prodCate2 = rs.getString("prodCate2");
			String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

			vo.setProdNo(rs.getInt("prodNo"));
			vo.setProdCate1(prodCate1);
			vo.setProdCate2(prodCate2);
			vo.setProdName(rs.getString("prodName"));
			vo.setDescript(rs.getString("descript"));
			vo.setCompany(rs.getString("company"));
			vo.setSeller(rs.getString("seller"));
			vo.setPrice(rs.getInt("price"));
			vo.setDiscount(rs.getInt("discount"));
			vo.setPoint(rs.getInt("point"));
			vo.setStock(rs.getInt("stock"));
			vo.setSold(rs.getInt("sold"));
			vo.setDelivery(rs.getInt("delivery"));
			vo.setHit(rs.getInt("hit"));
			vo.setScore(rs.getInt("score"));
			vo.setReview(rs.getInt("review"));
			vo.setThumb1(path + rs.getString("thumb1"));
			vo.setThumb2(path + rs.getString("thumb2"));
			vo.setThumb3(path + rs.getString("thumb3"));
			vo.setDetail(path + rs.getString("detail"));
			vo.setStatus(rs.getString("status"));
			vo.setDuty(rs.getString("duty"));
			vo.setReceipt(rs.getString("receipt"));
			vo.setBizType(rs.getString("bizType"));
			vo.setOrigin(rs.getString("origin"));
			vo.setIp(rs.getString("ip"));
			vo.setRdate(rs.getString("rdate"));
			int price = vo.getPrice();
			int discount = vo.getDiscount();
			int a = 100 - discount;
			double z = (double) a / 100;
			double f = Math.round(price * z); // 소수점 반올림
			int disprice = (int) f; // 타입변환
			vo.setDisprice(disprice);

			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return best1;
	}

	public List<ProductVo> mainBestProduct() {
		List<ProductVo> best = new ArrayList<>();

		try {

			conn = getConnection();

			psmt = conn.prepareStatement(Sql.SELECT_MAIN_BEST_PRODUCTS);
			// psmt.setString(1, uid);
			// psmt.setInt(2, limitStart);

			rs = psmt.executeQuery();

			while (rs.next()) {

				ProductVo vo = new ProductVo();
				String prodCate1 = rs.getString("prodCate1");
				String prodCate2 = rs.getString("prodCate2");
				String path = "/thumb/" + prodCate1 + "/" + prodCate2 + "/";

				vo.setProdNo(rs.getInt("prodNo"));
				vo.setProdCate1(prodCate1);
				vo.setProdCate2(prodCate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getInt("price"));
				vo.setDiscount(rs.getInt("discount"));
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				int price = vo.getPrice();
				int discount = vo.getDiscount();
				int a = 100 - discount;
				double z = (double) a / 100;
				double f = Math.round(price * z); // 소수점 반올림
				int disprice = (int) f; // 타입변환
				vo.setDisprice(disprice);
				best.add(vo);

			}
			close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return best;
	}
}
