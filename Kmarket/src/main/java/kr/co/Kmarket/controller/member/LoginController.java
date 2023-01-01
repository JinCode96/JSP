package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Kmarket.service.member.MemberService;
import kr.co.Kmarket.vo.MemberVo;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberService service = MemberService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String success = req.getParameter("success");
		req.setAttribute("success", success);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/login.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		String auto = req.getParameter("auto");

		MemberVo vo = service.selectMember(uid, pass);

		if (vo != null) {
			
			// 회원이 맞을경우
			HttpSession sess = req.getSession();
			sess.setAttribute("sessUser", vo);

			if (auto != null) {

				String sessId = sess.getId();

				// 쿠키 생성
				Cookie cookie = new Cookie("sessid", sessId);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 3);
				resp.addCookie(cookie);

				// sessId 데이터베이스 저장
				service.updateMemberForSession(uid, sessId);
			}
			resp.sendRedirect("/Kmarket/index.do");

		} else {
			// 회원이 아닌경우
			resp.sendRedirect("/Kmarket/member/login.do?success=100");
		}
	}

}
