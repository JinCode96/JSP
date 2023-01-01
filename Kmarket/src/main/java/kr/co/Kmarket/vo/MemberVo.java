package kr.co.Kmarket.vo;

public class MemberVo {
	private String uid;
	private String pass;
	private String name;
	private int gender;
	private String hp;
	private String email;
	private int type;
	private int point;
	private int level;
	private String zip;
	private String addr1;
	private String addr2;
	private String company;
	private String ceo;
	private String bizRegNum;
	private String comRegNum;
	private String tel;
	private String manager;
	private String ManagerHp;
	private String fax;
	private String regip;
	private String wdate;
	private String rdate;

	public MemberVo() {
	}

	public MemberVo(String uid, String pass, String name, int gender, String hp, String email, int type, int point,
			int level, String zip, String addr1, String addr2, String company, String ceo, String bizRegNum,
			String comRegNum, String tel, String manager, String managerHp, String fax, String regip, String wdate,
			String rdate) {
		super();
		this.uid = uid;
		this.pass = pass;
		this.name = name;
		this.gender = gender;
		this.hp = hp;
		this.email = email;
		this.type = type;
		this.point = point;
		this.level = level;
		this.zip = zip;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.company = company;
		this.ceo = ceo;
		this.bizRegNum = bizRegNum;
		this.comRegNum = comRegNum;
		this.tel = tel;
		this.manager = manager;
		ManagerHp = managerHp;
		this.fax = fax;
		this.regip = regip;
		this.wdate = wdate;
		this.rdate = rdate;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getBizRegNum() {
		return bizRegNum;
	}

	public void setBizRegNum(String bizRegNum) {
		this.bizRegNum = bizRegNum;
	}

	public String getComRegNum() {
		return comRegNum;
	}

	public void setComRegNum(String comRegNum) {
		this.comRegNum = comRegNum;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getManagerHp() {
		return ManagerHp;
	}

	public void setManagerHp(String managerHp) {
		ManagerHp = managerHp;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "MemberVo [uid=" + uid + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", hp=" + hp
				+ ", email=" + email + ", type=" + type + ", point=" + point + ", level=" + level + ", zip=" + zip
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", company=" + company + ", ceo=" + ceo + ", bizRegNum="
				+ bizRegNum + ", comRegNum=" + comRegNum + ", tel=" + tel + ", manager=" + manager + ", ManagerHp="
				+ ManagerHp + ", fax=" + fax + ", regip=" + regip + ", wdate=" + wdate + ", rdate=" + rdate + "]";
	}

}
