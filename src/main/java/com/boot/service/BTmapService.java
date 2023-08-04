package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.AdminDTO;
import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;
import com.boot.dto.TouristspotsDTO;

public interface BTmapService {
	public ArrayList<NoteDTO> noteList(Criteria cri);
	public ArrayList<TouristspotsDTO> BTList();
	public ArrayList<AdminDTO> adminLogin(String username);
	public int totalCount();
	public void noteWrite(HashMap<String, String> param);
	public void listWrite(HashMap<String, String> param);
}
