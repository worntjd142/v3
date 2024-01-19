package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;

public interface BaljuMapper {

	// 발주 등록
	public void balju_insert(BaljuDTO baldto);
	
	//발주 목록 리스트
	public ArrayList<InventoryDTO> balju_select();
	
	//제품 목록 데이터 가져오기
	public ArrayList<InventoryDTO> product_select();
	
}
