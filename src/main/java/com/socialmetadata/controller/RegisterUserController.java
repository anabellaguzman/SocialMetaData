package com.socialmetadata.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.service.AutorService;
import com.socialmetadata.service.RolService;
import com.socialmetadata.service.UsuarioService;
import com.socialmetadata.utilities.PasswordEncoderGenerator;


@Controller
public class RegisterUserController {
	
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private RolService rolService;
	
	
	
	

	@RequestMapping(value = "/registerUser", method = RequestMethod.GET)
	public String setupForm(){
		
		return "registerUser";
	}
	
	@Transactional
	@RequestMapping(value="/registerUser.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerUser(@RequestParam String nombre, @RequestParam String apellido,
			@RequestParam String email, @RequestParam String username, @RequestParam String password){
		
//		Usuario usuario = new Usuario(username, nombre, apellido, email, password);
		
		password = PasswordEncoderGenerator.encodePassword(password);
		
		Usuario usuario = new Usuario(username, nombre, apellido, email, password);

		
		usuarioService.add(usuario);
		
		
//		System.out.println(nombre);
		
		return "Su cuenta a sido creada exitosamente";
	}
	

}
