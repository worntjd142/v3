package we.are.Service;

import we.are.Model.LoginDTO;

public interface LoginService {

	// 회원가입
	public void login_insert(LoginDTO logindto);
	
	// 로그인
	public LoginDTO login(LoginDTO logindto);
}
