package we.are.Service;

import java.util.ArrayList;

import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;

public interface BaljuService {

	// 발주 등록
	public void balju_insert (BaljuDTO baldto);
	
	//발주 목록 리스트
	public ArrayList<InventoryDTO> balju_select();
	
	//제품 리스트
	public ArrayList<InventoryDTO> product_select();
	

}
