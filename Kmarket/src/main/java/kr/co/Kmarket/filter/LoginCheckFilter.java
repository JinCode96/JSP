package kr.co.Kmarket.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.vo.MemberVo;

public class LoginCheckFilter implements Filter {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	private List<String> uriList;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 필터를 동작할 요청주소 리스트 구성

		uriList = new ArrayList<>();
		uriList.add("/Kmarket/admin/index.do");
		uriList.add("/Kmarket/admin/product/list.do");
		uriList.add("/Kmarket/admin/product/register.do");
		uriList.add("/Kmarket/product/cart.do");
		uriList.add("/Kmarket/product/order.do");
		uriList.add("/Kmarket/product/complete.do");
		uriList.add("/Kmarket/cs/qna/write.do");

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();

		HttpSession sess = req.getSession();
		MemberVo sessUser = (MemberVo) sess.getAttribute("sessUser");


		if (uriList.contains(uri)) {
			// 로그인을 하지 않았을 경우
			//logger.debug("here2");

			if (sessUser == null) {
				//logger.debug("here3");
				((HttpServletResponse) response).sendRedirect("/Kmarket/member/login.do");
				return;
			}

		} else if (uri.contains("/Kmarket/member/login.do")) {
			// 로그인을 했을 경우
			//logger.debug("here4");
			if (sessUser != null) {
				//logger.debug("here5");
				((HttpServletResponse) response).sendRedirect("/Kmarket/index.do");
				//((HttpServletResponse) response).sendRedirect("/Kmarket/..");
				return;
			}
		}

		//logger.debug("here6");
		chain.doFilter(request, response);

	}
}