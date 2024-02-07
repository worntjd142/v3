package we.are.Model;

public class CartDTO {

	// Cart 글번호
	private int ono;
	// 제품명
	private String pproduct;
	// 제품단가
	private int pprice;
	// 제품합계
	private int osum;
	// 제품 주문 수량
	private int ocount;
	// 제품 합체
	private String pnamesum;	
	
	
	// getter + setter
	
	public String getPnamesum() {
		return pnamesum;
	}
	public void setPnamesum(String pnamesum) {
		this.pnamesum = pnamesum;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
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
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	
	@Override
	public String toString() {
		return "CartDTO [ono=" + ono + ", pproduct=" + pproduct + ", pprice=" + pprice + ", osum=" + osum + ", ocount="
				+ ocount + ", pnamesum=" + pnamesum + "]";
	}
	
}