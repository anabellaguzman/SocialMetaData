package com.socialmetadata.controller;



import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Archivo;
import com.socialmetadata.model.Comentario;
import com.socialmetadata.model.Item;
import com.socialmetadata.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@RequestMapping(value ="/item",  method = RequestMethod.GET)
	// @Transactional(propagation = Propagation.REQUIRES_NEW)
	@Transactional
	public ModelAndView setupForm(Integer idItem) {
		
		ModelAndView mav = new ModelAndView("item");
		Item item = itemService.getItem(idItem);
		itemService.getItemComentarios(item);
		itemService.getItemErrores(item);
		itemService.getItemArchivos(item);

		mav.addObject("item", item);

	 return mav;
	 
	 }

}
