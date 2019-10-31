package org.soccer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/recruit/*")
public class RecruitController {
	private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public void list() throws Exception
	{
		
	}
	
}
