package we.are.Mapper;

import java.util.ArrayList;

import we.are.Model.BaljuDTO;

public interface SujuMapper {

	public ArrayList<String> suju_select();

	public void suju_insert(BaljuDTO bd);
	
}
