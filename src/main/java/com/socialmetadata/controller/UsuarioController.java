package com.socialmetadata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.socialmetadata.service.UsuarioService;

@Controller
public class UsuarioController {
	

	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping("/usuario")
	public String getUsuario() {
		
			usuarioService.getByUsername("manager");
//			usuarioService.getUsuario(1);
		  return "flatly";  
		 }  
		
	

}
