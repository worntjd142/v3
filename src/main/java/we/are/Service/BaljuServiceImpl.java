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
	
	//발주 목록 리스트
	public ArrayList<InventoryDTO> balju_select(){
		return balm.balju_select();
	}
	
	//상품 목록 리스트
	public ArrayList<InventoryDTO> product_select() {		
		return balm.product_select();
	}
	
}
