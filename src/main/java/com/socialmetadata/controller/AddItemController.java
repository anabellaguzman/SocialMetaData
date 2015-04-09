package com.socialmetadata.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.TipoItem;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.TipoItemService;


@Controller
public class AddItemController {
	
	
	@Autowired
	private TipoItemService tipoItemService;
	
	@RequestMapping("/addItem")
	public String setupForm(Map<String, Object> map){
		
		
		System.out.println("addItemController");

		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		
//		for (TipoItem tipoItem : listTipoItem){
//			
//			System.out.println("tipoItem descripcion: " + tipoItem.getDescripcion());
//		}
//		
//		map.put("listTipoItem", tipoItemService.getAllTipoItem());
		map.put("listTipoItem", listTipoItem);
		
		return "addItem";		
		
	}
	
	@RequestMapping(value="/selectedTipoItem.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute TipoItem tipoItem, BindingResult result, @RequestParam String id, Map<String, Object> map){
//	public String doActions(HttpServletRequest request, Map<String, Object> map){	
		System.out.println("HOLAAAAA");
		return "addItem";
	}
	


}
