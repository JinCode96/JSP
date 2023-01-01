package kr.co.Kmarket.vo;

public class AdminCsFaqCate1Vo {

	private int cate1;
	private String c1Name;

	public AdminCsFaqCate1Vo() {
	}

	public AdminCsFaqCate1Vo(int cate1, String c1Name) {
		super();
		this.cate1 = cate1;
		this.c1Name = c1Name;
	}

	public int getCate1() {
		return cate1;
	}

	public void setCate1(int cate1) {
		this.cate1 = cate1;
	}

	public String getC1Name() {
		return c1Name;
	}

	public void setC1Name(String c1Name) {
		this.c1Name = c1Name;
	}

	@Override
	public String toString() {
		return "AdminCsFaqCate1Vo [cate1=" + cate1 + ", c1Name=" + c1Name + "]";
	}

}
