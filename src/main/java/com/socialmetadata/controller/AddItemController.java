package com.socialmetadata.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;









import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
public class AddItemController {

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

	@RequestMapping("/addItem")
	public String setupForm(Map<String, Object> map) {

		System.out.println("addItemController");

		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		List<Idioma> listIdioma = idiomaService.getAllIdiomas();


		// for (TipoItem tipoItem : listTipoItem){
		//
		// System.out.println("tipoItem descripcion: " +
		// tipoItem.getDescripcion());
		// }
		//
		// map.put("listTipoItem", tipoItemService.getAllTipoItem());
		map.put("listTipoItem", listTipoItem);
		map.put("listIdioma", listIdioma);

		return "addItem";

	}

	@RequestMapping(value = "/selectedTipoItem.do", method = RequestMethod.GET)
	public @ResponseBody Set<AtributoItem> doActions(@RequestParam int id) {
		// Integer x = Integer.valueOf(id);
		// // or
//		int id1 = Integer.parseInt(sid);


		 TipoItem tipoItemAtributosLoaded = tipoItemService.getTipoItem(id);
		 Set <AtributoItem> atributosLoaded =  tipoItemAtributosLoaded.getAtributoItem();


//		 for (AtributoItem ai: atributosLoaded){
//			 System.out.println(ai.getNombre());
//		 }
		
		return atributosLoaded;
	}
	
	@RequestMapping(value = "/searchAutor.do", method = RequestMethod.GET)
	public @ResponseBody List <Autor>  searchAutor(@RequestParam String term) {
		
//		System.out.println("term: "+term);
		
		List<Autor> autores = autorService.getAutoresLike(term);
		
//		for(Autor a: autores){
//			
//			System.out.println("a.getNombre(): "+a.getNombre()+ " getApellido(): "+ a.getApellido() + " a.getIdAutor(): "+a.getIdAutor());
//		
//		}
		
		return autores;
		
	}
	
	@RequestMapping(value = "/searchTema.do", method = RequestMethod.GET)
	public @ResponseBody List <Tema>  searchTema(@RequestParam String term) {
		List<Tema> temas = temaService.getTemasLike(term);	
		return temas;
		
	}

}
