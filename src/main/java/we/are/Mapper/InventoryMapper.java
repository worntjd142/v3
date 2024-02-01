package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.InventoryDTO;

public interface InventoryMapper {
	//제품 등록
	public void p_insert(InventoryDTO id);

	public ArrayList<InventoryDTO> p_list(InventoryDTO id);

	public ArrayList<InventoryDTO> p_detail(String pcode);

	public InventoryDTO house(InventoryDTO id);

	public void housing(InventoryDTO id);
}
