package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BTmapDao;
import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;

@Service
public class BTmapServiceImpl implements BTmapService{

	@Autowired
	private BTmapDao dao;
	

	@Override
	public void noteWrite(HashMap<String, String> param) {
		dao.noteWrite(param);
	}

	@Override
	public ArrayList<NoteDTO> noteList(Criteria cri) {
		return dao.noteList(cri);
	}

	@Override
	public int TotalCount() {
		return dao.TotalCount();
	}
	@Override
	public void listWrite(HashMap<String, String> param) {
		dao.listWrite(param);
	}
}








