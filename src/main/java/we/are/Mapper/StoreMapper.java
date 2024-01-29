package we.are.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface StoreMapper {

	//출고 목록 가져오기
	public ArrayList<HashMap<String, Object>> store_select();
	
}
