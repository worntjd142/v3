package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.OrderMapper;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper om;
	
	// 발주 등록
	public void balju_insert (OrderDTO od) {
		om.balju_insert(od);
	}
	
	//발주 목록 리스트
	public ArrayList<OrderDTO> balju_select(){
		return om.balju_select();
	}
	
	//상품 목록 리스트
	public ArrayList<InventoryDTO> product_select() {		
		return om.product_select();
	}
	
	// 거래처 리스트
	public ArrayList<InventoryDTO> company_select(){
		return om.company_select();
	}
	
	//수주서 발행
	public void suju_update(OrderDTO od) {
		 om.suju_update(od);
	}
	
	// 날짜 검색
	public ArrayList<OrderDTO> daysearch(OrderDTO od) {
		return om.daysearch(od);
	};
	
}
