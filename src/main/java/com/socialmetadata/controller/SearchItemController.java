package com.socialmetadata.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Tema;
import com.socialmetadata.model.TipoItem;
import com.socialmetadata.service.AutorService;
import com.socialmetadata.service.IdiomaService;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.TemaService;
import com.socialmetadata.service.TipoItemService;

@Controller
public class SearchItemController {
	
	@Autowired
	private TipoItemService tipoItemService;
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private IdiomaService idiomaService;
	@Autowired
	private AutorService autorService;
	@Autowired
	private TemaService temaService;

	
	@RequestMapping("/advancedSearch")
	public String setupForm(Map<String, Object> map){
		
		
		Idioma idiomaEmpty = new Idioma (0,"");
		TipoItem tipoItemEmpty = new TipoItem (0,"");
		
		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		List<Idioma> listIdioma = idiomaService.getAllIdiomas();
		
		listIdioma.add(idiomaEmpty);
		listTipoItem.add(tipoItemEmpty);
			
		
		TipoItem firstItem = tipoItemService.getTipoItem(listTipoItem.get(0)
				.getIdTipoItem());
		Set<AtributoItem> atributosFirstItem = firstItem.getAtributoItem();
		

		map.put("listAtributosFistItem", atributosFirstItem);
		map.put("listTipoItem", listTipoItem);
		map.put("listIdioma", listIdioma);
		
		return "advancedSearch";
		
	}
	
	
	
	
	@RequestMapping(value = "/advancedSearch.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView advancedSearchItem(@RequestParam String  tituloItem, @RequestParam String year, 
			@RequestParam String idTipoItem,
			@RequestParam String idIdioma,
			@RequestParam List<String> idAutores,
			@RequestParam List<String> idTemas){
		
		System.out.println("SEARCH ITEM CONTROLLER");	
		
		Item item = new Item();		
		if (year == ""){
			year = "0";
		}
				
		item.setTitulo(tituloItem);
		item.setYear(Integer.valueOf(year));
		
		Set<Autor> autores = new HashSet<Autor>();
		for (int i = 0; i < idAutores.size(); i++) {
			String enteroString = idAutores.get(i);
			int entero = Integer.parseInt(enteroString);
			Autor a = autorService.getAutor(entero);
			autores.add(a);
		}
		item.setAutores(autores);	
		
		
		//Temas
		Set<Tema> temas = new HashSet<Tema>();
		for (int i = 0; i < idTemas.size(); i++) {
			String enteroString = idTemas.get(i);
			int entero = Integer.parseInt(enteroString);
			Tema t = temaService.getTema(entero);
			temas.add(t);
		}
		item.setSetTemas(temas);
		
				
		List<Item> items = itemService.advancedSearch(tituloItem, year, idTipoItem, idIdioma, item);			
//	
//		List<Item> items = new ArrayList ();
		
//		items.add(item);
		
		ModelAndView mav = new ModelAndView("tableSearchItem");		
		mav.addObject("items", items);		
		return mav;	
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
