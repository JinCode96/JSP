package kr.co.Kmarket.controller.cs.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.cs.CsService;
import kr.co.Kmarket.vo.QnaArticleVo;

@WebServlet("/cs/qna/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		// 자주묻는 질문 그룹 
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		String pg = req.getParameter("pg");
	
		// 1차 카테고리 이름 
		String c1name = service.getC1name(cate1);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("c1name", c1name);
	
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotal(cate1);
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 현재 페이지 게시물 가져오기
		List<QnaArticleVo> articles  = null;
		
		articles = service.selectArticles(cate1, start);
		
		req.setAttribute("articles", articles);
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroup[0]);
		req.setAttribute("pageGroupEnd", pageGroup[1]);
		req.setAttribute("total", total);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/qna/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
