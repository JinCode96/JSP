package kr.co.Kmarket.vo;

public class ProductCartVo {

	private int cartNo;
	private String uid;
	private int prodNo;
	private int count;
	private int price;
	private int discount;
	private int point;
	private int delivery;
	private int total;
	private int rdate;
	
	// 추가 필드
	private String prodName;
	private String descript;
	private String addPoint;
	private String thumb1;
	private int prodCate1;
	private int prodCate2;
	
	public int getProdCate1() {
		return prodCate1;
	}
	public void setProdCate1(int prodCate1) {
		this.prodCate1 = prodCate1;
	}
	
	public void setProdCate1(String prodCate1) {
		this.prodCate1 = Integer.parseInt(prodCate1);
	}

	public int getProdCate2() {
		return prodCate2;
	}

	public void setProdCate2(int prodCate2) {
		this.prodCate2 = prodCate2;
	}
	
	public void setProdCate2(String prodCate2) {
		this.prodCate2 = Integer.parseInt(prodCate2);
	}

	public String getThumb1() {
		return thumb1;
	}

	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}

	public ProductCartVo() {
	}

	public ProductCartVo(int cartNo, String uid, int prodNo, int count, int price, int discount, int point,
			int delivery, int total, int rdate, String prodName, String descript, String addPoint, String thumb1, int prodCate1, int prodCate2) {
		super();
		this.cartNo = cartNo;
		this.uid = uid;
		this.prodNo = prodNo;
		this.count = count;
		this.price = price;
		this.discount = discount;
		this.point = point;
		this.delivery = delivery;
		this.total = total;
		this.rdate = rdate;
		// 추가 필드
		this.prodName = prodName;
		this.descript = descript;
		this.addPoint = addPoint;
		this.thumb1 = thumb1;
		this.prodCate1 = prodCate1;
		this.prodCate2 = prodCate2;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getAddPoint() {
		return addPoint;
	}

	public void setAddPoint(String addPoint) {
		this.addPoint = addPoint;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRdate() {
		return rdate;
	}

	public void setRdate(int rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "ProductCartVo [cartNo=" + cartNo + ", uid=" + uid + ", prodNo=" + prodNo + ", count=" + count
				+ ", price=" + price + ", discount=" + discount + ", point=" + point + ", delivery=" + delivery
				+ ", total=" + total + ", rdate=" + rdate + ", prodName=" + prodName + ", descript=" + descript 
				+ ", addPoint=" + addPoint + ", thumb1=" + thumb1 + ", prodCate1=" + prodCate1 + ", prodCate2=" + prodCate2 + "]";
	}

}
