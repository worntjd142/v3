package we.are.Service;

import java.util.ArrayList;

import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;

public interface ConnectionService {
	
	public void connection_insert(ConnectionDTO cod);

	public ArrayList<ConnectionDTO> connection_list(CriteriaDTO cd);
	
	public int total (CriteriaDTO cd);

}
