package kr.co.Kmarket.db;

public class ProductSql {

	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`prodNo`) FROM `km_product` WHERE `prodCate1`=? AND `prodCate2`=?";
	
	public static final String SELECT_PRODUCT = "SELECT *, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
												+ "FROM `km_product` WHERE `prodNo` = ?";
	
	
	public static final String SELECT_PRODUCTS_SOLD = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `sold` DESC LIMIT ?, 10 ";
	
	public static final String SELECT_PRODUCTS_LOWPRICE = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `price` ASC LIMIT ?, 10 ";
	
	public static final String SELECT_PRODUCTS_HIGHPRICE = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `price` DESC LIMIT ?, 10 ";
	
	public static final String SELECT_PRODUCTS_SCORE = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `score` DESC LIMIT ?, 10 ";
	
	public static final String SELECT_PRODUCTS_REVIEW = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `review` DESC LIMIT ?, 10 ";
	
	public static final String SELECT_PRODUCTS_RDATE = "SELECT a.*, FLOOR(`price` * (1 - `discount` / 100)) AS `disPrice` "
														+ "FROM `km_product` AS a WHERE `prodCate1`=? AND `prodCate2`=? "
														+ "ORDER BY `rdate` DESC LIMIT ?, 10 ";
	
	public static final String SELECT_CATE_NAME = "SELECT a.c1Name, b.c2Name FROM `km_product_cate1` AS a " 
											  	+"JOIN `km_product_cate2` AS b "
											  	+"ON a.cate1 = b.cate1 WHERE b.cate1=? AND b.cate2=?";
	
	public static final String UPDATE_PRODUCT_HIT = "UPDATE `km_product` SET `hit` = `hit`+1 WHERE `prodNo`=?";	
	
	
	public static final String INSERT_CART = "INSERT INTO `km_product_cart` (`uid`, `prodNo`, `count`, `price`, `discount`, `point`, `delivery`, `total`, `rdate`) "
											+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW()) ";
	
	
	public static final String SELECT_ORDER = "SELECT *, FLOOR(`price` * (`discount` / 100)) AS `disprice` FROM `km_product` WHERE `prodNo`= ?";
	
	//-----------현길
	

	public static final String SELECT_CART_PRODUCTS =" SELECT * FROM km_product_cart LEFT JOIN km_product ON km_product_cart.prodNo "
													+ " = km_product.prodNo WHERE `uid` =? ";

	public static final String SELECT_CARTS =" SELECT * FROM km_product_cart LEFT JOIN km_product ON km_product_cart.prodNo "
											+ " = km_product.prodNo WHERE `cartNo` =? ";


	//-----------진우
	public static final String INSERT_PRODUCT_ORDER = "insert into `km_product_order` set "
													+ "`ordUid` = ?, "
													+ "`ordCount` = ?, "
													+ "`ordPrice` = ?, "
													+ "`ordDiscount` = ?, "
													+ "`ordDelivery` = ?, "
													+ "`savePoint` = ?, "
													+ "`usedPoint` = ?, "
													+ "`ordTotPrice` = ?, "
													+ "`recipName` = ?, "
													+ "`recipHp` = ?, "
													+ "`recipZip` = ?, "
													+ "`recipAddr1` = ?, "
													+ "`recipAddr2` = ?, "
													+ "`ordPayment` = ?, "
													+ "`ordComplete` = 1, "
													+ "`ordDate` = NOW()";
	
	public static final String SELECT_ORD_NO = "select max(`ordNo`) from `km_product_order`";
	
	public static final String SELECT_COMPLETE = "select `ordTotPrice` from `km_product_order` where `ordNo` = ?";
													
}
