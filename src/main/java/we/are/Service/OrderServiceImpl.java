package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.OrderMapper;
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
	
	// 수주 목록 리스트
	public ArrayList<OrderDTO> order_select(CriteriaDTO cd){
		return om.order_select(cd);
	}
	
	//상품 목록 리스트
	public ArrayList<InventoryDTO> product_select() {		
		return om.product_select();
	}
	
		
	//수주서 발행
	public int suju_update(OrderDTO od) {
		 return om.suju_update(od);
	}
	
	// 날짜 검색
	public ArrayList<OrderDTO> daysearch(OrderDTO od) {
		return om.daysearch(od);
	};
	
	public OrderDTO sujuletter_select(OrderDTO od) {
		return om.sujuletter_select(od);
	}

	// 페이지 전체 건수 total
	public int total(CriteriaDTO cd) {
		return om.total(cd);
	}
	
}
