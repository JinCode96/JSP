package kr.co.Kmarket.vo;

public class csFaqVo {
	private int faqNo;
	private int cate1;
	private int cate2;
	private String c1Name;
	private String c2Name;
	private String title;
	private String content;
	private String regip;
	private String rdate;
	private String uid;

	public csFaqVo() {
	}

	public csFaqVo(int faqNo, int cate1, int cate2, String c1Name, String c2Name, String title, String content,
			String regip, String rdate, String uid) {
		super();
		this.faqNo = faqNo;
		this.cate1 = cate1;
		this.cate2 = cate2;
		this.c1Name = c1Name;
		this.c2Name = c2Name;
		this.title = title;
		this.content = content;
		this.regip = regip;
		this.rdate = rdate;
		this.uid = uid;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

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

	public String getC1Name() {
		return c1Name;
	}

	public void setC1Name(String c1Name) {
		this.c1Name = c1Name;
	}

	public String getC2Name() {
		return c2Name;
	}

	public void setC2Name(String c2Name) {
		this.c2Name = c2Name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "csFaqVo [faqNo=" + faqNo + ", cate1=" + cate1 + ", cate2=" + cate2 + ", c1Name=" + c1Name + ", c2Name="
				+ c2Name + ", title=" + title + ", content=" + content + ", regip=" + regip + ", rdate=" + rdate
				+ ", uid=" + uid + "]";
	}

}
