package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Kmarket.service.member.MemberService;
import kr.co.Kmarket.vo.MemberVo;

@WebServlet("/member/registerSeller.do")
public class RegisterSellerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberService service = MemberService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/registerSeller.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String uid = req.getParameter("km_uid");
		String pass = req.getParameter("km_pass1");
		String company = req.getParameter("kms_company");
		String ceo = req.getParameter("kms_ceo");
		String bizRegNum = req.getParameter("kms_corp_reg");
		String comRegNum = req.getParameter("kms_online_reg");
		String tel = req.getParameter("kms_tel");
		String fax = req.getParameter("kms_fax");
		String email = req.getParameter("kms_email");
		String zip = req.getParameter("kms_zip");
		String addr1 = req.getParameter("kms_addr1");
		String addr2 = req.getParameter("kms_addr2");
		String manager = req.getParameter("km_name");
		String managerHp = req.getParameter("km_hp");
		String regip = req.getRemoteAddr();
	
		MemberVo member = new MemberVo();
		
		member.setUid(uid);
		member.setPass(pass);
		member.setCompany(company);
		member.setCeo(ceo);
		member.setBizRegNum(bizRegNum);
		member.setComRegNum(comRegNum);
		member.setTel(tel);
		member.setFax(fax);
		member.setEmail(email);
		member.setZip(zip);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setManager(manager);
		member.setManagerHp(managerHp);
		member.setRegip(regip);
		
		service.insertSeller(member);
	
		// 리다이렉트
		resp.sendRedirect("/Kmarket/member/login.do");
		
	}
	
}
