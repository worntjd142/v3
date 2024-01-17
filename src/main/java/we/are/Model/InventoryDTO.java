package we.are.Model;

public class InventoryDTO {
	private int pcode;
	
	private String pname;
	
	private int pprice;
	
	private int pstock;

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public void setPcode(int pcode) {
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
	
	public int getPcode() {
		return pcode;
	}

	public int getPstock() {
		return pstock;
	}
	
}
