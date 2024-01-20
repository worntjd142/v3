package we.are.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.JoinMapper;
import we.are.Model.JoinDTO;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinMapper joinm;
	
	// 회원가입
	public void join_insert (JoinDTO joindto) {
		joinm.join_insert(joindto);
	}
	
}
