package org.soccer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public void list() throws Exception
	{
		
	}
	
}
