package com.socialmetadata.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.socialmetadata.model.Idioma;
import com.socialmetadata.service.IdiomaService;

@Controller
public class IdiomaController {	

	@Autowired
	private IdiomaService idiomaService;

	@RequestMapping("/idioma")
	public String setupForm(Map<String, Object> map){
		Idioma idioma = new Idioma();
		map.put("idioma", idioma);
		map.put("idiomaList", idiomaService.getAllIdiomas());
		
	
		idiomaService.metodoTestIdiomaService();
		
		return "idioma";
	}
	
	@RequestMapping(value="/idioma.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute Idioma idioma, BindingResult result, @RequestParam String action, Map<String, Object> map){
		
		System.out.println("ENTROOOOOOOOOOOOOOOOOOOOO");
		Idioma idiomaResult = new Idioma();
		switch(action.toLowerCase()){	
		case "add":
			idiomaService.add(idioma);
			idiomaResult = idioma;
			break;
		case "edit":
			idiomaService.edit(idioma);
			idiomaResult = idioma;
			break;
		case "delete":
			idiomaService.delete(idioma.getIdIdioma());
			idiomaResult = new Idioma();
			break;
		case "search":
			Idioma searchedIdioma = idiomaService.getIdioma(idioma.getIdIdioma());
			idiomaResult = searchedIdioma!=null ? searchedIdioma : new Idioma();
			break;
		}
		map.put("idioma", idiomaResult);
		map.put("idiomaList", idiomaService.getAllIdiomas());
		return "idioma";
	}

}
