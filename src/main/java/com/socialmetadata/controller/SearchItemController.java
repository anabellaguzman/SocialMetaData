package com.socialmetadata.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Item;
import com.socialmetadata.service.ItemService;

@Controller
public class SearchItemController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/searchItem")
	public String setupForm(Map<String, Object> map){
		
		return "searchItem";
		
	}
	
	
	@RequestMapping(value = "/searchItem.do", method = RequestMethod.GET)
	public @ResponseBody List <Item>  searchItem(@RequestParam String term) {	
		
	 
		List<Item> items = itemService.getItemByTitle(term);
		
//		
//		for (Item i : items){
////			
//			System.out.println("Titlo item: " + i.getTitulo());
////			i.getAño();
////			i.getTipo().getDescripcion();
////			
////			System.out.println(i.getTipo().getDescripcion());
////			Set<Autor> autores = i.getAutores();
//			
//			for (Autor a : i.getAutores()){
//				System.out.println("autor nombre"+ a.getNombre());
//				System.out.println("autor apellido"+ a.getApellido());
//			}
//
//			
//		}
		
		
		return items;
		
	}

}
