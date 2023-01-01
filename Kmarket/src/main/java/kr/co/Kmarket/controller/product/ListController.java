package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		int cate2 = Integer.parseInt(req.getParameter("cate2"));
		String sort = req.getParameter("sort");
		String pg = req.getParameter("pg");
		
		// 카테고리 이름 가져오기
		String cateName[] = service.getCateName(cate1, cate2);		
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotal(cate1, cate2);
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 현재 페이지 게시물 가져오기
		List<ProductVo> products = service.selectProducts(cate1, cate2, sort, start);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("c1Name", cateName[0]);
		req.setAttribute("c2Name", cateName[1]);
		req.setAttribute("sort", sort);
		
		
		req.setAttribute("products", products);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroup[0]);
		req.setAttribute("pageGroupEnd", pageGroup[1]);
		req.setAttribute("total", total);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
