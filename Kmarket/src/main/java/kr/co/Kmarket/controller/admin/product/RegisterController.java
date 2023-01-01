package kr.co.Kmarket.controller.admin.product;

import java.io.IOException;



import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.admin.AdminService;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/admin/product/register.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, maxRequestSize = 1024 * 1024 * 5)
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private AdminService service = AdminService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 카테고리1 리스트 불러오기
		service.selectcate1();
		req.setAttribute("vos", service.selectcate1());
		req.getRequestDispatcher("/admin/product/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/thumb");
		
		// 업로드 디렉터리의 물리적 경로 확인

		String cate1 = req.getParameter("prodCate1");
		String cate2 = req.getParameter("prodCate2");
		String saveDirectory = path + "/" + cate1 + "/" + cate2 + "/";

		// 디렉토리 생성
		service.dirCreate(saveDirectory);

		ProductVo product = service.insertProductVO(req);

		// 파일 업로드
		product = service.uploadFile2(req, saveDirectory, product);

		// 데이터 베이스 처리
		int result = service.insertAdminProduct(product);

		// 이동
		if (result == 0) {
			//logger.debug("실패"); // 실패시
		} else {
			//logger.debug("성공");

		} // 성공시
		System.out.println("성공?");
		System.out.println("product"+product);
		resp.sendRedirect("/Kmarket/admin/product/register.do");

	}
}
