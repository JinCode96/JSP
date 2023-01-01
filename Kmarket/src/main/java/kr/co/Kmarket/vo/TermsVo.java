package kr.co.Kmarket.vo;

public class TermsVo {

	private String terms;
	private String privacy;
	private String location;
	private String finance;
	private String tax;

	public TermsVo() {
	}

	public TermsVo(String terms, String privacy, String location, String finance, String tax) {
		super();
		this.terms = terms;
		this.privacy = privacy;
		this.location = location;
		this.finance = finance;
		this.tax = tax;
	}

	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFinance() {
		return finance;
	}

	public void setFinance(String finance) {
		this.finance = finance;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	@Override
	public String toString() {
		return "TermsVo [terms=" + terms + ", privacy=" + privacy + ", location=" + location + ", finance=" + finance
				+ ", tax=" + tax + "]";
	}

}
