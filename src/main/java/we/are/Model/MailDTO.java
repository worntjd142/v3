package we.are.Model;

public class MailDTO {

	private String to; // 받는 사람 이메일
    private String Subject; // 제목
    private String Text; // 내용
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	
	
}
