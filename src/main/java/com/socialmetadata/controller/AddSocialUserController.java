package com.socialmetadata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.Autor;
import com.socialmetadata.service.AutorService;
import com.socialmetadata.springsocial.SocialUser;
import com.socialmetadata.springsocial.SocialUserDAO;
import com.socialmetadata.springsocial.SocialUserDAOImpl;
import com.socialmetadata.springsocial.SocialUserService;

@Controller
public class AddSocialUserController {
	
	
	@Autowired
	private SocialUserService socialUserService;
	
	
	@RequestMapping(value="/addSocialUser", method=RequestMethod.GET)
	@ResponseBody
	public String addSocialUser(
//			@RequestParam String newAutorNombre, @RequestParam String newAutorApellido
			){
		
		String userId = "ansieguzie"; //your user’s unique username in your application
		String providerId ="facebook"; //  this is the string provider id value, e.g. “facebook”, “twitter”, etc.
		String providerUserId =  "ansieguzief"; // this is the user’s unique id in the provider’s system

				
		SocialUser socialUser = new SocialUser();
		socialUser.setUserId(userId);
		socialUser.setProviderId(providerId);
		socialUser.setProviderUserId(providerUserId);
		
		
		socialUserService.addSocialUser(socialUser);		
		return "Autor guardado exitosamente";
	}

}
