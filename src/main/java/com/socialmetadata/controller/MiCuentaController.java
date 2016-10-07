package com.socialmetadata.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Item;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.UsuarioService;

@Controller
public class MiCuentaController {

	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private ItemService itemService;
	
	
	@Transactional
	@RequestMapping(value = "/micuenta", method = RequestMethod.GET)
	public ModelAndView setupView() {
		
		System.out.println(SecurityContextHolder.getContext().getAuthentication());
		
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String name = auth.getName(); // get logged in username		
		Usuario usuario = usuarioService.getByUsername(name);
		usuario = usuarioService.getFavoritos(usuario.getIdUsuario());
		ModelAndView mav = new ModelAndView("miCuenta");
		
		Set <Item> favs = usuario.getItemsFavoritos();


		mav.addObject("items", usuario.getItemsFavoritos());

		return mav;
	}

	@Transactional
	@RequestMapping(value = "/addtofavs", method = RequestMethod.GET)
	public String addToFavorites(@RequestParam int idItem) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String name = auth.getName(); // get logged in username
		Item item = itemService.getItem(idItem);
		Usuario usuario = usuarioService.getByUsername(name);
		usuario.addItemsFavoritos(item);
		
		
		return "Ha sido agregado a tus favoritos exitosamente!";
	}
	
	
	@Transactional
	@RequestMapping(value = "/removeFav.do", method = RequestMethod.GET)
	public void removeFavorite(@RequestParam int idItem) {
		
		System.out.println("idItem controller "+ idItem);
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String name = auth.getName(); // get logged in username
		Item item = itemService.getItem(idItem);
		Usuario usuario = usuarioService.getByUsername(name);
		
		usuario.getItemsFavoritos().remove(item);
		
		usuarioService.update(usuario);
		
		
		
		
		
	}

}
