package com.socialmetadata.controller;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.socialmetadata.model.Item;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@RequestMapping("/item")
	// @Transactional(propagation = Propagation.REQUIRES_NEW)
	public void setupForm(int idItem) {

		Item item = itemService.getItem(idItem);

		for (ValorAtributoItem vai : item.getValorAtributoPropio()) {
			System.out.println(" ValorAtributoItem VALOR: " + vai.getValor());
			System.out.println(" ValorAtributoItem NOMBRE atributo: "
					+ vai.getPk().getAtributo().getNombre());
		}

	}
	// public String setupForm(Map<String, Object> map){
	// Item item = new Item();
	//
	// item = itemService.getItem(1);
	//
	// // System.out.println("antes del item.getvaloratributopropio");
	//
	// // Set<ValorAtributoItem> valoratri = item.getValorAtributoPropio();
	//
	//
	//
	//
	// ////
	// ////
	// for (ValorAtributoItem vai : item.getValorAtributoPropio()) {
	// System.out.println("VALOR en controladora");
	// System.out.println(" ValorAtributoItem VALOR: "+vai.getValor());
	// System.out.println(" ValorAtributoItem NOMBRE atributo: "+vai.getPk().getAtributo().getNombre());
	// }
	//
	// map.put("item", item);
	//
	// return "item";
	// }

}
