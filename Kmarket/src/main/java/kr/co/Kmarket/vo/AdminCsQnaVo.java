package kr.co.Kmarket.vo;

import java.util.List;

public class AdminCsQnaVo {
	
	private int cate1;
	private int cate2;
	private int pg;
	private int currentPage;
	private int lastPageNum;
	private int pageGroupStart;
	private int pageGroupEnd;
	private int total;
	private int pageStartNum;
	private List<QnaArticleVo> qnas;
	private List<AdminCsQnaCateVo> cates;
	
	
	public int getCate1() {
		return cate1;
	}
	public void setCate1(int cate1) {
		this.cate1 = cate1;
	}
	public int getCate2() {
		return cate2;
	}
	public void setCate2(int cate2) {
		this.cate2 = cate2;
	}
	public int getPg() {
		return pg;
	}
	public void setPg(int pg) {
		this.pg = pg;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getLastPageNum() {
		return lastPageNum;
	}
	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}
	public int getPageGroupStart() {
		return pageGroupStart;
	}
	public void setPageGroupStart(int pageGroupStart) {
		this.pageGroupStart = pageGroupStart;
	}
	public int getPageGroupEnd() {
		return pageGroupEnd;
	}
	public void setPageGroupEnd(int pageGroupEnd) {
		this.pageGroupEnd = pageGroupEnd;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public List<QnaArticleVo> getQnas() {
		return qnas;
	}
	public void setQnas(List<QnaArticleVo> qnas) {
		this.qnas = qnas;
	}
	public List<AdminCsQnaCateVo> getCates() {
		return cates;
	}
	public void setCates(List<AdminCsQnaCateVo> cates) {
		this.cates = cates;
	}
	
}
