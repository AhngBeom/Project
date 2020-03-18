package com.ahng.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private ProductService service;

	@GetMapping("/pdtInfo")
	public void pdtInfo(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
	}

	@GetMapping("/pdtAdd")
	public void pdtAddGET() {

	}

	@PostMapping("/pdtAdd")
	public String pdtAddPOST(ProductVO vo, RedirectAttributes rttr) {

		log.info("===============================================");
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(vo);
		log.info("===============================================");

		service.register(vo);
		rttr.addFlashAttribute("result", vo.getPno());
		return "redirect:/admin/pdtTable";
	}

	@GetMapping("/pdtModify")
	public void productModify(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
		// model.addAttribute("attach", service.getAttachList(pno));
	}
	
	@PostMapping("/pdtModify")
	public String modify(ProductVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info(vo);
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success_modify");
		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/pdtTable";
	}

	@GetMapping("/pdtTable")
	public void pdtTable(Criteria cri, Model model) {
		model.addAttribute("pdt", service.getList(cri));
	}

	private void deleteFiles(List<ProductAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info(attachList);
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\SpringProject\\OnlineShop\\upload\\" + attach.getUploadPath() + "\\"
						+ attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\SpringProject\\OnlineShop\\upload\\" + attach.getUploadPath()
							+ "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbnail);
					log.info("Delete : " + thumbnail);
				}
				log.info("Delete : " + file);
			} catch (Exception e) {
				log.error("Delete File ERROR : " + e.getMessage());
			}
		});
	}

	@PostMapping("/pdtDelete")
	public String pdtTable(@RequestParam("pno") Long pno, RedirectAttributes rttr) {
		List<ProductAttachVO> attachList = service.getAttachList(pno);
		
		if (service.remove(pno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "pdt-del-success");
			log.info("Product(" + pno + ") Delete : Success");
		}
		return "redirect:/admin/pdtTable";
	}

	@GetMapping(value = "/getAttachList")
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(Long pno) {
		return new ResponseEntity<>(service.getAttachList(pno), HttpStatus.OK);
	}
}
