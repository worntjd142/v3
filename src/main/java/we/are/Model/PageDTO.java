package we.are.Model;

public class PageDTO {

	// 페이지 시작번호
	private int startPage;
	// 페이지 끝번호
	private int endPage;
	// 페이지 이전버튼
	private boolean prev;
	// 페이지 다음버튼
	private boolean next;
	// 페이지를 위한 CriteriaDTO 포함
	private CriteriaDTO cd;
	// 수주 테이블의 전체건수를 저장
	private int total;


	// 생성자 (매개변수가 2개인 생성자) 선언
	public PageDTO (CriteriaDTO cd, int total) {
		this.cd = cd;
		this.total = total;
						
		// 끝번호 = 현재페이지 / 10(올림) * 10
						// (int) 정수타입으로 강제변환
						// Math.ceil : 소수값이 존재할때 값을 올리는 역할
		this.endPage = (int)(Math.ceil(cd.getPageNum() / 10.0)) * 10;
		
		// 시작번호 = 끝번호 - 9
		this.startPage = this.endPage - 9;
		
		// 제일 마지막 페이지는 전체 건수를 고려해야 함.
		// 제일 마지막 끝 번호 = 전제 건수 * 1.0 / 한 페이지당 갯수
		int realnd = (int)(Math.ceil((total * 1.0) / cd.getAmount()));
		
		// 만약에 realend가 endPage보다 작으면
		if (realnd < this.endPage) {
			this.endPage = realnd;
			// realend는 endPage다?
		}
		
		// startPage가 1보다 크면 이전버튼 활성화
		this.prev = this.startPage > 1;
		// engPage가 realend보다 작으면 다음버튼 활성화
		this.next = this.endPage < realnd;		
	}
	
	
	// getter + setter
	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public CriteriaDTO getCd() {
		return cd;
	}


	public void setCd(CriteriaDTO cd) {
		this.cd = cd;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", cd=" + cd + ", total=" + total + "]";
	}
	
	

	
}
