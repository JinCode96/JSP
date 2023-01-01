package kr.co.Kmarket.controller.cs.qna;

import java.io.IOException;

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

@WebServlet("/cs/qna/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {}
	
	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate1 = req.getParameter("cate1");
		
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/qna/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String cate1 	= req.getParameter("cate1");
		String cate2 	= req.getParameter("cate2");
		String title	= req.getParameter("title");
		String content 	= req.getParameter("content");
		String uid 		= req.getParameter("uid");
		String regip 	= req.getRemoteAddr();
		
		QnaArticleVo vo = new QnaArticleVo();
		vo.setCate1(cate1);
		vo.setCate2(cate2);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		
		int result = service.insertQnaArticle(vo);
		
		if(result > 0) {
			resp.sendRedirect("/Kmarket/cs/qna/list.do?cate1="+cate1);
		}
	
	}
	
}
