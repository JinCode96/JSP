package kr.co.Kmarket.controller.admin.cs.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.NoticeArticleVo;

@WebServlet("/admin/cs/notice/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no = req.getParameter("no");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String from = req.getParameter("from");
		
		NoticeArticleVo vo = service.selectNotice(no);
		
		req.setAttribute("vo", vo);
		req.setAttribute("cate", cate);
		req.setAttribute("no", no);
		req.setAttribute("pg", pg);
		req.setAttribute("from", from);
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/notice/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		int no = Integer.parseInt(req.getParameter("no"));
		int cateforp = Integer.parseInt(req.getParameter("cateforp")); // 주소 파라미터용 카테
		int cate = Integer.parseInt(req.getParameter("cate"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		//String uid = req.getParameter("uid");
		//String regip = req.getRemoteAddr();
		
		String cateName = null;
		
		if(cate == 1) {
			cateName = "고객서비스";
		}else if(cate == 2) {
			cateName = "안전거래";
		}else if(cate == 3) {
			cateName ="위해상품";
		}else if(cate == 4) {
			cateName ="이벤트당첨";
		}
		
		NoticeArticleVo vo = new NoticeArticleVo();
		
		vo.setNo(no);
		vo.setCate(cate);
		vo.setTitle(title);
		vo.setContent(content);;
		vo.setCateName(cateName);
		//vo.setUid(uid);
		//vo.setRegip(regip)
		
		service.updateNotice(vo);
		
		resp.sendRedirect("/Kmarket/admin/cs/notice/view.do?cate="+cateforp+"&no="+no+"&pg="+pg);
	
	}

}
