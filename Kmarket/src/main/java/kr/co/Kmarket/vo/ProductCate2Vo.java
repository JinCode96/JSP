package kr.co.Kmarket.vo;

public class ProductCate2Vo {

	private int cate1;
	private int cate2;
	private String c2Name;

	public ProductCate2Vo() {
	}

	public ProductCate2Vo(int cate1, int cate2, String c2Name) {
		super();
		this.cate1 = cate1;
		this.cate2 = cate2;
		this.c2Name = c2Name;
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

	public String getC2Name() {
		return c2Name;
	}

	public void setC2Name(String c2Name) {
		this.c2Name = c2Name;
	}

	@Override
	public String toString() {
		return "ProductCate2 [cate1=" + cate1 + ", cate2=" + cate2 + ", c2Name=" + c2Name + "]";
	}

}
