package we.are.Service;

import java.util.ArrayList;

import we.are.Model.InventoryDTO;

public interface InventoryService {

	
	//제품등록
	public void p_insert(InventoryDTO id);
	
	//제품리스트
	public ArrayList<InventoryDTO> p_list(InventoryDTO id);
	
	//제픔
	public ArrayList<InventoryDTO> p_detail();
	
	
}
