package kr.co.Kmarket.vo;

public class ProductVo {

	private int prodNo;
	private int prodCate1;
	private int prodCate2;
	private String prodName;
	private String descript;
	private String company;
	private String seller;
	private int price;
	private int discount;
	private int point;
	private int stock;
	private int sold;
	private int delivery;
	private int hit;
	private int score;
	private int review;
	private String thumb1;
	private String thumb2;
	private String thumb3;
	private String detail;
	private String status;
	private String duty;
	private String receipt;
	private String bizType;
	private String origin;
	private String ip;
	private String rdate;
	private int disprice;
	private int count;
	private int total;
	private int cartNo;

	public ProductVo() {
	}

	public ProductVo(int prodNo, int prodCate1, int prodCate2, String prodName, String descript, String company,
			String seller, int price, int discount, int point, int stock, int sold, int delivery, int hit, int score,
			int review, String thumb1, String thumb2, String thumb3, String detail, String status, String duty,
			String receipt, String bizType, String origin, String ip, String rdate, int disprice, int count, int total,
			int cartNo) {
		super();
		this.prodNo = prodNo;
		this.prodCate1 = prodCate1;
		this.prodCate2 = prodCate2;
		this.prodName = prodName;
		this.descript = descript;
		this.company = company;
		this.seller = seller;
		this.price = price;
		this.discount = discount;
		this.point = point;
		this.stock = stock;
		this.sold = sold;
		this.delivery = delivery;
		this.hit = hit;
		this.score = score;
		this.review = review;
		this.thumb1 = thumb1;
		this.thumb2 = thumb2;
		this.thumb3 = thumb3;
		this.detail = detail;
		this.status = status;
		this.duty = duty;
		this.receipt = receipt;
		this.bizType = bizType;
		this.origin = origin;
		this.ip = ip;
		this.rdate = rdate;
		this.disprice = disprice;
		this.count = count;
		this.total = total;
		this.cartNo = cartNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = Integer.parseInt(prodNo);
	}

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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

	public String getThumb1() {
		return thumb1;
	}

	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}

	public String getThumb2() {
		return thumb2;
	}

	public void setThumb2(String thumb2) {
		this.thumb2 = thumb2;
	}

	public String getThumb3() {
		return thumb3;
	}

	public void setThumb3(String thumb3) {
		this.thumb3 = thumb3;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

	public String getBizType() {
		return bizType;
	}

	public void setBizType(String bizType) {
		this.bizType = bizType;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getDisprice() {
		return disprice;
	}

	public void setDisprice(int disprice) {
		this.disprice = disprice;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	@Override
	public String toString() {
		return "ProductVo [prodNo=" + prodNo + ", prodCate1=" + prodCate1 + ", prodCate2=" + prodCate2 + ", prodName="
				+ prodName + ", descript=" + descript + ", company=" + company + ", seller=" + seller + ", price="
				+ price + ", discount=" + discount + ", point=" + point + ", stock=" + stock + ", sold=" + sold
				+ ", delivery=" + delivery + ", hit=" + hit + ", score=" + score + ", review=" + review + ", thumb1="
				+ thumb1 + ", thumb2=" + thumb2 + ", thumb3=" + thumb3 + ", detail=" + detail + ", status=" + status
				+ ", duty=" + duty + ", receipt=" + receipt + ", bizType=" + bizType + ", origin=" + origin + ", ip="
				+ ip + ", rdate=" + rdate + ", disprice=" + disprice + ", count=" + count + ", total=" + total
				+ ", cartNo=" + cartNo + "]";
	}

}
