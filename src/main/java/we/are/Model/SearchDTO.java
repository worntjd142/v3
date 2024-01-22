package we.are.Model;

public class SearchDTO {

	private String startday;
	private String endday;
	private String companyname;
	
	
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
		return "SearchDTO [startday=" + startday + ", endday=" + endday + ", companyname=" + companyname + "]";
	}
	
}
