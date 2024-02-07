package we.are.Model;

import java.util.Arrays;

public class OrderDTO {

	// 글번호
	private int ono;
	// 수주번호
	private String uuid;
	// 수주일자
	private String oday;
	// 수주수량
	private int ocount[];
	// 수주상태
	private String osuju;
	// 요청사항
	private String otext;
	// 거래처명
	private String cname;
	// 제품명
	private String pproduct[];
	// 제품단가
	private int pprice[];
	// 합계
	private int osum;
	// 수주담당자
	private String omanager;
	// 출고 수량
	private int scount;  
	// 출고 날짜
	private String sdate;
	// 배달 상황
	private String sdel; 
	// 구분자
	private int amount;
	// 품목 수
	private int pcount;
	// 수주하는 거래처 사업자번호
	private String cno;
	// 수주제품
	private String odetail;
	// 수주하는 거래처 대표자 이름
	private String ceo;
	
	// getter + setter
	
	public void setOcount(int[] ocount) {
		this.ocount = ocount;
	}
	public void setPproduct(String[] pproduct) {
		this.pproduct = pproduct;
	}
	public void setPprice(int[] pprice) {
		this.pprice = pprice;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getOdetail() {
		return odetail;
	}
	public void setOdetail(String odetail) {
		this.odetail = odetail;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAamount(int amount) {
		this.amount = amount;
	}
	public String getSdel() {
		return sdel;
	}
	public void setSdel(String sdel) {
		this.sdel = sdel;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
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
		return "OrderDTO [ono=" + ono + ", uuid=" + uuid + ", oday=" + oday + ", ocount=" + Arrays.toString(ocount)
				+ ", osuju=" + osuju + ", otext=" + otext + ", cname=" + cname + ", pproduct="
				+ Arrays.toString(pproduct) + ", pprice=" + Arrays.toString(pprice) + ", osum=" + osum + ", omanager="
				+ omanager + ", scount=" + scount + ", sdate=" + sdate + ", sdel=" + sdel + ", amount=" + amount
				+ ", pcount=" + pcount + ", cno=" + cno + ", odetail=" + odetail + ", ceo=" + ceo + ", getCeo()="
				+ getCeo() + ", getOdetail()=" + getOdetail() + ", getCno()=" + getCno() + ", getPcount()="
				+ getPcount() + ", getAmount()=" + getAmount() + ", getSdel()=" + getSdel() + ", getScount()="
				+ getScount() + ", getSdate()=" + getSdate() + ", getOno()=" + getOno() + ", getUuid()=" + getUuid()
				+ ", getOday()=" + getOday() + ", getOsuju()=" + getOsuju() + ", getOtext()=" + getOtext()
				+ ", getCname()=" + getCname() + ", getOsum()=" + getOsum() + ", getOmanager()=" + getOmanager()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
