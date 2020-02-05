package com.ahng.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.Criteria;
import com.ahng.domain.FeedAttachDTO;
import com.ahng.domain.FeedVO;
import com.ahng.domain.PageDTO;
import com.ahng.service.FeedService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/feed/*")
@Log4j
public class FeedController {

	private FeedService service;

	@GetMapping("/main")
	public void home(Criteria cri, Model model) {
		
		model.addAttribute("feed", service.getList(cri));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("Criteria : " + cri);
		log.info("Total : " + total);
	}
	
	@GetMapping("/feed_test")
	public void test(Criteria cri, Model model) {

		model.addAttribute("feed", service.getList(cri));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("Criteria : " + cri);
		log.info("Total : " + total);
	}
	
	@GetMapping("/register")
	public void registerGet() {

	}

	@PostMapping("/register")
	public String registerPost(FeedVO vo, RedirectAttributes rttr) {
		
		log.info("===============================================");
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("===============================================");
		
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getFno());
		return "redirect:/feed/main";
	}

	@GetMapping({ "/get", "/modify" })
	public void getOrModify(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("feed", service.get(fno));
		model.addAttribute("attach", service.getAttachList(fno));
	}

	@PostMapping("/modify")
	public String modify(FeedVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success_modify");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/feed/main";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		List<FeedAttachDTO> attachList = service.getAttachList(fno);
		if (service.remove(fno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success_remove");
		}
		return "redirect:/feed/main" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<FeedAttachDTO>> getAttachList(Long fno){
		return new ResponseEntity<>(service.getAttachList(fno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<FeedAttachDTO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("Delete attach files................................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\Portfolio\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\Portfolio\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbnail);
				}
			} catch (Exception e) {
				log.error("Delete file error " + e.getMessage());
			}
		});
	}
}
