package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.SujuMapper;
@Service
public class SujuServiceImpl implements SujuService {

	@Autowired
	SujuMapper sm;
	
	
	public ArrayList<String> suju_select() {
			return sm.suju_select();
	}
}
