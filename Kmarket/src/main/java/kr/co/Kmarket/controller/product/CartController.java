package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.codegen.Opcodes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.MemberVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/cart.do")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = ProductService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession sess = req.getSession();
		MemberVo sessUser = (MemberVo)sess.getAttribute("sessUser");
		System.out.println("카트 컨트롤러:"+sessUser);
		/*
		if(sessUser == null) {
			
		}
		*/
		String uid = sessUser.getUid();
		//String uid = "jboard2";
		List<ProductVo> cart = service.cart(uid);
		
		req.setAttribute("cart", cart);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/cart.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
	
		String carts [] = req.getParameterValues("carts");
		//System.out.println("카트 번호2:"+Arrays.toString(carts));
		//System.out.println(carts[1]);
		//List<Integer> nember = new ArrayList<>();
		HashMap<Integer, Integer> map = new HashMap<>();
		for(int i=1; i< carts.length+1 ;i++) {
			//nember.add(Integer.parseInt(carts[i]));
			map.put(i, Integer.parseInt(carts[i-1]));
		}
		System.out.println("카트 포스트:"+map);
		List<ProductVo> cartsNo = service.cartNo(map);
		//System.out.println("카트 포스트컨트롤러:"+cartsNo);
		System.out.println("카트:"+cartsNo.size());

		
		// 세션에 값을 저장
		HttpSession sess = req.getSession();
		sess.setAttribute("sessOrder", cartsNo);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", cartsNo.size());
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}

}
