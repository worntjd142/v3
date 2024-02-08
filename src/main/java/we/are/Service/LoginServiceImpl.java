package we.are.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.LoginMapper;
import we.are.Model.LoginDTO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper lm;
	
	// 회원가입
	public void login_insert (LoginDTO logindto) {
		lm.login_insert(logindto);
	}
		

	// 로그인
	public LoginDTO login(LoginDTO ld) {
		return lm.login(ld);
		
	}
	
	
}
