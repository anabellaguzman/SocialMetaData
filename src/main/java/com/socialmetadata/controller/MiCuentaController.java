package com.socialmetadata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MiCuentaController {
	
	@RequestMapping(value ="/micuenta",  method = RequestMethod.GET)
	public String setupView() {
//		ModelAndView mav = new ModelAndView("");
		return "miCuenta";
	}
	

}
