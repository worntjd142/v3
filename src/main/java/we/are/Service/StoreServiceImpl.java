package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.StoreMapper;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	StoreMapper sm;
	
	//'수주확인'된 거래처 리스트
	public ArrayList<HashMap<String, Object>> store_select() {
		return sm.store_select();
	}
	//재고량 확인
	public InventoryDTO product_select(String pcode) {
		return sm.product_select(pcode);
	}
	
	//출고일 등록
	public int balju_update(OrderDTO od) {
		return sm.balju_update(od);
	}
	
	//출고일 등록
		public String balju_check(int ono) {
		return sm.balju_check(ono);
		}
}
		
