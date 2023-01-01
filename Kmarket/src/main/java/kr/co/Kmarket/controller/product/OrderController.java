package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.ProductOrderVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/order.do")
public class OrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String ordUid = req.getParameter("ordUid");
		String ordCount = req.getParameter("ordCount");
		String ordPrice = req.getParameter("ordPrice");
		String ordDiscount = req.getParameter("ordDiscount");
		String ordDelivery = req.getParameter("ordDelivery");
		String savePoint = req.getParameter("savePoint");
		String usedPoint = req.getParameter("usedPoint");
		String ordTotPrice = req.getParameter("ordTotPrice");
		String recipName = req.getParameter("recipName");
		String recipHp = req.getParameter("recipHp");
		String recipZip = req.getParameter("recipZip");
		String recipAddr1 = req.getParameter("recipAddr1");
		String recipAddr2 = req.getParameter("recipAddr2");
		String ordPayment = req.getParameter("ordPayment");
		

		
		ProductOrderVo vo = new ProductOrderVo();
		
		vo.setOrdUid(ordUid);
		vo.setOrdCount(ordCount);
		vo.setOrdPrice(ordPrice);
		vo.setOrdDiscount(ordDiscount);
		vo.setOrdDelivery(ordDelivery);
		vo.setSavePoint(savePoint);
		vo.setUsedPoint(usedPoint);
		vo.setOrdTotPrice(ordTotPrice);
		vo.setRecipName(recipName);
		vo.setRecipHp(recipHp);
		vo.setRecipZip(recipZip);
		vo.setRecipAddr1(recipAddr1);
		vo.setRecipAddr2(recipAddr2);
		vo.setOrdPayment(ordPayment);
		
		// 바로 결제하기 눌렸을 때
		String ordNo = service.insertOrderProduct(vo);
		
		logger.debug("ordNo : " + ordNo);
		
		JsonObject json = new JsonObject();
		json.addProperty("ordNo", ordNo);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
}
