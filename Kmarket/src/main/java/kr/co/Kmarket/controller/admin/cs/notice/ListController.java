package kr.co.Kmarket.controller.admin.cs.notice;

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
import kr.co.Kmarket.vo.AdminCsNoticeVo;
import kr.co.Kmarket.vo.NoticeArticleVo;

@WebServlet("/admin/cs/notice/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(getClass());
			
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int cate = Integer.parseInt(req.getParameter("cate"));
		String pg = req.getParameter("pg");
	
	
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotal(cate);
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 페이지 시작 번호
		int pageStartNum = total - start;
		
		// 현재 페이지 게시물 가져오기
		List<NoticeArticleVo> notices = null;
		
		if(cate == 0) {
			notices = service.selectNotices(start);
		}else {
			notices = service.selectNoticesByCate(cate, start);
		}
		
		req.setAttribute("notices", notices);
		req.setAttribute("cate", cate);
		req.setAttribute("pg", pg);
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroup[0]);
		req.setAttribute("pageGroupEnd", pageGroup[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("total", total);

		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/notice/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int cate = Integer.parseInt(req.getParameter("cate"));
		String pg = req.getParameter("pg");
	
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수
		int total = service.selectCountTotal(cate);
		
		// 페이지 마지막 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] pageGroup = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 페이지 시작 번호
		int pageStartNum = total - start;
		
		// 현재 페이지 게시물 가져오기
		List<NoticeArticleVo> notices = null;
		
		if(cate == 0) {
			notices = service.selectNotices(start);
		}else {
			notices = service.selectNoticesByCate(cate, start);
		}
		
		AdminCsNoticeVo vo = new AdminCsNoticeVo();
		vo.setCate(cate);
		vo.setCurrentPage(currentPage);
		vo.setTotal(total);
		vo.setLastPageNum(lastPageNum);
		vo.setPageGroupStart(pageGroup[0]);
		vo.setPageGroupEnd(pageGroup[1]);
		vo.setPageStartNum(pageStartNum+1);
		vo.setNotices(notices);
		
		Gson gson = new Gson();
		
		resp.setContentType("text/html;charset=UTF-8"); // 인코딩
		PrintWriter writer = resp.getWriter();		
		writer.print(gson.toJson(vo));
		
	}

}
