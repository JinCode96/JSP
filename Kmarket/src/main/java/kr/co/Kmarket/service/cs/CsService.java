package kr.co.Kmarket.service.cs;

import java.util.List;
import java.util.Map;

import kr.co.Kmarket.dao.cs.CsDao;
import kr.co.Kmarket.vo.NoticeArticleVo;
import kr.co.Kmarket.vo.QnaArticleVo;
import kr.co.Kmarket.vo.csFaqVo;

public enum CsService {
	
	INSTANCE;
	private  CsDao dao;
	
	
	private CsService() {
		dao = new CsDao();
	
	}
	
	// 진우
	public int insertQnaArticle(QnaArticleVo vo) {
		return dao.insertQnaArticle(vo);
	}
	
	public QnaArticleVo selectArtlcle(String no) {
		return dao.selectArtlcle(no);
	}
	
	public NoticeArticleVo selectArticleNotice(int no) {
		return dao.selectArticleNotice(no);
	}
	public List<csFaqVo> selectFaq(int cate1) {
		return dao.selectFaq(cate1);
	}
	
	public List<csFaqVo> selectCateName(int cate1) {
		return dao.selectCateName(cate1);
	}
	
	public csFaqVo selectArticleFaq(int faqNo) {
		return dao.selectFaqArticle(faqNo);
	}
	
	
	// 해빈
	
	public List<QnaArticleVo> selectArticles(int cate1, int start) {
		return dao.selectArticles(cate1, start);
	}
	
	public int selectCountTotal(int cate1) {
		return dao.selectCountTotal(cate1);
	}
	
	public List<NoticeArticleVo> selectLatestNotices(){
		return dao.selectLatestNotices();
	}
	
	public List<QnaArticleVo> selectLatestQnas(){
		return dao.selectLatestQnas();
	}

	
	public int getCurrentPage(String pg) {
		
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
		
	}
	
	public int getLastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = (total / 10);
		}else {
			lastPageNum = (total / 10) + 1;
		}
		
		return lastPageNum;
	}
	
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		
		int pageGroupCurrent = (int)Math.ceil(currentPage / 5.0);
		int pageGroupStart = (pageGroupCurrent -1) * 5 + 1;
		int pageGroupEnd = pageGroupCurrent * 5;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] pageGroup = {pageGroupStart, pageGroupEnd};
		
		return pageGroup;
		
	}

	public int getStartNum(int currentPage) {
		
		return (currentPage -1) * 10;
	}	
	

	
	public String getC1name(int cate1) {
		
		String c1name = null;
		
		switch(cate1) {
		case 1:
			c1name = "회원";
			break;
		case 2:
			c1name = "쿠폰/이벤트";
			break;
		case 3:
			c1name = "주문/결제";
			break;
		case 4:
			c1name = "배송";
			break;
		case 5:
			c1name = "취소/반품/교환";
			break;
		case 6:
			c1name = "여행/숙박/항공";
			break;
		case 7:
			c1name = "안전거래";
			break;
		}
		
		return c1name;
	}
	
	
	
	//현길

	public List<csFaqVo> selectFaq1(int cate1, int cate2) {
		return dao.selectFaq1(cate1, cate2);
	}

	public List<csFaqVo> selectFaq2(int cate1, int cate2) {
		return dao.selectFaq2(cate1, cate2);
	}

	// 진우
	public String getCateName(int cate) {
		
		String cateName = null;
		
		switch(cate) {
		case 1:
			cateName = "고객서비스";
			break;
		case 2:
			cateName = "안전거래";
			break;
		case 3:
			cateName = "위해상품";
			break;
		case 4:
			cateName = "이벤트당첨";
			break;
		}
		
		return cateName;
	}

	public List<NoticeArticleVo> selectNoticeArticles(int cate, int start) {
	return dao.selectNoticeArticles(cate, start);
	}
	
	// 페이징 처리
	
	public int selectCountTotalNotice(int cate) {
		return dao.selectCountTotalNotice(cate);
	}
	
	public int getCurrentPageNotice(String pg) {
		
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
		
	}
	
	public int getLastPageNumNotice(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = (total / 10);
		}else {
			lastPageNum = (total / 10) + 1;
		}
		
		return lastPageNum;
	}
	
	public int[] getPageGroupNumNotice(int currentPage, int lastPageNum) {
		
		int pageGroupCurrent = (int)Math.ceil(currentPage / 5.0);
		int pageGroupStart = (pageGroupCurrent -1) * 5 + 1;
		int pageGroupEnd = pageGroupCurrent * 5;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] pageGroup = {pageGroupStart, pageGroupEnd};
		
		return pageGroup;
		
	}
	
	public int getStartNumNotice(int currentPage) {
		
		return (currentPage -1) * 10;
	}	
	
}

