package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.ProductCartVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/addcart.do")
public class AddCartController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 장바구니 담기
		String uid = req.getParameter("uid");
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		int count = Integer.parseInt(req.getParameter("count"));
		int price = Integer.parseInt(req.getParameter("price"));
		int discount = Integer.parseInt(req.getParameter("discount"));
		int point = Integer.parseInt(req.getParameter("point"));
		int delivery = Integer.parseInt(req.getParameter("delivery"));
		int total = count * price * (1- discount/100);

		
		ProductCartVo cart = new ProductCartVo();
		cart.setUid(uid);
		cart.setProdNo(prodNo);
		cart.setCount(count);
		cart.setPrice(price);
		cart.setDiscount(discount);
		cart.setPoint(point);
		cart.setDelivery(delivery);
		cart.setTotal(total);
		
		int result = service.insertCart(cart);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	
	}

}
