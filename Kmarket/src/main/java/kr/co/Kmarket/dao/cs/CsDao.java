package kr.co.Kmarket.dao.cs;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import kr.co.Kmarket.db.CsSql;
import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.vo.NoticeArticleVo;
import kr.co.Kmarket.vo.QnaArticleVo;
import kr.co.Kmarket.vo.csFaqVo;

public class CsDao extends DBHelper {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// 진우
	public int insertQnaArticle(QnaArticleVo vo) {
		
		int result = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.INSERT_QNA_ARTICLE);
			stmt = conn.createStatement();
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setInt(4, vo.getCate1());
			psmt.setInt(5, vo.getCate2());
			psmt.setString(6, vo.getRegip());
			
			psmt.executeUpdate();
			
			rs = stmt.executeQuery(CsSql.SELECT_MAX_NO);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	public QnaArticleVo selectArtlcle(String no) {
		
		QnaArticleVo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_ARTITCLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				vo = new QnaArticleVo();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate1(rs.getInt(4));
				vo.setCate2(rs.getInt(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setUid(rs.getString(8));
				vo.setRegip(rs.getString(9));
				vo.setRdate(rs.getString(10));
				vo.setC2Name(rs.getString(11));
			}
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	public NoticeArticleVo selectArticleNotice(int no) {
		NoticeArticleVo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_ARTITCLE_NOTICE);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeArticleVo();
				vo.setNo(rs.getInt("no"));
				vo.setCate(rs.getInt("cate"));
				vo.setCateName(rs.getString("cateName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setUid(rs.getString("uid"));
				vo.setRegip(rs.getString("regip"));
				vo.setRdate(rs.getString("rdate"));
			}
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	public List<csFaqVo> selectFaq(int cate1) {
		
		List<csFaqVo> articles = new ArrayList<>();
		try {
			logger.info("selectFaq...");
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_FAQ);
			psmt.setInt(1, cate1);
			rs = psmt.executeQuery();
			while(rs.next()) {
				csFaqVo vo = new csFaqVo();
				vo.setFaqNo(rs.getInt("faqNo"));
				vo.setCate1(rs.getInt("cate1"));
				vo.setCate2(rs.getInt("cate2"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setUid(rs.getString("Uid"));
				vo.setRegip(rs.getString("regip"));
				vo.setRdate(rs.getString("rdate"));
				vo.setC1Name(rs.getString("c1Name"));
				vo.setC2Name(rs.getString("c2Name"));
				articles.add(vo);
			}
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public List<csFaqVo> selectCateName(int cate1) {
		List<csFaqVo> cateName = new ArrayList<>();
		try {
			logger.info("selectCateName...");
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_CATE_NAME);
			psmt.setInt(1, cate1);
			rs = psmt.executeQuery();
			while(rs.next()) {
				csFaqVo vo = new csFaqVo();
				vo.setCate1(rs.getInt("cate1"));
				vo.setC1Name(rs.getString("c1Name"));
				vo.setCate2(rs.getInt("cate2"));
				vo.setC2Name(rs.getString("c2Name"));
				cateName.add(vo);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cateName;
	}
	
	public csFaqVo selectFaqArticle(int faqNo) {
		csFaqVo vo = null;
		try {
			logger.info("selectFaqArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_FAQ_ARTICLE);
			psmt.setInt(1, faqNo);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new csFaqVo();
				vo.setFaqNo(rs.getInt("faqNo"));
				vo.setCate1(rs.getInt("cate1"));
				vo.setCate2(rs.getInt("cate2"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setUid(rs.getString("uid"));
				vo.setRegip(rs.getString("regip"));
				vo.setRdate(rs.getString("rdate"));
			}
			close();
					
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	// 해빈
	
	public List<QnaArticleVo> selectArticles(int cate1, int start) {
		
		List<QnaArticleVo> articles = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_ARTICLES);
			psmt.setInt(1, cate1);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				QnaArticleVo article = new QnaArticleVo();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate1(rs.getInt(4));
				article.setCate2(rs.getInt(5));
				article.setTitle(rs.getString(6));
				article.setContent(rs.getString(7));
				article.setUid(rs.getString(8));
				article.setRegip(rs.getString(9));
				article.setRdate(rs.getString(10));
				article.setC2Name(rs.getString(11));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public int selectCountTotal(int cate1) {
		int total = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_COUNT_TOTAL);
			psmt.setInt(1, cate1);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	
	public List<NoticeArticleVo> selectLatestNotices(){
		
		List<NoticeArticleVo> notices = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(CsSql.SELECT_LATEST_NOTICES);
			
			while(rs.next()) {
				NoticeArticleVo notice = new NoticeArticleVo();
				
				notice.setTitle(rs.getString("title"));
				notice.setRdate(rs.getString("rdate"));
				notice.setCate(rs.getInt("cate"));
				notice.setNo(rs.getInt("no"));
				
				notices.add(notice);		
			}
			
			close();
			
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return notices;
	}
	
	public List<QnaArticleVo> selectLatestQnas(){
		
		List<QnaArticleVo> qnas = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(CsSql.SELECT_LATEST_QNAS);
			
			while(rs.next()) {
				
				QnaArticleVo qna = new QnaArticleVo();
				
				qna.setTitle(rs.getString("title"));
				qna.setRdate(rs.getString("rdate"));
				qna.setC1Name(rs.getString("c1Name"));
				qna.setUid(rs.getString("uid"));
				qna.setNo(rs.getInt("no"));
				qna.setCate1(rs.getString("cate1"));
				
				qnas.add(qna);		
			}
			
			close();

		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return qnas;
	}

	//현길
	public List<csFaqVo> selectFaq1(int cate1, int cate2) {
	List<csFaqVo> csFaq1 = new ArrayList<>();
	int start = 5;
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_CS_FAQ1);
			psmt.setInt(1, cate1);
			psmt.setInt(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				csFaqVo article = new csFaqVo();
				article.setFaqNo(rs.getInt(1));
				article.setCate1(rs.getInt(2));
				article.setCate2(rs.getInt(3));
				//article.setC1Name(rs.getString(4));
				//article.setC2Name(rs.getString(5));
				article.setTitle(rs.getString(4));
				article.setContent(rs.getString(5));
				article.setRegip(rs.getString(6));
				article.setRdate(rs.getString(7));
				article.setUid(rs.getString(8));
				//System.out.println("cs다오:"+article);
				csFaq1.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return csFaq1;
	}

	public List<csFaqVo> selectFaq2(int cate1, int cate2) {
		List<csFaqVo> csFaq2 = new ArrayList<>();
		int start = 5;
		int end = 5;
			
			try {
				
				conn = getConnection();
				psmt = conn.prepareStatement(CsSql.SELECT_CS_FAQ2);
				psmt.setInt(1, cate1);
				psmt.setInt(2, cate2);
				psmt.setInt(3, start);
				psmt.setInt(4, end);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					csFaqVo article = new csFaqVo();
					article.setFaqNo(rs.getInt(1));
					article.setCate1(rs.getInt(2));
					article.setCate2(rs.getInt(3));
					//article.setC1Name(rs.getString(4));
					//article.setC2Name(rs.getString(5));
					article.setTitle(rs.getString(4));
					article.setContent(rs.getString(5));
					article.setRegip(rs.getString(6));
					article.setRdate(rs.getString(7));
					article.setUid(rs.getString(8));
					//System.out.println("cs다오:"+article);
					csFaq2.add(article);
				}
				
				close();
				
			}catch(Exception e) {
				logger.error(e.getMessage());
			}
			
			return csFaq2;
		}
	
	// 진우
	public List<NoticeArticleVo> selectNoticeArticles(int cate, int start) {
		
		List<NoticeArticleVo> articles = new ArrayList<>();
		try {
			logger.info("selectNoticeArticles");
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_NOTICE_ARTICLES);
			psmt.setInt(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			NoticeArticleVo vo = new NoticeArticleVo();
			vo.setNo(rs.getInt("no"));
			vo.setCate(rs.getInt("cate"));
			vo.setCateName(rs.getString("cateName"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setUid(rs.getString("uid"));
			vo.setRegip(rs.getString("regip"));
			vo.setRdate(rs.getString("rdate"));
			
			articles.add(vo);
			}
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public int selectCountTotalNotice(int cate) {
		int total = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(CsSql.SELECT_COUNT_TOTAL_NOTICE);
			psmt.setInt(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	
}
