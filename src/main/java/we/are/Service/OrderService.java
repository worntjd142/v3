package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import we.are.Model.CartDTO;
import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface OrderService {
	
	// 수주 등록
	public void order_insert (OrderDTO od);
	
	// 제품 등록
	public void cart_insert (CartDTO cd);
	
	// 수주 목록 리스트
	public ArrayList<HashMap<String, Object>> order_select (CriteriaDTO cd);
	
	// 수주 상세정보
	public OrderDTO order_detail (OrderDTO od);
	
	// 거래처명 자동완성
	public ArrayList<ConnectionDTO> autocomplete (String cname);
	
	//제품 리스트
	public ArrayList<InventoryDTO> product_select();
	
	//수주서 발행
	public int suju_update (int ono);
	
	//수주내역 날짜 검색
	public ArrayList<OrderDTO> daysearch (CriteriaDTO cd);
	
	// 페이지 전체 건수 total
	public int total (CriteriaDTO cd);
	
	//장바구니로 넣을 ono 검색
	public int ono_select(OrderDTO od);

	
}
