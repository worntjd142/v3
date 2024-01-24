package we.are.Model;

public class OrderDTO {

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
	// 단가
	private int pprice;
	// 주문 번호
	private String uuid;
	//결제 상태
	private String spayment;
 	//배달 상태
	private String sdelivery;
	//수주서 상태
	private String sujubox;
	//상품 코드
	private String pcode;
	//수주 일
	private String sujuday;
	//차트 번호
	private int bno;
	
	//검색
//	private String startday;
//	private String endday;
//	private String companyname;
	
	
	
//	public String getStartday() {
//		return startday;
//	}
//
//	public void setStartday(String startday) {
//		this.startday = startday;
//	}
//
//	public String getEndday() {
//		return endday;
//	}
//
//	public void setEndday(String endday) {
//		this.endday = endday;
//	}
//
//	public String getCompanyname() {
//		return companyname;
//	}
//
//	public void setCompanyname(String companyname) {
//		this.companyname = companyname;
//	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSujuday() {
		return sujuday;
	}

	public void setSujuday(String sujuday) {
		this.sujuday = sujuday;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getSpayment() {
		return spayment;
	}

	public void setSpayment(String spayment) {
		this.spayment = spayment;
	}

	public String getSdelivery() {
		return sdelivery;
	}

	public void setSdelivery(String sdelivery) {
		this.sdelivery = sdelivery;
	}

	public String getSujubox() {
		return sujubox;
	}

	public void setSujubox(String sujubox) {
		this.sujubox = sujubox;
	}

//	// join을 위한 dto 결합용 sujudto 선언
//	private SujuDTO SujuDTO;
//
//
//	public SujuDTO getSujuDTO() {
//		return SujuDTO;
//	}
//
//	public void setSujuDTO(SujuDTO sujuDTO) {
//		SujuDTO = sujuDTO;
//	}



	public int getPprice() {
		return pprice;
	}

	public int getBno() {
		return bno;
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
		return "OrderDTO [baljuday=" + baljuday + ", bnumber=" + bnumber + ", bname=" + bname + ", bproduct=" + bproduct
				+ ", bcount=" + bcount + ", bsum=" + bsum + ", pprice=" + pprice + ", uuid=" + uuid + ", spayment="
				+ spayment + ", sdelivery=" + sdelivery + ", sujubox=" + sujubox + ", pcode=" + pcode + ", sujuday="
				+ sujuday + ", bno=" + bno + "]";
	}

	
	
	

}
