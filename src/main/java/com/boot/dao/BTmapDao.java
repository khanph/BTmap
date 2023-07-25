package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;

@Mapper
public interface BTmapDao {
	public ArrayList<NoteDTO> noteList(Criteria cri);
	public int TotalCount();
	public void noteWrite(HashMap<String, String> param);
	public void listWrite(HashMap<String, String> param);
	
}
