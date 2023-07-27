package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;
import com.boot.dto.TouristspotsDTO;

@Mapper
public interface BTmapDao {
	public ArrayList<NoteDTO> noteList(Criteria cri);
	public ArrayList<TouristspotsDTO> BTList();
	public int totalCount();
	public void noteWrite(HashMap<String, String> param);
	public void listWrite(HashMap<String, String> param);
	
}
