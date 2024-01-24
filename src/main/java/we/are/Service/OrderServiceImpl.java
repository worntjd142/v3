package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.OrderMapper;
import we.are.Model.CompanyDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.MailDTO;
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
	public ArrayList<OrderDTO> balju_select(CriteriaDTO cdto){
		return om.balju_select(cdto);
	}
	
	//상품 목록 리스트
	public ArrayList<InventoryDTO> product_select() {		
		return om.product_select();
	}
	
	// 발주 목록 거래처 리스트
	public ArrayList<CompanyDTO> company_select(){
		return om.company_select();
	}
	// 수주서 목록 거래처 리스트
	public CompanyDTO sujucom_select(String od){
		return om.sujucom_select(od);
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
	public int total(CriteriaDTO cdto) {
		return om.total(cdto);
	}

	
}
