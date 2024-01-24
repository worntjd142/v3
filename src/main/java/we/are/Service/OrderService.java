package we.are.Service;

import java.util.ArrayList;

import we.are.Model.CompanyDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

public interface OrderService {

	// 발주 등록
	public void balju_insert (OrderDTO od);
	
	//발주 목록 리스트
	public ArrayList<OrderDTO> balju_select(CriteriaDTO cdto);
	
	//제품 리스트
	public ArrayList<InventoryDTO> product_select();
	
	//거래처 리스트
	public CompanyDTO sujucom_select(String od);

	//거래처 리스트
	public ArrayList<CompanyDTO> company_select();
	
	//수주서 발행
	public int suju_update(OrderDTO od);
	
	//수주내역 날짜 검색
	public ArrayList<OrderDTO> daysearch(OrderDTO od);
	
	//수주서 목록 리스트 
	public OrderDTO sujuletter_select(OrderDTO od);
	
	// 페이지 전체 건수 total
	public int total (CriteriaDTO cdto);
	
	
}
