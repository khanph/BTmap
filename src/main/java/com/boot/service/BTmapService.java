package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;

public interface BTmapService {
	public ArrayList<NoteDTO> noteList(Criteria cri);
	public int TotalCount();
	public void noteWrite(HashMap<String, String> param);
}
