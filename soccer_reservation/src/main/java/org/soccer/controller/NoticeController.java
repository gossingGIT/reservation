package org.soccer.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soccer.domain.NoticeVO;
import org.soccer.domain.PageMaker;
import org.soccer.domain.SearchCriteria;
import org.soccer.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception
	{
		logger.info(cri.toString());
		model.addAttribute("list",service.list(cri));
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		
		model.addAttribute("pageMaker",pageMaker);
		logger.info(model.toString());
		
	}
	
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public void read(@RequestParam("bno")int bno,@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception
	{
		model.addAttribute(service.read(bno));
		logger.info(cri.toString());
	}
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception
	{
		service.remove(bno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/notice/view";
	}
	
	@RequestMapping(value="/modify",method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri")SearchCriteria cri, Model model)throws Exception
	{
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagingPOST(NoticeVO board,SearchCriteria cri, RedirectAttributes rttr)throws Exception
	{
		logger.info("modifyPost..");
		logger.info(board.getTitle());
		logger.info(board.getContent());
		service.modify(board);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/notice/view";
	}
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public void registGET() throws Exception
	{
		logger.info("regist get..........");
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String registPOST(NoticeVO board,RedirectAttributes rttr) throws Exception
	{
		logger.info("regist post............");
		logger.info(board.toString());
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/notice/view";
	}
	
}
