package kr.co.Kmarket.controller.main;

import java.io.IOException;
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

import kr.co.Kmarket.service.main.MainService;
import kr.co.Kmarket.vo.MemberVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private MainService service = MainService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 상품 불러오기
		List<ProductVo> hitproducts = service.mainHitProduct(); //히트상품
		List<ProductVo> scoreproducts = service.mainScoreProduct(); //추천상품
		List<ProductVo> newproducts = service.mainNewProduct(); //최신상품
		List<ProductVo> disproducts = service.mainDiscountProduct(); //할인상품
	//	ProductVo Best1 = service.best1();
		List<ProductVo> best = service.mainBestProduct(); //할인상품
	//	req.setAttribute("Best1", Best1);
		req.setAttribute("best", best);
		req.setAttribute("hitproducts", hitproducts);
		req.setAttribute("scoreproducts", scoreproducts);
		req.setAttribute("newproducts", newproducts);
		req.setAttribute("disproducts", disproducts);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
