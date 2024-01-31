package we.are.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

import we.are.Model.OrderDTO;

public interface StoreMapper {

	//'수주확인'된 거래처 리스트
	public ArrayList<HashMap<String, Object>> store_select();
	
	//재고량 확인
	public int product_select(String pstock);
	
	//출고일 등록
	public int balju_update(OrderDTO od);
	
}
