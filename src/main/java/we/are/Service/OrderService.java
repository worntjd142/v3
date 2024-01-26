package we.are.Service;

import java.util.ArrayList;

import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface OrderService {
	
	// 수주 등록
	public void order_insert (OrderDTO od);
	
	// 수주 목록 리스트
	public ArrayList<OrderDTO> order_select(CriteriaDTO cd);
	
	//제품 리스트
	public ArrayList<InventoryDTO> product_select();
	
	//수주서 발행
	public int suju_update(OrderDTO od);
	
	//수주내역 날짜 검색
	public ArrayList<OrderDTO> daysearch(CriteriaDTO cd);
	
	// 페이지 전체 건수 total
	public int total (CriteriaDTO cd);	
	
}
