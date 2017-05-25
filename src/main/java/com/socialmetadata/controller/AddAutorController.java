package com.socialmetadata.controller;

import org.apache.commons.lang3.text.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.Autor;
import com.socialmetadata.service.AutorService;

@Controller
public class AddAutorController {
	
	@Autowired
	private AutorService autorService;
	
	
	@RequestMapping(value="/addAutor", method=RequestMethod.POST)
	@ResponseBody
	public String addAutor(@RequestParam String newAutorNombre, @RequestParam String newAutorApellido){
		
		newAutorApellido = WordUtils.capitalizeFully(newAutorApellido);
		newAutorNombre = WordUtils.capitalizeFully(newAutorNombre);
		
		
		Autor autor = new Autor(newAutorNombre, newAutorApellido);
		autorService.addAutor(autor);
		
		return "Autor guardado exitosamente";
	}
	

}
