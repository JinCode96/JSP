package kr.co.Kmarket.db;

public class MemberSql {
	
	public static final String INSERT_MEMBER =  "insert into `km_member` set"
												+ "`uid`=?,"
												+ "`pass`=SHA2(?, 256),"
												+ "`name`=?,"
												+ "`gender`=?,"
												+ "`hp`=?,"
												+ "`email`=?,"
												+ "`zip`=?,"
												+ "`addr1`=?,"
												+ "`addr2`=?,"
												+ "`regip`=?,"
												+ "`type`=1,"
												+ "`rdate`=NOW()";
	
	public static final String INSERT_SELLER =  "insert into `km_member` set"
												+ "`uid`=?,"
												+ "`pass`=SHA2(?, 256),"
												+ "`company`=?,"
												+ "`ceo`=?,"
												+ "`bizRegNum`=?,"
												+ "`comRegNum`=?,"
												+ "`tel`=?,"
												+ "`fax`=?,"
												+ "`email`=?,"
												+ "`zip`=?,"
												+ "`addr1`=?,"
												+ "`addr2`=?,"
												+ "`manager`=?,"
												+ "`managerHp`=?,"
												+ "`regip`=?,"
												+ "`type`=2,"
												+ "`level`=5,"												
												+ "`rdate`=NOW()";
	
	public static final String SELECT_TERMS = "SELECT * FROM `km_member_terms`";

	public static final String SELECT_COUNT_UID = "select count(`uid`) from `km_member` where `uid`=?";
	
	
	
}