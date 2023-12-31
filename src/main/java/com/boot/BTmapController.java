package com.boot;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.AdminDTO;
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
	public String BTmap(@RequestParam HashMap<String, String> param,Model model,HttpSession session) {
		log.info("@# BTmap");
		log.info("@# BTmap param"+param);
		log.info("@# BTmap BTList"+service.BTList());
		if (param.isEmpty()) {
			model.addAttribute("BTList", service.BTList());
			return "map";
			
		}else {
			model.addAttribute("BTList", service.BTList());
			ArrayList<AdminDTO> dto=service.adminLogin(param.get("admin"));
			String admin=dto.get(0).getUsername();
//			model.addAttribute("admin", admin);
			session.setAttribute("admin", admin);
			return "map";
		}
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
	public ResponseEntity<Integer> noteWrite_ok(@RequestParam HashMap<String, String> param, MultipartFile file) throws IllegalStateException, Exception {
		log.info("@# noteWrite_ok param=="+param);
		log.info("@# noteWrite_ok file=="+file);

    	if (file.isEmpty()) {
            service.noteWrite(param);
        } else {
			/*우리의 프로젝트경로를 담아주게 된다 - 저장할 경로를 지정*/
	        String projectPath ="C:\\workplace\\workspace\\BTmap\\src\\main\\resources\\static\\img\\note";

	        /*식별자 . 랜덤으로 이름 만들어줌*/
	        UUID uuid = UUID.randomUUID();
	        
	        /*랜덤식별자_원래파일이름 = 저장될 파일이름 지정*/
	        String fileName = uuid + "_" + file.getOriginalFilename();

	        /*빈 껍데기 생성*/
	        /*File을 생성할건데, 이름은 "name" 으로할거고, projectPath 라는 경로에 담긴다는 뜻*/
	        File saveFile = new File(projectPath, fileName);
	        
	        file.transferTo(saveFile);
	        
	        /*경로를 데이터베이스에 저장*/
	        param.put("imgName", fileName);
	        service.noteWrite(param);
	        
        }
        return ResponseEntity.status(HttpStatus.OK).body(100);
	}
	
	@RequestMapping("/listWrite")
	public String listWrite() {
		log.info("@# listWrite");
		return "listWrite";
	}
	@RequestMapping("/listWrite_ok")
	public ResponseEntity<Integer> listWrite_ok(@RequestParam HashMap<String, String> param, MultipartFile file) throws IllegalStateException, Exception {
		log.info("@# listWrite param"+param);
		log.info("@# listWrite file="+file);
			
			/*우리의 프로젝트경로를 담아주게 된다 - 저장할 경로를 지정*/
			String projectPath ="C:\\workplace\\workspace\\BTmap\\src\\main\\resources\\static\\img\\list";
			
			/*식별자 . 랜덤으로 이름 만들어줌*/
			UUID uuid = UUID.randomUUID();
			
			/*랜덤식별자_원래파일이름 = 저장될 파일이름 지정*/
			String fileName = uuid + "_" + file.getOriginalFilename();
			
			/*빈 껍데기 생성*/
			/*File을 생성할건데, 이름은 "name" 으로할거고, projectPath 라는 경로에 담긴다는 뜻*/
			File saveFile = new File(projectPath, fileName);
			
			file.transferTo(saveFile);
			
			/*경로를 데이터베이스에 저장*/
			param.put("imgName", fileName);
			
			service.listWrite(param);
	
			
	    return ResponseEntity.status(HttpStatus.OK).body(100);
	}
	
//	관리자 로그인페이지
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}
	
	@RequestMapping("/adminLoginOk")
	public ResponseEntity<Object> adminLoginOk(@RequestParam HashMap<String, String> param, Model model) {
		log.info("adminLoginOk param"+param);
		ArrayList<AdminDTO> dto=service.adminLogin(param.get("username"));
		
		if (dto.isEmpty()) {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			if (dto.get(0).getPassword().equals(param.get("password"))) {
				log.info("adminLoginOk admin="+dto.get(0));
				return ResponseEntity.status(HttpStatus.OK).body(dto.get(0).getPassword());
			}else {
				return ResponseEntity.status(HttpStatus.OK).body(200);
			}
		}
	}
//	로그 아웃
    @RequestMapping("/logout")
    public ResponseEntity<Object> logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return ResponseEntity.status(HttpStatus.OK).body(100); // 로그아웃 후 리다이렉트할 페이지
    }
}















