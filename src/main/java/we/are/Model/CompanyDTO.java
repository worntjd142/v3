package we.are.Model;

public class CompanyDTO {

		private String cname; // 거래처
		private String cnumber; // 사업자 번호
		private String caddress; // 주소
		private String ctel; // 전화번호
		private String cdoc; // 원장
		
		
		
		public String getCdoc() {
			return cdoc;
		}
		public void setCdoc(String cdoc) {
			this.cdoc = cdoc;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public String getCnumber() {
			return cnumber;
		}
		public void setCnumber(String cnumber) {
			this.cnumber = cnumber;
		}
		public String getCaddress() {
			return caddress;
		}
		public void setCaddress(String caddress) {
			this.caddress = caddress;
		}
		public String getCtel() {
			return ctel;
		}
		public void setCtel(String ctel) {
			this.ctel = ctel;
		}
}
