package we.are.Mapper;

import we.are.Model.LoginDTO;

public interface LoginMapper {

	// 회원가입
	public void login_insert(LoginDTO logindto);
	
	// 로그인
	public LoginDTO login(LoginDTO ld);
}
