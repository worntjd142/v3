package we.are.Service;

import java.util.ArrayList;

import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;

public interface BaljuService {

	// 발주 등록
	public void balju_insert (BaljuDTO baldto);
	
	public ArrayList<InventoryDTO> product_select();
}
