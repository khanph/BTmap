package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BTmapDao;
import com.boot.dto.AdminDTO;
import com.boot.dto.Criteria;
import com.boot.dto.NoteDTO;
import com.boot.dto.TouristspotsDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BTmapServiceImpl implements BTmapService{

	@Autowired
	private BTmapDao dao;
	
	@Override
	public ArrayList<TouristspotsDTO> BTList() {
		return dao.BTList();
	}

	@Override
	public void noteWrite(HashMap<String, String> param) {
		dao.noteWrite(param);
	}

	@Override
	public ArrayList<NoteDTO> noteList(Criteria cri) {
		return dao.noteList(cri);
	}
	@Override
	public ArrayList<AdminDTO> adminLogin(String username) {
		return dao.adminLogin(username);
	}

	@Override
	public int totalCount() {
		return dao.totalCount();
	}
	@Override
	public void listWrite(HashMap<String, String> param) {
		log.info("service listWrite param"+param);
		dao.listWrite(param);
	}
}








