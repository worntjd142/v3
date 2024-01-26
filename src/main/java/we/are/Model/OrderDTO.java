package we.are.Model;

public class OrderDTO {

	// 글번호
	private int ono;
	// 수주번호
	private String uuid;
	// 수주일자
	private String oday;
	// 수주수량
	private int ocount;
	// 요청수량
	private int recount;
	// 수주잔량
	private int iocount;
	// 수주상태
	private String osuju;
	// 요청사항
	private String otext;
	
	// 거래처명
	private String cname;
	// 제품명
	private String pproduct;
	// 제품단가
	private int pprice;
	// 합계
	private int osum;
	// 수주담당자
	private String omanager;
	
	

	// getter + setter
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getOday() {
		return oday;
	}
	public void setOday(String oday) {
		this.oday = oday;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public int getRecount() {
		return recount;
	}
	public void setRecount(int recount) {
		this.recount = recount;
	}
	public int getIocount() {
		return iocount;
	}
	public void setIocount(int iocount) {
		this.iocount = iocount;
	}
	public String getOsuju() {
		return osuju;
	}
	public void setOsuju(String osuju) {
		this.osuju = osuju;
	}
	public String getOtext() {
		return otext;
	}
	public void setOtext(String otext) {
		this.otext = otext;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPproduct() {
		return pproduct;
	}
	public void setPproduct(String pproduct) {
		this.pproduct = pproduct;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getOsum() {
		return osum;
	}
	public void setOsum(int osum) {
		this.osum = osum;
	}
	public String getOmanager() {
		return omanager;
	}
	public void setOmanager(String omanager) {
		this.omanager = omanager;
	}	

	@Override
	public String toString() {
		return "OrderDTO [ono=" + ono + ", uuid=" + uuid + ", oday=" + oday + ", ocount=" + ocount + ", recount="
				+ recount + ", iocount=" + iocount + ", osuju=" + osuju + ", otext=" + otext + ", cname=" + cname
				+ ", pproduct=" + pproduct + ", pprice=" + pprice + ", osum=" + osum + ", omanager=" + omanager + "]";
	}

	
}
