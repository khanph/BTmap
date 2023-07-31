package com.boot;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String BTmap(Model model) {
		log.info("@# BTmap");
		model.addAttribute("BTList", service.BTList());
		return "map";
	}
	@RequestMapping("/noteList")
	public String noteList(HttpServletResponse response,Model model, Criteria cri) {
		//�ڷΰ��� ����
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies

		//note ���
		model.addAttribute("list", service.noteList(cri));
		//����¡
		int total=service.totalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "noteList";
	}
	
	@RequestMapping("/noteWrite")
	public String noteWrite() {
		log.info("@# noteWrite");
		return "noteWrite";
	}
	
	@RequestMapping("/noteWrite_ok")
	public String noteWrite_ok(@RequestParam HashMap<String, String> param, MultipartFile file) throws IllegalStateException, Exception {
		log.info("@# noteWrite_ok param=="+param);
		log.info("@# noteWrite_ok file=="+file);
		
		if (file.isEmpty()) {
			service.noteWrite(param);
		}else {
			/*�츮�� ������Ʈ��θ� ����ְ� �ȴ� - ������ ��θ� ����*/
	        String projectPath ="C:\\workplace\\workspace\\BTmap\\src\\main\\resources\\static\\img\\note";
	        log.info("@# noteWrite_ok 1 projectPath=="+projectPath);

	        /*�ĺ��� . �������� �̸� �������*/
	        UUID uuid = UUID.randomUUID();
	        
	        log.info("@# noteWrite_ok 2 noteno=="+uuid);
	        /*�����ĺ���_���������̸� = ����� �����̸� ����*/
	        String fileName = uuid + "_" + file.getOriginalFilename();
	        log.info("@# noteWrite_ok 3 fileName=="+fileName);

	        /*�� ������ ����*/
	        /*File�� �����Ұǵ�, �̸��� "name" �����ҰŰ�, projectPath ��� ��ο� ���ٴ� ��*/
	        File saveFile = new File(projectPath, fileName);
	        log.info("@# noteWrite_ok 4 ");
	        
	        file.transferTo(saveFile);
	        
	        /*��θ� �����ͺ��̽��� ����*/
	        param.put("imgName", fileName);
	        log.info("@# noteWrite_ok 5 param="+param);
	        service.noteWrite(param);
		}
		
		return "redirect:/noteList";
	}
	@RequestMapping("/listWrite")
	public String listWrite() {
		log.info("@# listWrite");
		return "listWrite";
	}
	
	@RequestMapping("/listWrite_ok")
//	public String listWrite_ok(@RequestPart MultipartFile img, @RequestParam HashMap<String, String> param) {
	public String listWrite_ok(@RequestParam HashMap<String, String> param) {
		log.info("@# listWrite param"+param);
		
		 service.listWrite(param);
		
		return "listWrite";
	}
	
	
}















