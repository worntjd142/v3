package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.CartDTO;
import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;


public interface OrderMapper {
	
	// 수주 등록
	public void order_insert (OrderDTO[] od);
	
	// 제품 등록
	public void cart_insert (CartDTO[] cdt);
	
	// 수주 목록 리스트
	public ArrayList<OrderDTO> order_select (CriteriaDTO cd);
	
	// 수주 상세정보
	public OrderDTO order_detail (OrderDTO od);
	
	// 거래처명 자동완성
	public ArrayList<ConnectionDTO> autocomplete (String cname);
	
	//제품 목록 데이터 가져오기
	public ArrayList<InventoryDTO> product_select ();
	
	//수주서 발행
	public int suju_update (int ono);
	
	// 날짜 검색 : 배열안에 OrderDTO데이터를 담아서 !
	public ArrayList<OrderDTO> daysearch (CriteriaDTO cd);
	
	public OrderDTO sujuletter_select (OrderDTO od);
	
	// 페이지 전체 건수 total
	public int total (CriteriaDTO cd);
	
}
