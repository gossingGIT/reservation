package org.soccer.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soccer.domain.Criteria;
import org.soccer.domain.PageMaker;
import org.soccer.domain.SearchCriteria;
import org.soccer.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Inject
	private ReservationService service;
	
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public void list(Model model) throws Exception
	{
		logger.info("예약 현황");
		model.addAttribute("status",service.status());
		logger.info(model.toString());
	}
	
	@RequestMapping(value="/manage",method=RequestMethod.GET)
	public void listManage(Model model) throws Exception
	{
		logger.info("관리자페이지");
		model.addAttribute("status",service.status());
		logger.info(model.toString());
	}

	@RequestMapping(value="/details",method=RequestMethod.GET)
	public void reslist(@ModelAttribute("cri")Criteria cri,Model model) throws Exception
	{
		logger.info("세부내역 현황");
		model.addAttribute("list",service.historyView(cri));
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		logger.info(model.toString());
	}
}
