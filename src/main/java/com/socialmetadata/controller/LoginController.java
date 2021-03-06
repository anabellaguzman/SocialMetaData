package com.socialmetadata.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Users;
import com.socialmetadata.model.Usuario;

@Controller
public class LoginController {
	 @RequestMapping(value = { "/", "/home" })  
	 public String getUserDefault() {  
		 
		 System.out.println(SecurityContextHolder.getContext().getAuthentication());
	  return "home";  
	 }  
	  
	 @RequestMapping("/login")  
	 public ModelAndView getLoginForm(@ModelAttribute Usuario usuario,  
	   @RequestParam(value = "error", required = false) String error,  
	   @RequestParam(value = "logout", required = false) String logout) {  
	  
	  String message = "";  
	  if (error != null) {  
	   message = "Usuario o contraseña incorrectos!";  
	  } else if (logout != null) {  
	   message = "";  //logout successful
	  }  
	  
	  
//	  System.out.println("PASO POR ACA");
	  System.out.println(message);
	  return new ModelAndView("login", "message", message);  
	 }  
	  
	 @RequestMapping("/admin**")  
	 public String getAdminProfile() {  
	  return "admin";  
	 }  
	  
	 @RequestMapping("/user**")  
	 public String getUserProfile() {  
	  return "user";  
	 }  
	  
	 @RequestMapping("/403")  
	 public ModelAndView getAccessDenied() {  
	  Authentication auth = SecurityContextHolder.getContext()  
	    .getAuthentication();  
	  String username = "";  
	  if (!(auth instanceof AnonymousAuthenticationToken)) {  
	   UserDetails userDetail = (UserDetails) auth.getPrincipal();  
	   username = userDetail.getUsername();  
	  }  
	  
	  return new ModelAndView("403", "username", username);  
	 }
}
