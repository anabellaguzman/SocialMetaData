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
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.TipoItem;
import com.socialmetadata.service.IdiomaService;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.TipoItemService;

@Controller
public class SearchItemController {
	
	@Autowired
	private TipoItemService tipoItemService;
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private IdiomaService idiomaService;
	
	@RequestMapping("/advancedSearch")
	public String setupForm(Map<String, Object> map){
		
		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		List<Idioma> listIdioma = idiomaService.getAllIdiomas();
		TipoItem firstItem = tipoItemService.getTipoItem(listTipoItem.get(0)
				.getIdTipoItem());
		Set<AtributoItem> atributosFirstItem = firstItem.getAtributoItem();
		map.put("listAtributosFistItem", atributosFirstItem);
		map.put("listTipoItem", listTipoItem);
		map.put("listIdioma", listIdioma);
		
		return "advancedSearch";
		
	}
	
	@RequestMapping(value = "/advancedSearch.do", method = RequestMethod.POST)
	public void advancedSearchItem(@RequestParam String  tituloItem, @RequestParam String year){
		
		System.out.println("/advancedSearch.do");
		itemService.advancedSearch(tituloItem, Integer.valueOf(year));
		System.out.println("titulo:"+tituloItem);
		
		
		
	}

	@RequestMapping(value = "/searchItem.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView  searchItem(@RequestParam String term) {	
		

		
		List<Item> items = itemService.getItemByTitle(term);
		
		ModelAndView mav = new ModelAndView("tableSearchItem");
		
		mav.addObject("items", items);
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
		
		return mav;
		
	}
		

}
