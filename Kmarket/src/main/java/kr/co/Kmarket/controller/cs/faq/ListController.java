package kr.co.Kmarket.controller.cs.faq;

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
import kr.co.Kmarket.vo.csFaqVo;

@WebServlet("/cs/faq/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		logger.info("FaqListController...");
		int cate1 = Integer.parseInt(req.getParameter("cate1"));
		
		List<csFaqVo> articles = service.selectFaq(cate1);
		List<csFaqVo> cateNames = service.selectCateName(cate1);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("articles", articles);
		req.setAttribute("cateNames", cateNames);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/faq/list.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
