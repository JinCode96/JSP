package kr.co.Kmarket.controller.admin.cs.qna;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.QnaArticleVo;

@WebServlet("/admin/cs/qna/reply.do")
public class ReplyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		
		Map<String, Object> map = service.selectQna(no);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("pg", pg);
		req.setAttribute("map", map);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/qna/reply.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String cate1forp 	= req.getParameter("cate1forp");
		String cate2forp 	= req.getParameter("cate2forp");
		String pg 	= req.getParameter("pg");
		
		String cate1 	= req.getParameter("cate1");
		String cate2 	= req.getParameter("cate2");
		String parent = req.getParameter("no");
		String content 	= req.getParameter("content");
		String uid 		= req.getParameter("uid");
		String regip 	= req.getRemoteAddr();
		
		QnaArticleVo vo = new QnaArticleVo();
		vo.setCate1(cate1);
		vo.setCate2(cate2);
		vo.setParent(parent);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		service.insertQnaReply(vo);
		
		resp.sendRedirect("/Kmarket/admin/cs/qna/view.do?cate1="+cate1forp+"&cate2="+cate2forp+"&no="+parent+"&pg="+pg);
		
	}

}
