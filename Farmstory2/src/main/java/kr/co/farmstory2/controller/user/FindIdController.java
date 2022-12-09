package kr.co.farmstory2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.co.farmstory2.service.UserService;
import kr.co.farmstory2.vo.UserVO;

@WebServlet("/user/findId.do")
public class FindIdController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.instance;
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/findId.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserVO vo = null;
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		vo = service.selectUserForFindId(name, email);
		
		// json 출력
		JsonObject json = new JsonObject();
		
		if(vo != null) {
			// 일치하는 회원이 있다면
			json.addProperty("result", 1);
			
			// findIdResult에서 표현식으로 출력. 저장된 vo값을 session 영역인 sessUserForId에 저장.
			HttpSession sess = req.getSession();
			sess.setAttribute("sessUserForId", vo);
		}else {
			// 일치하는 회원이 없다면
			json.addProperty("result", 0);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
}
