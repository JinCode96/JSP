package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.product.ProductService;
import kr.co.Kmarket.vo.MemberVo;
import kr.co.Kmarket.vo.ProductVo;

@WebServlet("/product/delete.do")
public class CartDeletController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = ProductService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("도착!");
		String cartlist[] = req.getParameterValues("cartlist");
		System.out.println("카트 번호2:" + Arrays.toString(cartlist));

		HashMap<Integer, Integer> map = new HashMap<>();
		for (int i = 1; i < cartlist.length + 1; i++) {
			// nember.add(Integer.parseInt(carts[i]));
			map.put(i, Integer.parseInt(cartlist[i - 1]));
		}
		System.out.println("카트 포스트:" + map);
		int result = service.deleteCartProductlist(map);
		JsonObject json = new JsonObject();
		System.out.println("result 딜리트:" + result);

		json.addProperty("result", result);

		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());

	}
}
