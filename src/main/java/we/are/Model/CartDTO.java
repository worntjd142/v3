package we.are.Model;

public class CartDTO {

	// Cart 글번호
	private int ono;
	// 제품명
	private String pproduct;
	// 제품단가
	private String pprice;
	// 제품합계
	private String osum;
	// 제품 주문 수량
	private int ocount;
	//제품 요청잔량 
	private int amount;
	//제고 출고수량
	private int scount;
	
	
	
	
	// getter + setter	
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	public String getPproduct() {
		return pproduct;
	}
	public void setPproduct(String pproduct) {
		this.pproduct = pproduct;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	
	public String getOsum() {
		return osum;
	}
	public void setOsum(String osum) {
		this.osum = osum;
	}
	@Override
	public String toString() {
		return "CartDTO [ono=" + ono + ", pproduct=" + pproduct + ", pprice=" + pprice + ", osum=" + osum + ", ocount="
				+ ocount + ", amount=" + amount + ", scount=" + scount + ", getAmount()=" + getAmount()
				+ ", getScount()=" + getScount() + ", getPproduct()=" + getPproduct() + ", getPprice()=" + getPprice()
				+ ", getOcount()=" + getOcount() + ", getOno()=" + getOno() + ", getOsum()=" + getOsum()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
