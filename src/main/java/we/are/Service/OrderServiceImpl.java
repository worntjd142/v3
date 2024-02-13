package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.OrderMapper;
import we.are.Model.CartDTO;
import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper om;
		
	
	// 수주 등록
	public void order_insert(OrderDTO od) {
		om.order_insert(od);		
	}
	
	// 제품 등록
	public void cart_insert (CartDTO cd) {
		om.cart_insert(cd);
	}
	
	// 수주 목록 리스트
	public ArrayList<HashMap<String, Object>> order_select (CriteriaDTO cd){		
		return om.order_select(cd);
	}
	
	// 수주 상세정보
	public ArrayList<HashMap<String, Object>> order_detail (int ono) {
		return om.order_detail(ono);
	}
	
	// 거래처명 자동완성
	public ArrayList<ConnectionDTO> autocomplete (String cname){
		return om.autocomplete(cname);
	}	
	
	//상품 목록 리스트
	public ArrayList<InventoryDTO> product_select() {		
		return om.product_select();
	}
		
	// 수주서 발행
	public int suju_update(int ono) {
		 return om.suju_update(ono);
	}
	
	// 날짜 검색
	public ArrayList<OrderDTO> daysearch(CriteriaDTO cd) {
		return om.daysearch(cd);
	};
	
	public OrderDTO sujuletter_select(OrderDTO od) {
		return om.sujuletter_select(od);
	}

	// 페이지 전체 건수 total
	public int total(CriteriaDTO cd) {
		return om.total(cd);
	}
	
	//장바구니로 넣을 ono 검색
		public int ono_select(OrderDTO od) {
			return om.ono_select(od);
		}

	
}
