package com.socialmetadata.controller;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.SpringVersion;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.modeloDao.embebedPK.ValorAtributoItemEPK;
import com.socialmetadata.service.AtributoItemService;
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
	@Autowired
	private AtributoItemService atributoItemService;

	@RequestMapping(value = "/addItem", method = RequestMethod.GET)
	public String setupForm(Map<String, Object> map, Model model) {

		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();
		List<Idioma> listIdioma = idiomaService.getAllIdiomas();
		// System.out.println("VERSION: "+SpringVersion.getVersion());
		TipoItem firstItem = tipoItemService.getTipoItem(listTipoItem.get(0)
				.getIdTipoItem());
		Set<AtributoItem> atributosFirstItem = firstItem.getAtributoItem();
		map.put("listAtributosFistItem", atributosFirstItem);
		map.put("listTipoItem", listTipoItem);
		map.put("listIdioma", listIdioma);
		// map.put("item", new Item());
		// Item item = new Item();
		// model.addAttribute("item", new Item());

		return "addItem";

	}

	@RequestMapping(value = "/selectedTipoItem.do", method = RequestMethod.GET)
	public @ResponseBody
	Set<AtributoItem> doActions(@RequestParam int id) {
		TipoItem tipoItemAtributosLoaded = tipoItemService.getTipoItem(id);
		Set<AtributoItem> atributosLoaded = tipoItemAtributosLoaded
				.getAtributoItem();
		return atributosLoaded;
	}

	@RequestMapping(value = "/searchAutor.do", method = RequestMethod.GET)
	public @ResponseBody
	List<Autor> searchAutor(@RequestParam String term) {
		List<Autor> autores = autorService.getAutoresLike(term);
		return autores;
	}

	@RequestMapping(value = "/searchTema.do", method = RequestMethod.GET)
	public @ResponseBody
	List<Tema> searchTema(@RequestParam String term) {
		List<Tema> temas = temaService.getTemasLike(term);
		return temas;

	}

	@RequestMapping(value = "/addItem", method = RequestMethod.POST)
	// public @ModelAttribute("message") String addItem(@RequestParam String
	// term) {
	public void addItem(@RequestParam String tituloItem,
			@RequestParam String year, @RequestParam List<String> idAutores,
			@RequestParam List<String> idTemas, @RequestParam int idTipoItem,
			@RequestParam int idIdioma, @RequestParam String descripcion,
			@RequestParam List<String> idOwnAtr, @RequestParam List<String> valOwnAtr
			) {

		Idioma idioma = idiomaService.getIdioma(idIdioma);
		TipoItem tipoItem = tipoItemService.getTipoItem(idTipoItem);

		Item item = new Item();
		item.setTitulo(tituloItem);
		item.setYear(Integer.valueOf(year));
		item.setTipo(tipoItem);
		item.setIdioma(idioma);
		item.setDescripcion(descripcion);

		Set<Autor> autores = new HashSet<Autor>();
		for (int i = 0; i < idAutores.size(); i++) {
			String enteroString = idAutores.get(i);
			int entero = Integer.parseInt(enteroString);
			Autor a = autorService.getAutor(entero);
			autores.add(a);
		}
		item.setAutores(autores);
		
		Set<Tema> temas = new HashSet<Tema>();
		for (int i = 0; i < idTemas.size(); i++) {
			String enteroString = idTemas.get(i);
			int entero = Integer.parseInt(enteroString);
			Tema t = temaService.getTema(entero);
			temas.add(t);
		}
		item.setSetTemas(temas);
		
		
		item.setIdItem(itemService.add(item));
		
		
	
		
//		ACA QUEDE 
//		Set<AtributoItem> atributosItem = new HashSet<AtributoItem>();
		Set<ValorAtributoItem> valorAtributoItem = new HashSet<ValorAtributoItem>();
		
		for (int i = 0; i < idOwnAtr.size(); i++) {
			String enteroString = idOwnAtr.get(i);
			int id = Integer.parseInt(enteroString);
			AtributoItem atributo = atributoItemService.getAtributoItem(id);
			
			ValorAtributoItemEPK pk = new ValorAtributoItemEPK(item, atributo);
			ValorAtributoItem valAI = new ValorAtributoItem(pk, valOwnAtr.get(i));
			valorAtributoItem.add(valAI);
			
			
		}
		
		item.setValorAtributoPropio(valorAtributoItem);
		
		itemService.update(item);

		
		

	}

}
