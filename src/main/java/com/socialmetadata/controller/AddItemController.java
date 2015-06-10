package com.socialmetadata.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;







import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.SpringVersion;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Idioma;
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

		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		List<Idioma> listIdioma = idiomaService.getAllIdiomas();
		
//		System.out.println("VERSION: "+SpringVersion.getVersion());

		TipoItem firstItem = tipoItemService.getTipoItem(listTipoItem.get(0).getIdTipoItem());
		Set <AtributoItem> atributosFirstItem =  firstItem.getAtributoItem();
		map.put("listAtributosFistItem", atributosFirstItem);
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
		List<Autor> autores = autorService.getAutoresLike(term);
		return autores;
		
	}
	
	@RequestMapping(value = "/searchTema.do", method = RequestMethod.GET)
	public @ResponseBody List <Tema>  searchTema(@RequestParam String term) {
		List<Tema> temas = temaService.getTemasLike(term);			
		return temas;
		
	}
	


}
