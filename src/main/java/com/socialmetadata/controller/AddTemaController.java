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

	@RequestMapping(value = "/addTema", method=RequestMethod.POST)
	@ResponseBody
	public String addTema(@RequestParam String newTema){
		
		Tema tema = new Tema(newTema);		
		temaService.addTema(tema);
		
		return "Tema guardado exitosamente";
		
		
	}


}
