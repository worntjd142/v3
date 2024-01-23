package we.are.Mapper;

import we.are.Model.JoinDTO;

public interface JoinMapper {

	// 회원가입
	public void join_insert(JoinDTO joindto);
	
	// 로그인
	public JoinDTO login(JoinDTO joindto);
}
