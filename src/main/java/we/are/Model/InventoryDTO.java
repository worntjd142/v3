package we.are.Model;

public class InventoryDTO {
	// 제품코드
	private String pcode;
	
	// 제품이름	
	private String pname;
	
	// 입고날짜
	private String housed;
	
	// 유통기한
	private String exd;
	
	// 최종입고날짜	
	private String houseld;
	
	// 제품가격
	private int pprice;
	
	// 제조사
	private String pmc;
	
	// 재고수
	private int pstock;
	
	// 제품설명
	private String pmi;
	
	// 제품이미지
	private String pimage;
	
	// 추가수량
	private int plus5;
	

	public int getPlus5() {
		return plus5;
	}

	public void setPlus5(int plus5) {
		this.plus5 = plus5;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPmc() {
		return pmc;
	}

	public void setPmc(String pmc) {
		this.pmc = pmc;
	}
	
	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	
	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public String getPmi() {
		return pmi;
	}

	public void setPmi(String pmi) {
		this.pmi = pmi;
	}

	public String getHoused() {
		return housed;
	}

	public void setHoused(String housed) {
		this.housed = housed;
	}

	public String getExd() {
		return exd;
	}

	public void setExd(String exd) {
		this.exd = exd;
	}

	public String getHouseld() {
		return houseld;
	}

	public void setHouseld(String houseld) {
		this.houseld = houseld;
	}
	
}
