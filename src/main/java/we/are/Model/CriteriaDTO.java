package we.are.Model;

// 페이지번호(pageNum)와 한 페이지당 게시물 갯수(amount) 값을 전달하는 Model
public class CriteriaDTO {

	// 페이지번호
	private int pageNum;
	// 한 페이지당 게시물 갯수
	private int amount;

	//검색
	private String orderno;
	private String search;
	private String startday;
	private String endday;	




	// pageNum = 1 , amount = 10;
	public CriteriaDTO() {
		this (1, 10);
	}	
	
	// 생성자
	public CriteriaDTO (int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	

	// getter + setter
	
	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}	

	

	@Override
	public String toString() {
		return "CriteriaDTO [pageNum=" + pageNum + ", amount=" + amount + ", orderno=" + orderno + ", search=" + search
				+ ", startday=" + startday + ", endday=" + endday + ", getOrderno()=" + getOrderno() + ", getPageNum()="
				+ getPageNum() + ", getAmount()=" + getAmount() + ", getStartday()=" + getStartday() + ", getEndday()="
				+ getEndday() + ", getSearch()=" + getSearch() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
