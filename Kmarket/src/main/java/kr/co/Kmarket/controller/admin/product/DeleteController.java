package kr.co.Kmarket.controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.admin.AdminService;

@WebServlet("/admin/product/delete.do")
public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("도착!");
		String adminlist[] = req.getParameterValues("adminlist");
		System.out.println("카트 번호2:" + Arrays.toString(adminlist));

		HashMap<Integer, Integer> map = new HashMap<>();
		for (int i = 1; i < adminlist.length + 1; i++) {
			// nember.add(Integer.parseInt(carts[i]));
			map.put(i, Integer.parseInt(adminlist[i - 1]));
		}
		System.out.println("카트 포스트:" + map);
		int result = service.deleteAdminProductlist(map);
		JsonObject json = new JsonObject();
		System.out.println("result 딜리트:" + result);

		json.addProperty("result", result);

		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());		
		
	}
	
}
