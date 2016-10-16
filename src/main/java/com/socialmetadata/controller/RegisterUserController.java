package com.socialmetadata.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.service.AutorService;
import com.socialmetadata.service.LoginService;
import com.socialmetadata.service.RolService;
import com.socialmetadata.service.UsuarioService;
import com.socialmetadata.utilities.PasswordEncoderGenerator;


@Controller
public class RegisterUserController {
	
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private RolService rolService;
	
	@Autowired
	private
	LoginService loginService;
	
	@Autowired
	
	private AuthenticationManager authenticationManager;


	@RequestMapping(value = "/registerUser", method = RequestMethod.GET)
	public String setupForm(){
		
		return "registerUser";
	}
	
	@Transactional
	@RequestMapping(value="/registerUser.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerUser(@RequestParam String nombre, @RequestParam String apellido,
			 @RequestParam String username, @RequestParam String password){
		
		
		System.out.println("entra a registerUser.do");
		
		password = PasswordEncoderGenerator.encodePassword(password);
		
		Usuario usuario = new Usuario(username, nombre, apellido, username, password);
		
		
		Rol rol = rolService.getRol(1);
		Set<Rol> roles = new HashSet<Rol>();
		roles.add(rol);	
		usuario.setRoles(roles);
		
		usuarioService.add(usuario);
		
		return "usuario registrado exitosamente";
	}
	

}
