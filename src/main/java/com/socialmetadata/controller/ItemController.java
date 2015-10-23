package com.socialmetadata.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Item;
import com.socialmetadata.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@RequestMapping(value ="/item",  method = RequestMethod.GET)
	// @Transactional(propagation = Propagation.REQUIRES_NEW)
	public ModelAndView setupForm(Integer idItem) {
		
		ModelAndView mav = new ModelAndView("item");
		Item item = itemService.getItem(idItem);

		mav.addObject("item", item);

	 return mav;
	 }

}
