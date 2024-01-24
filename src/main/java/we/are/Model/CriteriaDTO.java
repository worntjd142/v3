package we.are.Model;

// 페이지번호(pageNum)와 한 페이지당 게시물 갯수(amount) 값을 전달하는 Model
public class CriteriaDTO {

	// 페이지번호
	private int pageNum;
	// 한 페이지당 게시물 갯수
	private int amount;
	
	
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

	@Override
	public String toString() {
		return "CriteriaDTO [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	
	

}
