package kr.co.Kmarket.controller.admin;



import javax.servlet.http.HttpServlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.admin.AdminService;


@WebServlet("/admin/index.do")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private AdminService service = AdminService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자메인
		String uid = req.getParameter("uid");
		System.out.println("어드민 아이디:"+uid);
		int orderCount = service.orderCount();//총 주문건수
		int orderCountY = service.orderCountY();//총 주문건수 어제
		int orderCountW = service.orderCountW();//총 주문건수 주간 
		int orderCountM = service.orderCountM();//총 주문건수 월간
		int orderPrice = service.orderPrice(); //주문금액
		int orderPriceY = service.orderPriceY(); //주문금액 어제
		int orderPriceW = service.orderPriceW(); //주문금액 주간
		int orderPriceM = service.orderPriceM(); //주문금액 월간
		int memberCount =service.memberCount(); //회원가입명수 
		int memberCountY =service.memberCountY(); //회원가입명수 어제
		int memberCountW =service.memberCountW(); //회원가입명수 주간
		int memberCountM =service.memberCountM(); //회원가입명수 월간
		int productCount = service.productCount(); //신규게시물 
		int productY = service.productY(); //신규게시물 어제
		int productW = service.productW(); //신규게시물 주간
		int productM = service.productM(); //신규게시물 월간
		//int visitCount;
		req.setAttribute("orderCOunt", orderCount);
		req.setAttribute("orderCountY", orderCountY);
		req.setAttribute("orderCountW", orderCountW);
		req.setAttribute("orderCountM", orderCountM);
		req.setAttribute("orderPrice", orderPrice);
		req.setAttribute("orderPriceY", orderPriceY);
		req.setAttribute("orderPriceW", orderPriceW);
		req.setAttribute("orderPriceM", orderPriceM);
		req.setAttribute("memberCount", memberCount);
		req.setAttribute("memberCountY", memberCountY);
		req.setAttribute("memberCountW", memberCountW);
		req.setAttribute("memberCountM", memberCountM);
		req.setAttribute("productCount", productCount);
		req.setAttribute("productY", productY);
		req.setAttribute("productW", productW);
		req.setAttribute("productM", productM);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
