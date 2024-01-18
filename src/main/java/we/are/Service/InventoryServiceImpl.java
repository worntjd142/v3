package we.are.Service;

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
}
