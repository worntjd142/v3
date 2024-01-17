package we.are.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.InventoryMapper;

@Service
public class InventoryServiceImpl implements InventoryService {
	
	@Autowired
	InventoryMapper im;
}
