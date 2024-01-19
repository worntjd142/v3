package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.InventoryMapper;
import we.are.Model.InventoryDTO;

@Service
public class InventoryServiceImpl implements InventoryService {
	
	@Autowired
	InventoryMapper im;

	@Override
	public void p_insert(InventoryDTO id) {
		im.p_insert(id);
	}

	@Override
	public ArrayList<InventoryDTO> p_list(InventoryDTO id) {
		return im.p_list(id);
	}

	@Override
	public ArrayList<InventoryDTO> p_detail(String pcode) {
		return im.p_detail(pcode);
	}
}
