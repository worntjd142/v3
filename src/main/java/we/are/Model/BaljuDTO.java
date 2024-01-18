package we.are.Model;

public class BaljuDTO {

	// 발주일자
	public String baljuday;
	// 사업자번호
	public String bnumber;
	// 상호명
	public String bname;
	// 제품명
	public String bproduct;
	// 발주 수량
	public int bcount;

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
