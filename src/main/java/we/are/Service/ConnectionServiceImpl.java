package we.are.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.Mapper.ConnectionMapper;
import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;

@Service
public class ConnectionServiceImpl implements ConnectionService {

	@Autowired
	ConnectionMapper cm;

	
	public void connection_insert(ConnectionDTO cd) {
		cm.connection_insert(cd);
		
	}


	public ArrayList<ConnectionDTO> connection_list(CriteriaDTO cd) {
		return cm.connection_list(cd);
	}


	public int total(CriteriaDTO cd) {
		// TODO Auto-generated method stub
		return cm.total(cd);
	}
	
	
}
