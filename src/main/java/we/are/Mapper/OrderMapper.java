package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface OrderMapper {

	// 발주 등록
	public void balju_insert(OrderDTO od);
	
	//발주 목록 리스트
	public ArrayList<OrderDTO> balju_select();
	
	//제품 목록 데이터 가져오기
	public ArrayList<InventoryDTO> product_select();
	
	//거래처 리스트
	public ArrayList<InventoryDTO> company_select();
	
	//수주서 발행
	public void suju_update(OrderDTO od);

}
