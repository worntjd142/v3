package we.are.Model;

public class LoginDTO {

	private String useid; //사용자 아이디
	private String usepassword; //사용자 비밀번호
	private String usename; //사용자 회사명
	private String usenumber; //사용자 사업자번호
	private String usetel; //사용자 회사 연락처
	
	
	// getter + setter	
	public String getUseid() {
		return useid;
	}
	public void setUseid(String useid) {
		this.useid = useid;
	}
	public String getUsepassword() {
		return usepassword;
	}
	public void setUsepassword(String usepassword) {
		this.usepassword = usepassword;
	}
	public String getUsename() {
		return usename;
	}
	public void setUsename(String usename) {
		this.usename = usename;
	}
	public String getUsenumber() {
		return usenumber;
	}
	public void setUsenumber(String usenumber) {
		this.usenumber = usenumber;
	}
	public String getUsetel() {
		return usetel;
	}
	public void setUsetel(String usetel) {
		this.usetel = usetel;
	}
	
	
	@Override
	public String toString() {
		return "LoginDTO [useid=" + useid + ", usepassword=" + usepassword + ", usename=" + usename + ", usenumber="
				+ usenumber + ", usetel=" + usetel + "]";
	}	
	
}
