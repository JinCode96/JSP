package kr.co.Kmarket.controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.MemberVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/admin/product/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String pg = req.getParameter("pg");
		String keyword = req.getParameter("keyword");
		String category = req.getParameter("category");
		
		// 세션에서 가져오기
		HttpSession sess = req.getSession();
		MemberVo sessUser = (MemberVo) sess.getAttribute("sessUser");
		String uid = sessUser.getUid();
		int level = sessUser.getLevel();
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotal();
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int limitStart = service.getStartNum(currentPage);
		
		// 상품 불러오기
		List<ProductVo> products = null;
		
		if(level == 7) {
			// 최고 관리자일 경우 모든 상품 출력
			if(keyword==null) {
				// 키워드 전송을 하지 않았을 경우
				products = service.selectAdminProducts7(limitStart);
			}else {
				// 키워드가 전송되었을 경우
				products = service.selectAdminProductsByKeyword7(category, keyword, limitStart);
			}
		}else {
			// 일반 판매자일 경우 판매자가 올린 상품만 출력
			if(keyword==null) {
				// 키워드 전송을 하지 않았을 경우
				products = service.selectAdminProducts(uid, limitStart);
			}else {
				// 키워드가 전송되었을 경우
				products = service.selectAdminProductsByKeyword(uid, category, keyword, limitStart);
			}
		}
		
		req.setAttribute("products", products);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodNo1 = req.getParameter("prodNo");
		
		int prodNo = Integer.parseInt(prodNo1);
		
		int result = service.deleteAdminProduct(prodNo);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
	
}