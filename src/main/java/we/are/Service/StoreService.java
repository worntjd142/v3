package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface StoreService {

	//'수주확인'된 거래처 리스트
	public ArrayList<HashMap<String, Object>> store_select();
	
	public ArrayList<HashMap<String, Object>> storerelease_select();
	//
	public ArrayList<HashMap<String, Object>> management_select();
	
	//재고량 확인
	public InventoryDTO product_select(String pcode);
	
	//출고일 등록
	public int balju_update(OrderDTO od);
	
	//수주상태 변경 - > '견적서 발행'
	public int osuju_update(int ono);
	
	//발주 확인
	public String balju_check(int ono);
	
	//견적서 발행하기
	public OrderDTO check(int ono);
	
	
}
