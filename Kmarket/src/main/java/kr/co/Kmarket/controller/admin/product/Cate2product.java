package kr.co.Kmarket.controller.admin.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.ProductCate2Vo;

@WebServlet("/admin/product/getCate2.do")
public class Cate2product extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private AdminService service = AdminService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 출력 인코딩 설정
		resp.setContentType("application/json;charset=UTF-8");
		// 카테고리2 불러오기
		String cate1 = req.getParameter("cate1");
		
		List<ProductCate2Vo> vos = service.selectcate2(cate1);
		
		// 출력
		resp.getWriter().print(new Gson().toJson(vos));
	}
}