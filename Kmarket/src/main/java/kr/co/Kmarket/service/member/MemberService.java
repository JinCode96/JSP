package kr.co.Kmarket.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.dao.member.MemberDao;
import kr.co.Kmarket.vo.MemberVo;
import kr.co.Kmarket.vo.TermsVo;

public enum MemberService {

	
	INSTANCE;
	private  MemberDao dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService() {
		dao = new MemberDao();
	}

	public void insertMember(MemberVo member) {
		dao.insertMember(member);
	}
	
	public void insertSeller(MemberVo member) {
		dao.insertSeller(member);
	}
	
	public MemberVo selectMemberBySessId(String sessId) {
		return dao.selectMemberBySessId(sessId);
	}

	public MemberVo selectMember(String uid, String pass) {
		return dao.selectMember(uid, pass);
	}
	
	public TermsVo selectTerms() {
		return dao.selectTerms();
	}

	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid); 
	}
	
	
	
	public void updateMemberForSessLimitDate(String sessId) {
		dao.updateMemberForSessLimitDate(sessId);
	}

	public void updateMemberForSession(String uid, String sessId) {
		dao.updateMemberForSession(uid, sessId);
	}

	public void updateMemberForSessionOut(String uid) {
		dao.updateMemberForSessionOut(uid);
	}
	
	// 추가적인 서비스 로직
	
	public int[] sendEmailCode(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		// 기본정보
		String sender = "3273bee@gmail.com";
		String password = "wbvaxxtpgjnmxtxt";
		
		String title = "Kmarket 인증코드 입니다.";
		String content = "<h1>인증 코드는 "+code+" 입니다.</h1>";
		
		// Gmail SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		// 메일 발송
		Message message = new MimeMessage(session);
		int status = 0;
		
		try {
			message.setFrom(new InternetAddress(sender, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(MimeUtility.encodeText(title, "UTF-8", "B"));
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			
			status = 1;
			
		}catch(Exception e) {
			e.printStackTrace();
			status = 0;
			logger.error("메일 전송 실패...");
		}
		
	
		int result[] = {status, code};
		
		return result;
		
	}
	
	
	public void sendResult(int result, HttpServletResponse resp) throws IOException {
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);

		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	
}