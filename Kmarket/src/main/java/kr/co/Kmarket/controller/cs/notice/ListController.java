package kr.co.Kmarket.controller.cs.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Kmarket.service.cs.CsService;
import kr.co.Kmarket.vo.NoticeArticleVo;

@WebServlet("/cs/notice/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 공지사항 질문 그룹
		int cate = Integer.parseInt(req.getParameter("cate"));
		String pg = req.getParameter("pg");
		
		// 1차 카테고리 이름 
		String cateName = service.getCateName(cate);
		
		req.setAttribute("cate", cate);
		req.setAttribute("cateName", cateName);
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPageNotice(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotalNotice(cate);
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNumNotice(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNumNotice(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNumNotice(currentPage);
		
		// 현재 페이지 게시물 가져오기
		List<NoticeArticleVo> articles = null;
		
		articles = service.selectNoticeArticles(cate, start);
		
		req.setAttribute("articles", articles);
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroup[0]);
		req.setAttribute("pageGroupEnd", pageGroup[1]);
		req.setAttribute("total", total);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/notice/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
