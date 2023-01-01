package kr.co.jboard1.db;

public class Sql {

	public static final String SELECT_TERMS = "select * from `board_terms`";
	public static final String SELECT_USER = "select * from `board_user` where `uid`=? and `pass` = SHA2(?,256)";
	public static final String INSERT_USER = "insert into `board_user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW()";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent` = 0 "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_COUNT_TOTAL = "select count(`no`) from `board_article` where `parent`=0";
	
	public static final String SELECT_ARTICLE = "select";
}