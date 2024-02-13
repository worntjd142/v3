package we.are.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.StoreMapper;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreMapper sm;

	//'수주확인'된 거래처 리스트
	public ArrayList<HashMap<String, Object>> store_select() {
		return sm.store_select();
	}

	public ArrayList<HashMap<String, Object>> storerelease_select(){
		return sm.storerelease_select();

	}

	public ArrayList<HashMap<String, Object>> management_select(){
		return sm.management_select();
	}

	//장바구니 조인
	public ArrayList<HashMap<String, Object>> product_select(String ono) {
		return sm.product_select(ono);
	}
	
	public ArrayList<HashMap<String, Object>> product_List(String ono){
		return sm.product_List(ono);
	}
	
	public HashMap<String, Object> osuju_select(int ono){
		return sm.osuju_select(ono);
	}
	
	public HashMap<String, Object> issuance_pdf(int ono){
		return sm.issuance_pdf(ono);
	}
	
	//수주상태 변경 - > '견적서 발행'
	public int osuju_update(int ono) {
		return sm.osuju_update(ono);
	}
	
	public ArrayList<HashMap<String, Object>> sujuletter_select(int ono){
		return sm. sujuletter_select(ono);
	}

	//출고일 등록
	public int balju_update(OrderDTO od) {
		return sm.balju_update(od);
	}

	//출고일 등록
	public String balju_check(int ono) {
		return sm.balju_check(ono);
	}

	//견적서 발행하기
	public OrderDTO check(int ono) {
		return sm.check(ono);
	}
	
	public ArrayList<HashMap<String, Object>> issuance_select(int ono){
		return sm.issuance_select(ono);
	}
	
	public int storerelease_count() {
		return sm.storerelease_count();
	}
	
	public void shipment_insert(int ono) {
		 sm.shipment_insert(ono);
	}
	
	public int shipment_cselect(int ono) {
		return sm.shipment_cselect(ono);
	}
	
	public void snumber_update(OrderDTO od) {
		sm.snumber_update(od);
	}
	
	public int snumber_select(int ono) {
		return sm.snumber_select(ono);
	}
	
	public void shipment_delivery(int ono) {
		sm.shipment_delivery(ono);
	}
	
	public ArrayList<HashMap<String, Object>> shipment_select(int ono) {
		return sm.shipment_select(ono);
	}
	
}

