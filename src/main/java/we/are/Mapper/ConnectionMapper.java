package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.ConnectionDTO;

public interface ConnectionMapper {

	public void connection_insert(ConnectionDTO cd);

	public ArrayList<ConnectionDTO> connection_list();

}
