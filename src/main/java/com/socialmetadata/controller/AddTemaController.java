package com.socialmetadata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Tema;
import com.socialmetadata.service.TemaService;

@Controller
public class AddTemaController {
	
	@Autowired
	private TemaService temaService;

	@RequestMapping(value = "/addTema")
	@ResponseBody
	public ModelAndView setupForm(){
		ModelAndView mav = new ModelAndView("temaForm");		
		return mav;
	}
	
	@RequestMapping(value="/addTema.do", method=RequestMethod.POST)
	public void addTema(@RequestParam String tema1){
		
		Tema tema = new Tema(tema1);		
		temaService.addTema(tema);
		
		
	}


}
