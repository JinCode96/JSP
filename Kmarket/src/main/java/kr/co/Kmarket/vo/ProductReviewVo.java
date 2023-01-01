package kr.co.Kmarket.vo;

public class ProductReviewVo {

	private int revNo;
	private int prodNo;
	private String content;
	private String uid;
	private int rating;
	private int regip;
	private int rdate;

	public ProductReviewVo() {
	}

	public ProductReviewVo(int revNo, int prodNo, String content, String uid, int rating, int regip, int rdate) {
		super();
		this.revNo = revNo;
		this.prodNo = prodNo;
		this.content = content;
		this.uid = uid;
		this.rating = rating;
		this.regip = regip;
		this.rdate = rdate;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getRegip() {
		return regip;
	}

	public void setRegip(int regip) {
		this.regip = regip;
	}

	public int getRdate() {
		return rdate;
	}

	public void setRdate(int rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "ProductReviewVo [revNo=" + revNo + ", prodNo=" + prodNo + ", content=" + content + ", uid=" + uid
				+ ", rating=" + rating + ", regip=" + regip + ", rdate=" + rdate + "]";
	}

}
