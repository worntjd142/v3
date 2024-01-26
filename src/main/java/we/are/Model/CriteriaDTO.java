package we.are.Model;

// 페이지번호(pageNum)와 한 페이지당 게시물 갯수(amount) 값을 전달하는 Model
public class CriteriaDTO {

	// 페이지번호
	private int pageNum;
	// 한 페이지당 게시물 갯수
	private int amount;
	
	//검색
	private String startday;
	private String endday;
	private String companyname;
	
	

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

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [pageNum=" + pageNum + ", amount=" + amount + ", startday=" + startday + ", endday="
				+ endday + ", companyname=" + companyname + "]";
	}
	
	

}
