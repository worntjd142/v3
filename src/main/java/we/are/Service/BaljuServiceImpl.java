package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.BaljuMapper;
import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;

@Service
public class BaljuServiceImpl implements BaljuService {

	@Autowired
	BaljuMapper balm;
	
	// 발주 등록
	public void balju_insert (BaljuDTO baldto) {
		balm.balju_insert(baldto);
	}
	
	public ArrayList<InventoryDTO> product_select() {		
		return balm.product_select();
	}
}
