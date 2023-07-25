package com.boot;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.service.BTmapService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BTmapController {

	@Autowired
	private BTmapService service;
	
	@RequestMapping("/BTmap")
	public String BTmap() {
		log.info("@# BTmap");
		return "map";
	}
	@RequestMapping("/noteList")
	public String noteList(HttpServletResponse response,Model model, Criteria cri) {
		//뒤로가기 버그
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies

		//note 목록
		model.addAttribute("list", service.noteList(cri));
		//페이징
		int total=service.TotalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "noteList";
	}
	
	@RequestMapping("/noteWrite")
	public String noteWrite() {
		log.info("@# noteWrite");
		return "noteWrite";
	}
	
	@RequestMapping("/noteWrite_ok")
	public String noteWrite_ok(@RequestParam HashMap<String, String> param) {
		log.info("@# noteWrite_ok param"+param);
		service.noteWrite(param);
		
		return "redirect:/noteList";
	}
	
	
}















