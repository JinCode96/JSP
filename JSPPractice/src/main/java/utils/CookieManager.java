package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

// 쿠키를 편리하게 사용할 수 있게 도와주는 클래스
public class CookieManager {

	// 명시한 이름, 값, 유지 기간 조건으로 새로운 쿠키를 생성합니다.
	public static void makeCookie(HttpServletResponse response, String cName,
			String cValue, int cTime) {
		
		Cookie cookie = new Cookie(cName, cValue); // 쿠키 생성
		cookie.setPath("/"); // 경로 설정
		cookie.setMaxAge(cTime); // 유지기간 설정
		response.addCookie(cookie); // 응답 객체에 추가
	}
	
	// 명시한 이름의 쿠키를 찾아 그 값을 반환합니다
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = ""; // 반환값
		 
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue(); // 반환값 갱신
				}
			}
		}
		return cookieValue;
	}
	// 명시한 이름의 쿠키를 삭제합니다.
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
	
}
