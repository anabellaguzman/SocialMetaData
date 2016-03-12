package com.socialmetadata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Autor;
import com.socialmetadata.service.AutorService;

@Controller
public class AddAutorController {
	
	@Autowired
	private AutorService autorService;
	
	@RequestMapping(value = "/addAutor")
	@ResponseBody
	public ModelAndView setupForm (){
		ModelAndView mav = new ModelAndView("autorForm");		
		return mav;
	}
	
	@RequestMapping(value="/addAutor.do", method=RequestMethod.POST)
	public void addAutor(@RequestParam String nombre, @RequestParam String apellido){
		
		Autor autor = new Autor(nombre, apellido);
		autorService.addAutor(autor);
	}
	

}
