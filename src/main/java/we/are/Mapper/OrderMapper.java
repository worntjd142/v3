package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.CompanyDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.MailDTO;
import we.are.Model.OrderDTO;

public interface OrderMapper {

	// 발주 등록
	public void balju_insert(OrderDTO od);
	
	//발주 목록 리스트
	public ArrayList<OrderDTO> balju_select(CriteriaDTO cdto);
	
	//제품 목록 데이터 가져오기
	public ArrayList<InventoryDTO> product_select();
	
	//거래처 리스트
	public ArrayList<CompanyDTO> company_select();
	
	//거래처 리스트
	public CompanyDTO sujucom_select(String od);
	
	//수주서 발행
	public int suju_update(OrderDTO od);
	
	// 날짜 검색 : 배열안에 OrderDTO데이터를 담아서 !
	public ArrayList<OrderDTO> daysearch(OrderDTO od);
	
	public void saveFile(MailDTO md);

	public OrderDTO sujuletter_select(OrderDTO od);
	
	// 페이지 전체 건수 total
	public int total (CriteriaDTO cdto);
	
}
