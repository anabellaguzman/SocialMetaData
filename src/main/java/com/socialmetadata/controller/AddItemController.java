package com.socialmetadata.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.TipoItem;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.TipoItemService;

@Controller
public class AddItemController {

	@Autowired
	private TipoItemService tipoItemService;
	@Autowired
	private ItemService itemService;

	@RequestMapping("/addItem")
	public String setupForm(Map<String, Object> map) {

		System.out.println("addItemController");

		List<TipoItem> listTipoItem = tipoItemService.getAllTipoItem();

		// for (TipoItem tipoItem : listTipoItem){
		//
		// System.out.println("tipoItem descripcion: " +
		// tipoItem.getDescripcion());
		// }
		//
		// map.put("listTipoItem", tipoItemService.getAllTipoItem());
		map.put("listTipoItem", listTipoItem);

		return "addItem";

	}

	@RequestMapping(value = "/selectedTipoItem.do", method = RequestMethod.GET)
	public @ResponseBody TipoItem doActions(@RequestParam int id, Map<String, Object> map) {
		// Integer x = Integer.valueOf(id);
		// // or
//		int id1 = Integer.parseInt(sid);


		 TipoItem tipoItemAtributosLoaded = tipoItemService.getTipoItem(id);
		 	 
		 for (AtributoItem ai : tipoItemAtributosLoaded.getAtributoItem()){	
		 System.out.println(" ValorAtributoItem NOMBRE atributo: "+
		 ai.getNombre());		 
		  }
		 
//		 map.put("tipoItemAtributosLoaded", tipoItemAtributosLoaded);
//		 map.put("enelmap", "SOY DEL MAP");

		
		return tipoItemAtributosLoaded;
	}

}
