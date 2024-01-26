package we.are.Service;

import java.util.ArrayList;

import we.are.Model.ConnectionDTO;

public interface ConnectionService {
	
	public void connection_insert(ConnectionDTO cd);

	public ArrayList<ConnectionDTO> connection_list();

}
