package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.StoreMapper;
import we.are.Model.OrderDTO;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreMapper sm;
	
	//출고 목록 가져오기
	public ArrayList<OrderDTO> store_select() {
		return sm.store_select();
	}
	
}
