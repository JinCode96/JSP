package kr.co.Kmarket.vo;

public class ProductOrderItemVo {

	private int ordNo;
	private int prodNo;
	private int count;
	private int price;
	private int discount;
	private int point;
	private int delivery;
	private int total;

	public ProductOrderItemVo() {
	}

	public ProductOrderItemVo(int ordNo, int prodNo, int count, int price, int discount, int point, int delivery,
			int total) {
		super();
		this.ordNo = ordNo;
		this.prodNo = prodNo;
		this.count = count;
		this.price = price;
		this.discount = discount;
		this.point = point;
		this.delivery = delivery;
		this.total = total;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
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

	@Override
	public String toString() {
		return "ProductOrderItemVo [ordNo=" + ordNo + ", prodNo=" + prodNo + ", count=" + count + ", price=" + price
				+ ", discount=" + discount + ", point=" + point + ", delivery=" + delivery + ", total=" + total + "]";
	}

}
