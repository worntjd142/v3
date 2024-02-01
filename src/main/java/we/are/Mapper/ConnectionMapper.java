package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;

public interface ConnectionMapper {

	public void connection_insert(ConnectionDTO cd);

	public ArrayList<ConnectionDTO> connection_list(CriteriaDTO cd);

	public int total(CriteriaDTO cd);

}
