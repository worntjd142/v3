package we.are.Model;

public class BaljuDTO {

	// 발주일자
	private String baljuday;
	// 사업자번호
	private String bnumber;
	// 상호명
	private String bname;
	// 제품명
	private String bproduct;
	// 발주 수량
	private int bcount;
	// 합계
	private int bsum;
	
	private int pprice;
	
	private String bno;
	

	
	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public int getBsum() {
		return bsum;
	}

	public void setBsum(int bsum) {
		this.bsum = bsum;
	}

	public String getBaljuday() {
		return baljuday;
	}

	public void setBaljuday(String baljuday) {
		this.baljuday = baljuday;
	}

	public String getBnumber() {
		return bnumber;
	}

	public void setBnumber(String bnumber) {
		this.bnumber = bnumber;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBproduct() {
		return bproduct;
	}

	public void setBproduct(String bproduct) {
		this.bproduct = bproduct;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	@Override
	public String toString() {
		return "BaljuDTO [baljuday=" + baljuday + ", bnumber=" + bnumber + ", bname=" + bname + ", bproduct=" + bproduct
				+ ", bcount=" + bcount + ", getBaljuday()=" + getBaljuday() + ", getBnumber()=" + getBnumber()
				+ ", getBname()=" + getBname() + ", getBproduct()=" + getBproduct() + ", getBcount()=" + getBcount()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
