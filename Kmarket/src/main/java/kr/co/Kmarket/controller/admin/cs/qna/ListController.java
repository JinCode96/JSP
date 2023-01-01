package kr.co.Kmarket.controller.admin.cs.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.AdminCsQnaCateVo;
import kr.co.Kmarket.vo.AdminCsQnaVo;
import kr.co.Kmarket.vo.QnaArticleVo;

@WebServlet("/admin/cs/qna/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		int cate2 = Integer.parseInt(req.getParameter("cate2"));
		
		String pg = req.getParameter("pg");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		
		int total = 0;
		
		if(cate2 == 0) { // 2차 카테고리를 선택하지 않을 경우
			total = service.selectCountTotalForQna(cate1);
		}else { // 2차 카테고리 있을 경우
			total = service.selectCountTotalForQna(cate1, cate2);
		}
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 페이지 시작 번호
		int pageStartNum = total - start;
		
		// 현재 페이지 게시물 가져오기
		List<QnaArticleVo> qnas = null;
		
		if(cate1 == 0) { // 전체 게시글 가져오기
			qnas = service.selectQnas(start);
		}else if(cate2 == 0) { // 1차 카테고리에 맞는글 가져오기
			qnas = service.selectQnasByCate(cate1,start);
		}else { // 1차-2차 카테고리에 맞는 글 가져오기 
			qnas = service.selectQnasByCate(cate1,cate2,start);
		}
		
		req.setAttribute("qnas", qnas);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("pg", pg);
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroup[0]);
		req.setAttribute("pageGroupEnd", pageGroup[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("total", total);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/qna/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		int cate2 = Integer.parseInt(req.getParameter("cate2"));
		
		String pg = req.getParameter("pg");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		
		int total = 0;
		
		if(cate2 == 0) { // 2차 카테고리를 선택하지 않을 경우
			total = service.selectCountTotalForQna(cate1);
		}else { // 2차 카테고리 있을 경우
			total = service.selectCountTotalForQna(cate1, cate2);
		}
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 페이지 시작 번호
		int pageStartNum = total - start;
		
		// 현재 페이지 게시물 가져오기
		List<QnaArticleVo> qnas = null;
		
		if(cate1 == 0) { // 전체 게시글 가져오기
			qnas = service.selectQnas(start);
		}else if(cate2 == 0) { // 1차 카테고리에 맞는글 가져오기
			qnas = service.selectQnasByCate(cate1,start);
		}else { // 1차-2차 카테고리에 맞는 글 가져오기 
			qnas = service.selectQnasByCate(cate1,cate2,start);
		}
		
		// 카테고리 가져오기
		List<AdminCsQnaCateVo> cates = service.getQnaCate(cate1);
		
		AdminCsQnaVo vo = new AdminCsQnaVo();
		vo.setCate1(cate1);
		vo.setCate2(cate2);
		vo.setCurrentPage(currentPage);
		vo.setTotal(total);
		vo.setLastPageNum(lastPageNum);
		vo.setPageGroupStart(pageGroup[0]);
		vo.setPageGroupEnd(pageGroup[1]);
		vo.setPageStartNum(pageStartNum+1);
		vo.setQnas(qnas);
		vo.setCates(cates);

		Gson gson = new Gson();
		
		resp.setContentType("text/html;charset=UTF-8"); // 인코딩
		PrintWriter writer = resp.getWriter();		
		writer.print(gson.toJson(vo));
	
	}
	

}
