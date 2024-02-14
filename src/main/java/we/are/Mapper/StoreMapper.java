package we.are.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface StoreMapper {

	//'수주 확인'된 거래처 리스트
	public ArrayList<HashMap<String, Object>> store_select();
	//'출고 확인' 된 거래처 리스트
	public ArrayList<HashMap<String, Object>> storerelease_select();
	//'견적서 발행' 된 거래처 리스트  
	public ArrayList<HashMap<String, Object>> management_select();
	//'출고 확인'된 거래처 리스트 세부
	public ArrayList<HashMap<String, Object>> issuance_select(int ono);
	
	public HashMap<String, Object> osuju_select(int ono);
	
	public HashMap<String, Object> issuance_pdf(int ono);
	
	public ArrayList<HashMap<String, Object>> product_List(String ono);
	
	public ArrayList<HashMap<String, Object>> sujuletter_select(int ono);

	public int storerelease_count();
	
	//장바구니 조인
	public ArrayList<HashMap<String, Object>> product_select(String ono);
	
	//출고일 등록
	public int balju_update(OrderDTO od);
	
	//발주 확인
	public String balju_check(int ono);
	
	//수주상태 변경 - > '견적서 발행'
	public int osuju_update(int ono);
	
	//견적서 발행
	public OrderDTO check(int ono);
	
	//출하서 등록
	public void shipment_insert(int ono);

	public int shipment_cselect(int ono);
	
	public void snumber_update(OrderDTO od);
	
	public void shipment_delivery(int ono);
	
	public int snumber_select(int ono);
	
	public ArrayList<HashMap<String, Object>> shipment_select(int ono);
	
	public void cut(OrderDTO od);
}
