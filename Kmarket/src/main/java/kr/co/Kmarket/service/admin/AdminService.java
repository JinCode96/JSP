package kr.co.Kmarket.service.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.Kmarket.dao.admin.AdminDao;
import kr.co.Kmarket.vo.AdminCsFaqCate2Vo;
import kr.co.Kmarket.vo.AdminCsFaqVo;
import kr.co.Kmarket.vo.AdminCsQnaCateVo;
import kr.co.Kmarket.vo.NoticeArticleVo;
import kr.co.Kmarket.vo.ProductCartVo;
import kr.co.Kmarket.vo.ProductCate1Vo;
import kr.co.Kmarket.vo.ProductCate2Vo;
import kr.co.Kmarket.vo.ProductVo;
import kr.co.Kmarket.vo.QnaArticleVo;

public enum AdminService {

	INSTANCE;

	private AdminDao dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private AdminService() {
		dao = new AdminDao();
	}

	public List<ProductVo> selectAdminProducts(String uid, int limitStart) {
		return dao.selectAdminProducts(uid, limitStart);
	}

	public List<ProductVo> selectAdminProducts7(int limitStart) {
		return dao.selectAdminProducts7(limitStart);
	}

	public List<ProductVo> selectAdminProductsByKeyword7(String category, String keyword, int limitStart) {
		return dao.selectAdminProductsByKeyword7(category, keyword, limitStart);
	}

	public List<ProductVo> selectAdminProductsByKeyword(String uid, String category, String keyword, int limitStart) {
		return dao.selectAdminProductsByKeyword(uid, category, keyword, limitStart);
	}
	

	// paging

	// 현재 페이지 번호
	public int getCurrentPage(String pg) {
		int currentPage = 1;

		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}

		return currentPage;
	}

	// 전체 게시물 갯수
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	
	// admin-cs-notice용 전체 게시물 갯수
	public int selectCountTotal(int cate) {
		return dao.selectCountTotal(cate);
	}
	
	// admin-cs-qna용 전체 게시물 갯수
	public int selectCountTotalForQna(int cate1) {
		return dao.selectCountTotalForQna(cate1);
	}
	
	public int selectCountTotalForQna(int cate1, int cate2) {
		return dao.selectCountTotalForQna(cate1, cate2);
	}
	
	
	//faq total
		public int selectFaqTotal(int cate1) {
			return dao.selectFaqTotal(cate1);
		}

	// 마지막 페이지 번호
	public int getLastPageNum(int total) {

		int lastPageNum = 0;

		if (total % 10 == 0) {
			lastPageNum = total / 10;
		} else {
			lastPageNum = total / 10 + 1;
		}

		return lastPageNum;
	}

	// 페이지 start, end 번호
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {

		int currentPageGroup = (int) Math.ceil(currentPage / 10.0);

		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;

		int pageGroupEnd = currentPageGroup * 10;

		if (pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}

		int[] result = { pageGroupStart, pageGroupEnd };

		return result;
	}

	// 페이지 시작번호
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		return total - start;
	}

	// 시작 인덱스
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;
	}

	public int insertAdminProduct(ProductVo product) {
		return dao.insertAdminProduct(product);
	}

	public void selectAdminProduct() {
	}

	public void updateAdminProduct() {
	}

	public int deleteAdminProduct(int prodNo) {
		int result = dao.deleteAdminProduct(prodNo);
		return result;
	}

	public MultipartRequest uploadFile(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}

	public String renameFile(UUID thumb1, UUID thumb2, UUID thumb3, String uid, String path) {
		int i = String.valueOf(thumb1).lastIndexOf(".");
		String ext = String.valueOf(thumb1).substring(i);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now + uid + ext; // 20221026160417_chhak0503.txt

		File f1 = new File(path + "/" + thumb1);
		File f2 = new File(path + "/" + thumb2);
		File f3 = new File(path + "/" + thumb3);
		File f4 = new File(path + "/" + newName);

		f1.renameTo(f4);
		f2.renameTo(f4);
		f3.renameTo(f4);

		return newName;
	}

	public ProductVo renameFile(HttpServletRequest req, ProductVo product, String path, MultipartRequest mr) {
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return product;

	}

	public ProductVo insertProductVO(HttpServletRequest req) {
		ProductVo product = new ProductVo();
		double discount = Integer.parseInt(req.getParameter("discount"));
		// int point = (int) (Integer.parseInt(req.getParameter("price")) * (1 -
		// (discount / 100))) / 100;

		// product.setSeller(req.getParameter("uid"));

		product.setSeller(req.getParameter("seller"));
		product.setProdName(req.getParameter("prodName"));
		product.setProdCate1(Integer.parseInt(String.valueOf(req.getParameter("prodCate1"))));
		product.setProdCate2(Integer.parseInt(String.valueOf(req.getParameter("prodCate2"))));
		product.setDescript(req.getParameter("descript"));
		product.setCompany(req.getParameter("company"));
		product.setPrice(Integer.parseInt(String.valueOf(req.getParameter("price"))));
		product.setDiscount(Integer.parseInt(String.valueOf(req.getParameter("discount"))));
		product.setPoint(Integer.parseInt(String.valueOf(req.getParameter("point"))));
		product.setStock(Integer.parseInt(String.valueOf(req.getParameter("stock"))));
		product.setDelivery(Integer.parseInt(String.valueOf(req.getParameter("delivery"))));
		product.setIp(req.getRemoteAddr());

		product.setStatus(req.getParameter("status"));
		product.setDuty(req.getParameter("duty"));
		product.setReceipt(req.getParameter("receipt"));
		product.setBizType(req.getParameter("bizType"));
		product.setOrigin(req.getParameter("origin"));
		return product;
	}

	public ProductVo uploadFile2(HttpServletRequest req, String path, ProductVo product) {
		try {

			// 이미지 파일 불러오기
			Part thumb1 = req.getPart("thumb1");
			Part thumb2 = req.getPart("thumb2");
			Part thumb3 = req.getPart("thumb3");
			Part detail = req.getPart("detail");

			// 이미지 파일 이름 변경
			String thumb1FileName = fileReName(getFileName(thumb1));
			String thumb2FileName = fileReName(getFileName(thumb2));
			String thumb3FileName = fileReName(getFileName(thumb3));
			String detailFileName = fileReName(getFileName(detail));

			// 이미지 파일 출력(저장)
			fileOutPut(thumb1FileName, thumb1, path);
			fileOutPut(thumb2FileName, thumb2, path);
			fileOutPut(thumb3FileName, thumb3, path);
			fileOutPut(detailFileName, detail, path);

			// vo에 저장
			product.setThumb1(thumb1FileName);
			product.setThumb2(thumb2FileName);
			product.setThumb3(thumb3FileName);
			product.setDetail(detailFileName);
			System.out.println("사진1:" + product.getThumb1() + "사진2:" + product.getThumb2() + "사진3:"
					+ product.getThumb3() + "사진4:" + product.getDetail());

		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return product;
	}

	public void fileOutPut(String fileName, Part filePart, String path) {
		try {
			// 파일 이름 및 경로 설정
			File file = new File(path + fileName);
			// 해당 이미지의 내용을 inputStream으로 가져옴
			InputStream is = filePart.getInputStream();
			// 파일 출력 준비
			FileOutputStream fos = null;

			fos = new FileOutputStream(file);

			int temp = -1;
			// inputStream으로 가져온 이미지를 byte 단위로 읽음
			// 더이상 읽을 byte가 없을 경우 -1을 반환
			while ((temp = is.read()) != -1) {
				// 읽은 byte를 출력
				fos.write(temp);
			}

			// 종료
			is.close();
			fos.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

	public String fileReName(String fileName) {
		// 난수 생성
		String now = UUID.randomUUID().toString();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String newFileName = now + ext;

		return newFileName;
	}

	public String getFileName(Part filePart) {
		for (String filePartData : filePart.getHeader("Content-Disposition").split(";")) {
			if (filePartData.trim().startsWith("filename")) {
				return filePartData.substring(filePartData.indexOf("=") + 1).trim().replace("\"", "");
			}
		}

		return null;
	}

	public List<ProductCate1Vo> selectcate1() {
		return dao.selectcate1();
	}

	public List<ProductCate2Vo> selectcate2(String cate1) {
		return dao.selectcate2(cate1);
	}

	public void dirCreate(String targetDir) {
		File Directory = new File(targetDir);
		if (!Directory.exists())
			Directory.mkdirs();
	}

	public ProductVo uploadFile2(HttpServletRequest req, String saveDirectory, ProductVo product, String path) {

		try {

			// 이미지 파일 불러오기
			Part thumb1 = req.getPart("thumb1");
			Part thumb2 = req.getPart("thumb2");
			Part thumb3 = req.getPart("thumb3");
			Part detail = req.getPart("detail");

			// 이미지 파일 이름 변경
			String thumb1FileName = fileReName(getFileName(thumb1));
			String thumb2FileName = fileReName(getFileName(thumb2));
			String thumb3FileName = fileReName(getFileName(thumb3));
			String detailFileName = fileReName(getFileName(detail));

			// 이미지 파일 출력(저장)
			fileOutPut(thumb1FileName, thumb1, path);
			fileOutPut(thumb2FileName, thumb2, path);
			fileOutPut(thumb3FileName, thumb3, path);
			fileOutPut(detailFileName, detail, path);

			// vo에 저장
			product.setThumb1(thumb1FileName);
			product.setThumb2(thumb2FileName);
			product.setThumb3(thumb3FileName);
			product.setDetail(detailFileName);

		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return product;
	}

	public int orderCount() {
		return dao.orderCount();
	}

	public int orderCountY() {

		return dao.orderCountY();
	}

	public int orderCountW() {

		return dao.orderCountY();
	}

	public int orderCountM() {

		return dao.orderCountY();
	}

	public int orderPrice() {
		return dao.orderPrice();
	}

	public int orderPriceY() {

		return dao.orderPriceY();
	}

	public int orderPriceW() {

		return dao.orderPriceW();
	}

	public int orderPriceM() {

		return dao.orderPriceM();
	}

	public int memberCount() {
		return dao.memberCount();
	}

	public int memberCountY() {

		return  dao.memberCountY();
	}

	public int memberCountW() {

		return  dao.memberCountW();
	}

	public int memberCountM() {

		return  dao.memberCountM();
	}

	public int productCount() {
		return dao.productCount();
	}

	public int productY() {
		return dao.productY();
	}

	public int productW() {
		return dao.productW();
	}

	public int productM() {
		return dao.productM();
	}

	public int deleteAdminProductlist(HashMap<Integer, Integer> map) {
		int result = dao.deleteAdminProductlist(map);
		return result;
	}

	public List<AdminCsFaqCate2Vo> selectFaqcate2(String cate1) {
		return dao.selectFaqcate2(cate1);
	}

	public List<AdminCsFaqVo> selectFaq(int start) {
		return dao.selectFaq(start);
	}

	public List<AdminCsFaqVo> selectFaqCate(int cate1, int start) {
		return dao.selectFaqcate(cate1, start);
	}


	// notice
	
	public void insertNotice(NoticeArticleVo vo) {
		dao.insertNotice(vo);
	}
	
	public NoticeArticleVo selectNotice(String no) {
		return dao.selectNotice(no);
	}
	
	public List<NoticeArticleVo> selectNotices(int start){
		return dao.selectNotices(start);
	}
	
	public List<NoticeArticleVo> selectNoticesByCate(int cate, int start){
		return dao.selectNoticesByCate(cate, start);
	}
	
	public int deleteNotice(String no) {
		return dao.deleteNotice(no);
	}
	
	public void updateNoticeHit(String no) {
		dao.updateNoticeHit(no);
	}
	
	public void updateNotice(NoticeArticleVo vo) {
		dao.updateNotice(vo);
	}
	
	public int deleteNotices(String[] checkboxArr) {
		return dao.deleteNotices(checkboxArr);
	}
	
	// qna
	
	public List<QnaArticleVo> selectQnas(int start){
		return dao.selectQnas(start);
	}
	
	public List<QnaArticleVo> selectQnasByCate(int cate1, int start){
		return dao.selectQnasByCate(cate1,start);
	}
	
	public List<QnaArticleVo> selectQnasByCate(int cate1, int cate2, int start){
		return dao.selectQnasByCate(cate1,cate2,start);
	}
	
	public List<AdminCsQnaCateVo> getQnaCate(int cate1) {
		return dao.getQnaCate(cate1);
	}
	
	public int deleteQna(String no) {
		return dao.deleteQna(no);
	}
	
	public int deleteQnas(String[] checkboxArr) {
		return dao.deleteQnas(checkboxArr);
	}
	
	public Map<String, Object> selectQna(String no) {
		return dao.selectQna(no);
	}
	
	public void insertQnaReply(QnaArticleVo vo) {
		dao.insertQnaReply(vo);
	}
	
}