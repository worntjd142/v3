package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreMapper sm;
	
	//출고 목록 가져오기
	public ArrayList<HashMap<String, Object>> store_select() {
		return sm.store_select();
	}
	
}
