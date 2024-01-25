package we.are.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.TempleMapper;

@Service
public class TempleServiceImpl implements TempleService{

	@Autowired
	TempleMapper tm;
	
//	public TempleDTO p_temp() {
//		return tm.p_temp();
//	}

	@Override
	public String w_temple() {
		return tm.w_temple();
	}

}
