package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/view.do")
public class ViewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		int cate2 = Integer.parseInt(req.getParameter("cate2"));
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		
		// 카테고리 이름 가져오기
		String cateName[] = service.getCateName(cate1, cate2);
		
		// 상품 가져오기
		ProductVo product = service.selectProduct(prodNo);
		
		req.setAttribute("c1Name", cateName[0]);
		req.setAttribute("c2Name", cateName[1]);
		req.setAttribute("product", product);
		
		// 조회수 +1;
		service.updateProductHit(prodNo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 주문하기
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		int count = Integer.parseInt(req.getParameter("count"));

		List<ProductVo> orders = service.selectOrder(prodNo, count);
		
		// 세션에 값을 저장
		HttpSession sess = req.getSession();
		sess.setAttribute("sessOrder", orders);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", orders.size());
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	
	}
	
}
