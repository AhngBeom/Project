package com.ahng.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.Criteria;
import com.ahng.domain.PageDTO;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private ProductService service;

	@GetMapping("/pdtTable")
	public void pdtTable(Model model, Criteria cri) {
		cri.setSort("DESC");
		log.info("List : " + cri);
		log.info("Total : " + service.getTotal(cri));
		model.addAttribute("pdt", service.getListWithPaging(cri));
		model.addAttribute("page", new PageDTO(cri, service.getTotal(cri)));
	}

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
		log.info(vo.getPno());
		rttr.addFlashAttribute("result", vo.getPno());
		return "redirect:/admin/pdtTable";
	}

	@GetMapping("/pdtModify")
	public void productModify(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
	}

	@PostMapping("/pdtModify")
	public String modify(ProductVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info(vo);
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success_modify");
		}
		return "redirect:/admin/pdtTable";
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

	@GetMapping("/diary")
	public void diary(Criteria cri, Model model) {
//		cri = new Criteria("", 0, 10);
//		cri.setTable("diary");
		model.addAttribute("diary", service.getDiaryList(cri));
		model.addAttribute("page", new PageDTO(cri, service.getTotal(cri)));
	}
}
