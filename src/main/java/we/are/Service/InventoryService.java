package we.are.Service;

import java.util.ArrayList;

import we.are.Model.InventoryDTO;

public interface InventoryService {

	//제품등록
	public void p_insert(InventoryDTO id);

	public ArrayList<InventoryDTO> p_list(InventoryDTO id);
}
