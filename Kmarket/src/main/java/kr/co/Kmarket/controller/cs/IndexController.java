package kr.co.Kmarket.controller.cs;

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
import kr.co.Kmarket.vo.QnaArticleVo;

@WebServlet("/cs/index.do")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//리스트 가져오기
		List<NoticeArticleVo> notices = service.selectLatestNotices();
		List<QnaArticleVo> qnas = service.selectLatestQnas();
		
		req.setAttribute("notices", notices);
		req.setAttribute("qnas", qnas);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
