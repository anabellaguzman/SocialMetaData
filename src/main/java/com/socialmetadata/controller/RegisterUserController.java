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
	
	
	@RequestMapping(value="/checkUsername.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkUsername(
			 @RequestParam String username){
		
		
		if(checkIsUser(username)){			
			System.out.println("existe el username");
			return "1";
		}
		
		else{
			return "0";
		}
	
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
	
	
	private boolean checkIsUser(String username){
		
		if (usuarioService.getByUsername(username)==null){
			return false;
		}
		else{return true;}
		
		
	}
	
		@Transactional
		@RequestMapping(value="/loginFBUser.do", method=RequestMethod.POST)
		@ResponseBody
		public String loginFBUser(@RequestParam String nombre, @RequestParam String apellido,
				 @RequestParam String username, @RequestParam String password){
			
			if(checkIsUser(username)==false){
				
				System.out.println("no existe el username");
				registerFBUser(nombre, apellido, username, password);
			};
			
//			Rol rolUser = rolService.getRol(1);
//			Rol rolFB = rolService.getRol(1);
//			Set<Rol> roles = new HashSet<Rol>();
//			roles.add(rolUser);	
//			roles.add(rolFB);
//			usuario.setRoles(roles);
//			
//			usuarioService.add(usuario);
//			
			return "usuario registrado exitosamente";
		}
	
	
	@Transactional
	@RequestMapping(value="/registerFBUser.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerFBUser(@RequestParam String nombre, @RequestParam String apellido,
			 @RequestParam String username, @RequestParam String password){
	
		password = PasswordEncoderGenerator.encodePassword(password);
		
		Usuario usuario = new Usuario(username, nombre, apellido, username, password);
		
		
		Rol rolUser = rolService.getRol(1);
		Rol rolFB = rolService.getRol(3);
		Set<Rol> roles = new HashSet<Rol>();
		roles.add(rolUser);	
		roles.add(rolFB);
		usuario.setRoles(roles);
		
		usuarioService.add(usuario);
		
		return "usuario FB registrado exitosamente";
	}
	

}
