package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.BookVO;

public class BookDAO extends DBHelper {

	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	private BookDAO() {}
	
	public void insertbook(BookVO vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `book` values (?,?,?,?)");
			
			psmt.setInt(1, vo.getBookId());
			psmt.setString(2, vo.getBookName());
			psmt.setString(3, vo.getPublisher());
			psmt.setInt(4, vo.getPrice());
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public BookVO selectbook(String bookId) {
		
		BookVO vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				vo = new BookVO();
				vo.setBookId(rs.getInt(1));
				vo.setBookName(rs.getString(2));
				vo.setPublisher(rs.getString(3));
				vo.setPrice(rs.getInt(4));
			}
			close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<BookVO> selectbooks() {
		
		List<BookVO> books = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `Book`");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setBookId(rs.getInt(1));
				vo.setBookName(rs.getString(2));
				vo.setPublisher(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				
				// vo를 books에 집어넣는다.
				books.add(vo);
						
			}
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
		
	}
	
	public void updatebook() {}
	public void deletebook() {}
	
}

